import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/sim_liveness/sim_liveness_controller.dart';
import 'package:kebut_kurir/ui/ktp_liveness/widgets/ktp_ocr_button_widget.dart';

class SIMLivenessScreen extends GetView<SIMLivenessController> {
  const SIMLivenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // if (controller.cameraController == null) {
    //   return Container();
    // }
    // if (!controller.cameraController!.value.isInitialized) {
    //   return Container();
    // }
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.w,
            ),
            onPressed: () => Get.back(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Obx(
                () => Icon(
                  !controller.isCameraFlashOn.value
                      ? Icons.flash_off_rounded
                      : controller.isCameraFlashOn.value
                          ? Icons.flash_on_rounded
                          : Icons.flash_off_rounded,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (controller.cameraController?.value.flashMode == FlashMode.off) {
                  controller.onSetFlashModeButtonPressed(FlashMode.torch);
                } else {
                  controller.onSetFlashModeButtonPressed(FlashMode.off);
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.flip_camera_ios,
                color: Colors.white,
              ),
              onPressed: () async {
                final lensDirection = controller.cameraController?.description.lensDirection;
                CameraDescription? newDescription;
                if (lensDirection == CameraLensDirection.front) {
                  newDescription = controller.cameras!.firstWhere((description) => description.lensDirection == CameraLensDirection.back);
                } else {
                  newDescription = controller.cameras!.firstWhere((description) => description.lensDirection == CameraLensDirection.front);
                }
                controller.cameras = await availableCameras();

                controller.cameraController = CameraController(
                  newDescription,
                  ResolutionPreset.max,
                  imageFormatGroup: ImageFormatGroup.jpeg,
                );
                controller.cameraController!.initialize().then((_) {
                  controller.onSetFlashModeButtonPressed(FlashMode.off);
                });
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            _cameraPreview(),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 160,
                    color: Colors.black.withOpacity(0.4),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        child: Text(
                          controller.isSim.value
                              ? 'Scan SIM kamu, pastikan SIM kamu berada di di area yang sudah ditentukan'
                              : 'Pastikan wajah dan KTP kamu tepat berada di area yang sudah ditentukan',
                          textAlign: TextAlign.center,
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: AppTheme.textConfig.size.n,
                            fontWeight: AppTheme.textConfig.weight.medium,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 5 / 4,
                    key: controller.cameraKey,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.srcOut,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.4),
                      child: UnconstrainedBox(
                        child: KtpOcrButtonWidget(
                          onTap: () => controller.onTakePictureButtonPressed(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraPreview() {
    return Obx(
      () => !controller.isCameraInit.value
          ? Container()
          : SizedBox(
              width: double.infinity,
              key: controller.cameraWidgetKey,
              height: double.infinity,
              child: CameraPreview(
                controller.cameraController!,
              ),
            ),
    );
  }
}
