import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/dash_widget/dotted_border_widget.dart';
import 'package:kebut_kurir/features/ktp_ocr/presentation/ktp_ocr_controller.dart';
import 'package:kebut_kurir/ui/ktp_ocr/widget/ktp_ocr_button_widget.dart';

class KTPOcrScreen extends GetView<KTPOcrController> {
  final bool isSelfie;
  const KTPOcrScreen({
    super.key,
    this.isSelfie = false,
  });

  @override
  Widget build(BuildContext context) {
    // if (controller.cameraController == null) {
    //   return Container();
    // }
    // if (!controller.cameraController!.value.isInitialized) {
    //   return Container();
    // }
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SizedBox(
        key: controller.screenKey,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Obx(
                () => IconButton(
                  icon: Icon(
                    !controller.isCameraFlashOn.value
                        ? Icons.flash_off_rounded
                        : controller.isCameraFlashOn.value
                            ? Icons.flash_on_rounded
                            : Icons.flash_off_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (controller.cameraController?.value.flashMode == FlashMode.off) {
                      controller.onSetFlashModeButtonPressed(FlashMode.torch);
                    } else {
                      controller.onSetFlashModeButtonPressed(FlashMode.off);
                    }
                  },
                ),
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              // _cameraPreview(),
              Obx(
                () => !controller.isCameraInit.value
                    ? Container()
                    : Container(
                        width: double.infinity,
                        key: controller.cameraWidgetKey,
                        height: double.infinity,
                        child: CameraPreview(
                          controller.cameraController!,
                        ),
                      ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Visibility(
                      visible: isSelfie == false,
                      child: Container(
                        width: double.infinity,
                        key: controller.headerKey,
                        padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                        child: Text(
                          'Mohon posisikan kartu ${controller.digitalCard.name} sesuai dengan, garis bantu yang disediakan.',
                          textAlign: TextAlign.center,
                          style: AppTheme.textStyle.whiteTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.m,
                            fontWeight: AppTheme.textConfig.weight.semiBold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DottedBorder(
                        child: AspectRatio(
                          key: controller.cameraKey,
                          aspectRatio: 6 / 4,
                          child: Container(
                            width: 315.w,
                            height: 205.h,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 37),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DottedBorder(
                                  child: SizedBox(
                                    width: 170.w,
                                    height: 18.h,
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    DottedBorder(
                                      child: SizedBox(
                                        width: 75.w,
                                        height: 104.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: UnconstrainedBox(
                  child: KtpOcrButtonWidget(
                    onTap: () => controller.onTakePictureButtonPressed(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
