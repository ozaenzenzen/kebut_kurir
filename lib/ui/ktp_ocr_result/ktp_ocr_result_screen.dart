import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/ktp_ocr_result/presentation/ktp_ocr_result_controller.dart';

class KTPOcrResultScreen extends GetView<KTPOcrResultController> {
  const KTPOcrResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Daftar',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        color: AppTheme.colors.whiteColor,
        child: Column(
          children: <Widget>[
            Text(
              'Periksa kembali Hasil Foto',
              style: AppTheme.textStyle.blackTextStyle.copyWith(
                fontSize: AppTheme.textConfig.size.l,
                fontWeight: AppTheme.textConfig.weight.semiBold,
              ),
            ),
            SizedBox(height: 34.h),
            Obx(
              () => controller.ocrCropped.value == null
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(controller.ocrCropped.value!.path),
                        width: 280.w,
                        height: 355.h,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Jika foto ini menurut kamu kurang jelas, kamu dapat mengulangi proses foto.',
              textAlign: TextAlign.center,
              style: AppTheme.textStyle.blackTextStyle.copyWith(
                fontSize: AppTheme.textConfig.size.n,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonCustom(
              text: 'Ulangi',
              onTap: () => Get.back(),
              textSize: 16,
              borderRadius: 10,
              textColor: AppTheme.colors.blackColor2,
              height: 48.h,
              buttonColor: const Color(0xFFFFFFE6),
              width: MediaQuery.of(context).size.width / 2.7,
              paddingVer: 13,
            ),
            SizedBox(height: 8.h),
            ButtonCustom(
              text: 'Gunakan Foto ini',
              textSize: 16,
              borderRadius: 10,
              height: 48.h,
              buttonColor: AppTheme.colors.primaryColor,
              onTap: () {
                controller.onPressToNextStep();
              },
              // withBorder: true,
              textColor: AppTheme.colors.blackColor2,
              width: MediaQuery.of(context).size.width / 2.7,
              paddingVer: 13,
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     padding: EdgeInsets.symmetric(horizontal: 20.w),
    //     color: AppTheme.colors.secondaryColor2,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: <Widget>[
    //         Text(
    //           'Mohon pastikan foto kartu E-KTP sudah sesuai dengan garis bantu, dan terlihat jelas.',
    //           style: AppTheme.textStyle.whiteTextStyle.copyWith(
    //             fontSize: AppTheme.textConfig.size.m,
    //             fontWeight: AppTheme.textConfig.weight.semiBold,
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //         Obx(
    //           () => controller.ocrCropped.value == null
    //               ? const Text("Image Kosong")
    //               : ClipRRect(
    //                   borderRadius: BorderRadius.circular(8),
    //                   child: Image.file(
    //                     File(controller.ocrCropped.value!.path),
    //                     width: 315.w,
    //                     height: 245.h,
    //                     fit: BoxFit.fitWidth,
    //                   ),
    //                 ),
    //         ),
    //         Column(
    //           children: <Widget>[
    //             ButtonCustom(
    //               text: 'Lanjut',
    //               textSize: 18,
    //               onTap: () => controller.onPressToNextStep(),
    //               borderRadius: 10,
    //               width: MediaQuery.of(context).size.width,
    //               textColor: Colors.white,
    //               paddingVer: 13,
    //             ),
    //             SizedBox(height: 8.h),
    //             ButtonCustom(
    //               text: 'Foto Ulang',
    //               textSize: 18,
    //               borderRadius: 10,
    //               onTap: () => Get.back(),
    //               withBorder: true,
    //               buttonColor: Colors.transparent,
    //               textColor: AppTheme.colors.secondaryColor3,
    //               width: MediaQuery.of(context).size.width,
    //               paddingVer: 13,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
