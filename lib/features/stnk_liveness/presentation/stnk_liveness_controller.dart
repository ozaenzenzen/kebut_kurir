import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_args.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class STNKLivenessController extends GetxController {
  final DialogsUtils dialogsUtils = DialogsUtils();
  List<CameraDescription>? cameras;
  CameraController? cameraController;
  GlobalKey cameraKey = GlobalKey();
  GlobalKey renderKey = GlobalKey(debugLabel: 'Render');
  GlobalKey cameraWidgetKey = GlobalKey();

  RxBool isCameraInit = false.obs;
  RxBool isCameraFlashOn = false.obs;

  // double scaleCamera = 0;

  initCamera() async {
    cameras = await availableCameras();
    CameraDescription camera = cameras!.firstWhere((CameraDescription cam) => cam.lensDirection == CameraLensDirection.back);
    cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    cameraController!.initialize().then((_) {
      onSetFlashModeButtonPressed(FlashMode.off);
      isCameraInit.value = true;
      update();
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? controller = cameraController;
    if (controller == null || !controller.value.isInitialized) {
      Fimber.d('Error: select a camera first.');
      return null;
    }

    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      Fimber.d('$e');
      return null;
    }
  }

  Rxn<File?> fileCapture = Rxn<File?>();
  Size sizeWholeWidget = Size(0, 0);
  Size sizeWidgetTakePicture = Size(0, 0);
  Size sizeWidgetPaddingTop = Size(0, 0);

  Future<XFile?> takePictureWithKeyV2() async {
    try {
      var captureCamera = await cameraController!.takePicture();
      fileCapture.value = File(captureCamera.path);
      onSetFlashModeButtonPressed(FlashMode.off);
      await cameraController!.pausePreview();
      await Future.delayed(const Duration(seconds: 1));
      var ssPicture1 = await takePictureWithKey(keys: renderKey);
      var ssPicture = File(ssPicture1!.path);
      ImageProperties ssProperties = await FlutterNativeImage.getImageProperties(ssPicture.path);
      double cusScaleHeight = (ssProperties.height! / sizeWholeWidget.height);
      //* Value Padding
      double paddingHorizontalCrop = (sizeWholeWidget.width - sizeWidgetTakePicture.width);
      double widthPhotoCrop = ssProperties.width! - paddingHorizontalCrop;
      double heightPhotoCrop = 1 / widthPhotoCrop;
      // double heightPhotoCrop = ((widthPhotoCrop / dataOcrFeature.ratioWidth) * dataOcrFeature.ratioHeight);
      int originY = (2 * cusScaleHeight).round();
      // int originY = (sizeWidgetPaddingTop.height * cusScaleHeight).round();
      int originX = paddingHorizontalCrop.round();
      var resultFile = await FlutterNativeImage.cropImage(
        ssPicture.path,
        originX,
        originY,
        widthPhotoCrop.round(),
        heightPhotoCrop.round(),
      );
      return XFile(resultFile.path);
    } catch (e) {
      cameraController!.resumePreview();
      return null;
    }
  }

  Future<XFile?> takePictureWithKey({required GlobalKey keys}) async {
    final CameraController? controller = cameraController;
    Uint8List? sharedImageList;

    if (controller == null || !controller.value.isInitialized) {
      Fimber.d('Error: select a camera first.');
      return null;
    }

    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      var boundary = keys.currentContext?.findRenderObject() as RenderRepaintBoundary;
      // RenderObject? renderObject = testRenderObject;
      // RenderObject? renderObject = keys.currentContext?.findRenderObject();
      // RenderBox renderBox = renderObject! as RenderBox;
      // RenderRepaintBoundary boundary = RenderRepaintBoundary(child: renderBox);
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      // ui.Image image = await boundary.toImage(pixelRatio: renderBox.size.aspectRatio);
      ByteData? pngByteData = await image.toByteData(format: ui.ImageByteFormat.png);
      sharedImageList = pngByteData?.buffer.asUint8List();

      final appDir = await getTemporaryDirectory();
      String path = '${appDir.path}/${DateTime.now().millisecond}.png';
      File file = File(path);
      await file.writeAsBytes(sharedImageList!.toList());
      XFile xfile = XFile(file.path);
      return xfile;

      // XFile file = await controller.takePicture();
      // return file;
    } on CameraException catch (e) {
      debugPrint('error ${e.toString()}');
      Fimber.d('$e');
      return null;
    }
  }

  Future<File?> _rotateImage(String imagePath) async {
    try {
      // Read the image file
      final File imageFile = File(imagePath);
      Uint8List imageBytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(imageBytes);

      // Rotate the image
      if (image != null) {
        image = img.copyRotate(
          image,
          angle: 90,
        ); // Rotate by 90 degrees
        // Save the rotated image
        return await imageFile.writeAsBytes(img.encodePng(image));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void onTakePictureButtonPressed() {
    dialogsUtils.showLoading();
    takePicture().then(
      (XFile? file) async {
        final XFile? imageCaptured = file;
        final File tempImage = File(imageCaptured!.path);
        final File? rotate = await _rotateImage(imageCaptured.path);
        // final File? rotate = await compute(
        //   _rotateImage,
        //   tempImage.path,
        // );
        File compressedFile = await FlutterNativeImage.compressImage(
          rotate!.path,
          quality: 70,
          percentage: 100,
        );
        dialogsUtils.hideLoading();
        Get.toNamed(
          Routes.stnkLivenessResultScreen,
          arguments: STNKArgs(
            stnk: tempImage,
            compressedFile: compressedFile,
          ),
        );
      },
    );
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      Fimber.d('Flash mode set to ${mode.toString().split('.').last}');
      if (mode == FlashMode.off) {
        isCameraFlashOn.value = false;
      } else if (mode == FlashMode.torch) {
        isCameraFlashOn.value = true;
      } else {
        isCameraFlashOn.value = false;
      }
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null) {
      return;
    }

    try {
      await cameraController!.setFlashMode(mode);
    } on CameraException catch (e) {
      Fimber.e('$e');
      rethrow;
    }
  }

  @override
  void onInit() async {
    initCamera();
    super.onInit();
  }

  RenderObject? testRenderObject;
  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testRenderObject = renderKey.currentContext?.findRenderObject() as RenderBox;
      debugPrint('result $testRenderObject');
      // debugPrint('result ${testRenderObject}');
    });
    // scaleCamera = cameraController!.value.aspectRatio * Get.mediaQuery.size.aspectRatio;
  }

  @override
  void onClose() {
    super.onClose();
    Fimber.d('dispose called');
    cameraController?.dispose();
    super.dispose();
  }
}
