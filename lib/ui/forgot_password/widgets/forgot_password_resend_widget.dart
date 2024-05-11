import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/features/forgot_password/presentation/forgot_password_controller.dart';

class ForgotPasswordResendWidget extends StatelessWidget {
  final TextEditingController controllerText;
  final ForgotPasswordController controller;
  const ForgotPasswordResendWidget({super.key, required this.controllerText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AssetImageWidget(
          assets: 'assets/ask_ic.png',
          height: 96.w,
          width: 96.w,
        ),
        SizedBox(height: 12.h),
        Text(
          'Apakah kamu yakin ingin mengirim ulang permintaan reset password pada email',
          textAlign: TextAlign.center,
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: AppTheme.colors.greyColor5.withOpacity(0.2),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Text(
            controllerText.text,
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.3,
              child: ButtonCustom(
                text: 'Batal',
                textColor: AppTheme.colors.newGreyColor1,
                buttonColor: AppTheme.colors.buttonGrey,
                textSize: 18.sp,
                onTap: () => Get.back(),
                borderRadius: 6.r,
                paddingVer: 12.w,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.3,
              child: ButtonCustom(
                text: 'Kirim Ulang',
                textColor: AppTheme.colors.newGreyColor1,
                textSize: 18.sp,
                onTap: () async {
                  // final DialogsUtils _dialog = DialogsUtils();
    
                  // _dialog.showLoading();
    
                  await controller.sendEmail().then(
                        (_) async => await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomDialog(
                              title: 'Berhasil',
                              asset: 'assets/check_img.png',
                              subTitle: 'Kami telah mengirimkan Permintaan ulang reset password. Silahkan cek email anda.',
                            );
                          },
                        ),
                      );
    
                  controller.isSend.value = true;
                  // _dialog.hideLoading();
                  Get.offAllNamed(Routes.login);
                },
                borderRadius: 6.r,
                paddingVer: 12.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
