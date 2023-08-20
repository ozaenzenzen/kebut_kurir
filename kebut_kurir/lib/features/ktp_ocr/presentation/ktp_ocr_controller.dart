import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:kebut_kurir/core/utils/globalkey_extension.dart';
import 'package:kebut_kurir/features/register_upload_document/args/ktp_ocr_args.dart';

class KTPOcrController extends GetxController {
  OcrEnum digitalCard = OcrEnum.KTP;
  final DialogsUtils dialogsUtils = DialogsUtils();

  GlobalKey cameraKey = GlobalKey();
  GlobalKey headerKey = GlobalKey();
  GlobalKey cameraWidgetKey = GlobalKey();
  GlobalKey screenKey = GlobalKey();

  List<CameraDescription>? cameras;
  RxBool isCameraInit = false.obs;
  RxBool isCameraFlashOn = false.obs;
  CameraController? cameraController;
  Rx<File?> croppedFile = Rx<File?>(null);

  initCamera() async {
    cameras = await availableCameras();
    CameraDescription camera = cameras!.firstWhere((CameraDescription cam) => cam.lensDirection == CameraLensDirection.back);
    cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    cameraController!.initialize().then((_) {
      isCameraInit.value = true;
      onSetFlashModeButtonPressed(FlashMode.off);
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

  void onTakePictureButtonPressed() {
    dialogsUtils.showLoading();
    takePicture().then((XFile? file) async {
      XFile? imageCaptured;
      File tempImage;
      imageCaptured = file;
      tempImage = File(imageCaptured!.path);
      File compressedFile = await FlutterNativeImage.compressImage(
        imageCaptured.path,
        quality: 50,
        percentage: 100,
      );
      ImageProperties properties = await FlutterNativeImage.getImageProperties(compressedFile.path);

      int heightPhoto = 0;
      double yValue = 0.0;
      if (properties.orientation == ImageOrientation.rotate90) {
        heightPhoto = ((properties.height! / 5) * 4).toInt();
        yValue = ((cameraKey.globalPaintBounds!.top - cameraWidgetKey.globalPaintBounds!.top) / cameraWidgetKey.globalPaintBounds!.height) * 100;
        yValue = (yValue / 100) * properties.width!;
      } else {
        heightPhoto = ((properties.width! / 5) * 4).toInt();
        yValue = ((cameraKey.globalPaintBounds!.top - cameraWidgetKey.globalPaintBounds!.top) / cameraWidgetKey.globalPaintBounds!.height) * 100;
        yValue = (yValue / 100) * properties.height!;
      }
      try {
        if (properties.orientation == ImageOrientation.rotate90) {
          croppedFile.value = await FlutterNativeImage.cropImage(
            tempImage.path,
            yValue.round(), // Y
            0, // X
            heightPhoto, // HEIGHT
            properties.height!,
          ); // WIDTH
        } else {
          croppedFile.value = await FlutterNativeImage.cropImage(
            tempImage.path,
            0, // X
            yValue.round(), // Y
            properties.width!, //WIDTH
            heightPhoto,
          ); //HEIGHT
        }
        dialogsUtils.hideLoading();
        Get.toNamed(
          Routes.ocrKtpResult,
          arguments: KtpOcrArgs(
            card: digitalCard,
            ocr: tempImage,
            ocrCropped: croppedFile.value!,
          ),
        );
      } catch (e) {
        Fimber.e('$e');
        dialogsUtils.hideLoading();
      }
      // setState(() {});
      if (file != null) Fimber.d('Picture saved to ${file.path}');
    });
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mode == FlashMode.off) {
        isCameraFlashOn.value = false;
      } else if (mode == FlashMode.torch) {
        isCameraFlashOn.value = true;
      } else {
        isCameraFlashOn.value = false;
      }
      Fimber.d('Flash mode set to ${mode.toString().split('.').last}');
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
    if (Get.arguments != null) {
      if (Get.arguments is OcrEnum) {
        final OcrEnum? args = Get.arguments as OcrEnum?;
        if (args != null) {
          digitalCard = args;
        }
      }
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    Fimber.d('dispose called');
    cameraController?.dispose();
    super.dispose();
  }
}
