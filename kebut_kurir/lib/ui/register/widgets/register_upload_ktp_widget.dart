import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/features/register/presentation/register_controller.dart';

class RegisterUploadKtpWidget extends GetView<RegisterController> {
  const RegisterUploadKtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ktpGuide),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.colors.blackColor2, width: 1),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 13.sp),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colors.blackColor2, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    controller.argument ? 'Dokumen Terupload' : 'Upload dokumenmu',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.l,
                      fontWeight: AppTheme.textConfig.weight.bold,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    controller.argument ? 'Click untuk melihat dokumen' : 'Harap menyiapkan dokumen KTP',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.m,
                      color: AppTheme.colors.greyColor4,
                    ),
                  ),
                ],
              ),
              AssetImageWidget(
                assets: 'assets/ktp.png',
                height: 50.w,
                width: 84.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
