import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_args.dart';

class STNKLivenessController extends GetxController {
  final DialogsUtils dialogsUtils = DialogsUtils();
  List<CameraDescription>? cameras;
  CameraController? cameraController;
  GlobalKey cameraKey = GlobalKey();
  GlobalKey cameraWidgetKey = GlobalKey();

  RxBool isCameraInit = false.obs;
  RxBool isCameraFlashOn = false.obs;

  initCamera() async {
    cameras = await availableCameras();
    CameraDescription camera = cameras!.firstWhere((CameraDescription cam) => cam.lensDirection == CameraLensDirection.front);
    cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    cameraController!.initialize().then((_) {
      onSetFlashModeButtonPressed(FlashMode.off);
      isCameraInit.value = true;
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
    takePicture().then(
      (XFile? file) async {
        final XFile? imageCaptured = file;
        final File tempImage = File(imageCaptured!.path);
        File compressedFile = await FlutterNativeImage.compressImage(
          tempImage.path,
          quality: 50,
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
