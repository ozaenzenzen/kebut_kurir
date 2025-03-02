import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/globalkey_extension.dart';
import 'package:kebut_kurir/features/register_upload_document/args/sim_args.dart';
import 'package:kebut_kurir/features/sim_liveness/sim_liveness_args.dart';
import 'package:kebut_kurir/features/sim_liveness_result/sim_liveness_result_args.dart';

class SIMLivenessController extends GetxController {
  final DialogsUtils dialogsUtils = DialogsUtils();
  List<CameraDescription>? cameras;
  CameraController? cameraController;
  GlobalKey cameraKey = GlobalKey();
  GlobalKey cameraWidgetKey = GlobalKey();
  SIMLivenessArgs? data;
  SimArgs? data2;
  RxBool isCameraInit = false.obs;
  RxBool isCameraFlashOn = false.obs;
  RxBool isSim = false.obs;

  initCamera() async {
    cameras = await availableCameras();

    CameraDescription camera = cameras!.firstWhere(
      (CameraDescription cam) => isSim.value ? cam.lensDirection == CameraLensDirection.back : cam.lensDirection == CameraLensDirection.front,
    );
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

  Rx<File?> croppedFile = Rx<File?>(null);

  void onTakePictureButtonPressed() async {
    try {
      dialogsUtils.showLoading();
      // takePicture().then(
      //   (XFile? file) async {

      //   },
      // );

      XFile? file = await takePicture();
      final XFile? imageCaptured = file;
      final File tempImage = File(imageCaptured!.path);
      File compressedFile = await FlutterNativeImage.compressImage(
        tempImage.path,
        quality: 50,
        percentage: 100,
      );
      ImageProperties properties = await FlutterNativeImage.getImageProperties(compressedFile.path);

      int heightPhoto = 0;
      double yValue = 0.0;
      // if (properties.orientation == ImageOrientation.rotate90) {
      heightPhoto = ((properties.height! / 6) * 4).toInt();
      yValue = ((cameraKey.globalPaintBounds!.top - cameraWidgetKey.globalPaintBounds!.top) / cameraWidgetKey.globalPaintBounds!.height) * 100;
      yValue = (yValue / 90) * properties.width!;
      // } else {
      //   heightPhoto = ((properties.width! / 6) * 4).toInt();
      //   yValue = ((cameraKey.globalPaintBounds!.top - cameraWidgetKey.globalPaintBounds!.top) / cameraWidgetKey.globalPaintBounds!.height) * 100;
      //   yValue = (yValue / 90) * properties.height!;
      // }
      // if (properties.orientation == ImageOrientation.rotate90) {
      croppedFile.value = await FlutterNativeImage.cropImage(
        tempImage.path,
        yValue.round(), // Y
        0, // X
        heightPhoto, // HEIGHT
        properties.height!,
      ); // WIDTH
      // } else {
      //   croppedFile.value = await FlutterNativeImage.cropImage(
      //     tempImage.path,
      //     0, // X
      //     yValue.round(), // Y
      //     properties.width!, //WIDTH
      //     heightPhoto,
      //   ); //HEIGHT
      // }
      dialogsUtils.hideLoading();
      if (data != null) {
        Get.toNamed(
          Routes.simLivenessResult,
          arguments: SIMLivenessResultArgs(
            card: data!.card,
            nik: data!.nik,
            name: data!.name,
            address: data!.address,
            rtRw: data!.rtRw,
            subDistrict: data!.subDistrict,
            district: data!.district,
            city: data!.city,
            province: data!.province,
            pob: data!.pob,
            dob: data!.dob,
            height: data!.height,
            profession: data!.profession,
            expired: data!.expired,
            bloodType: data!.bloodType,
            citizenship: data!.citizenship,
            maritalStatus: data!.maritalStatus,
            religion: data!.religion,
            gender: data!.gender,
            ktpImage: tempImage,
            croppedKtpImage: tempImage,
            // liveness: compressedFile,
            liveness: croppedFile.value,
          ),
        );
      } else {
        Get.toNamed(
          Routes.simLivenessResult,
          arguments: SIMLivenessResultArgs(
            card: data2!.card,
            nik: '',
            name: '',
            address: '',
            rtRw: '',
            subDistrict: '',
            district: '',
            city: '',
            province: '',
            pob: '',
            dob: '',
            height: '',
            profession: '',
            expired: '',
            bloodType: '',
            citizenship: '',
            maritalStatus: '',
            religion: '',
            gender: '',
            ktpImage: tempImage,
            croppedKtpImage: tempImage,
            // liveness: compressedFile,
            liveness: croppedFile.value,
          ),
        );
      }
    } catch (e) {
      dialogsUtils.hideLoading();
    }
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
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments is SIMLivenessArgs) {
        final SIMLivenessArgs? args = Get.arguments as SIMLivenessArgs?;
        if (args != null) {
          data = args;
        }
      }
      if (Get.arguments is SimArgs) {
        final SimArgs? args = Get.arguments as SimArgs?;
        if (args != null) {
          data2 = args;
        }
      }
    }

    if (data != null && data2 == null) {
      isSim.value = false;
    } else if (data == null && data2 != null) {
      isSim.value = true;
    } else {
      if (data2 != null) {
        isSim.value = true;
      } else {
        isSim.value = false;
      }
    }
    initCamera();
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
