import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/stnk_liveness_result/presentation/stnk_liveness_result_controller.dart';

class STNKLivenessResultScreen extends GetView<STNKLivenessResultController> {
  const STNKLivenessResultScreen({super.key});

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
              () => controller.stnk.value == null
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(controller.stnk.value!.path),
                        width: MediaQuery.of(context).size.width,
                        // width: 250.w,
                        height: 300.h,
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
  }
}
