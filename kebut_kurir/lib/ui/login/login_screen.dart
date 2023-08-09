import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';

import 'package:kebut_kurir/features/login/presentation/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(15.w, 57.h, 15.w, 47.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.h),
                    AssetImageWidget(
                      assets: 'assets/logo_new.png',
                      width: 100.w,
                      height: 30.h,
                    ),
                    SizedBox(height: 47.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Masuk',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.ll,
                            fontWeight: AppTheme.textConfig.weight.semiBold,
                          ),
                        ),
                        Text(
                          'Masukkan email dan password yang telah kamu daftarkan.',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.n,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alamat Email',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.sm,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: UnderlineTextFieldWidget(
                            withBorder: false,
                            filled: true,
                            isDense: true,
                            controller: controller.tecEmail,
                            hintText: 'Masukkan alamat email anda',
                          ),
                        ),
                        SizedBox(height: 26.h),
                        Text(
                          'Password',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.sm,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: Obx(
                            () => UnderlineTextFieldWidget(
                              withBorder: false,
                              filled: true,
                              isObstruct: controller.viewPass.value,
                              controller: controller.tecPass,
                              suffixIcon: Icon(
                                controller.viewPass.value ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              hintText: 'Masukkan password anda',
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.forgotPassword),
                            child: Text(
                              'Lupa Password?',
                              style: AppTheme.textStyle.primaryTextStyle.copyWith(
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.bold,
                                color: AppTheme.colors.primaryColor2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: controller.isError.value,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: AppTheme.colors.errorColor3,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.info,
                                  color: AppTheme.colors.textErrorColor,
                                  size: 24.w,
                                ),
                                SizedBox(width: 14.w),
                                Obx(
                                  () => Text(
                                    controller.errorText.value,
                                    style: AppTheme.textStyle.whiteTextStyle.copyWith(
                                      fontSize: AppTheme.textConfig.size.sm,
                                      color: AppTheme.colors.textErrorColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ButtonCustom(
                          text: 'Masuk',
                          textSize: 18,
                          buttonColor: Color(0xFFFFFF00),
                          onTap: () async {
                            // if (controller.tecEmail.text.isNotEmpty && controller.tecPass.text.isNotEmpty) {
                            //   // await controller.loginUser().then(
                            //   //   (value) {
                            //   //     if (value != null) {
                            //   //       Get.offNamed(Routes.main);
                            //   //     }
                            //   //   },
                            //   // );
                            //   Get.offNamed(Routes.main);
                            // } else {
                            //   controller.dialogsUtils.showToastMessage('Lengkapi email dan password kamu');
                            // }
                            Get.offNamed(Routes.main);
                          },
                          borderRadius: 6,
                          textColor: Color(0xFF42526D),
                          paddingVer: 13,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Divider(
                        color: AppTheme.colors.whiteColor4,
                        endIndent: 0,
                        height: 0,
                        indent: 0,
                        thickness: 2,
                      ),
                      SizedBox(height: 16.h),
                      RichText(
                        text: TextSpan(
                          text: 'Belum punya akun?',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.n,
                            color: Color(0xFF121419),
                          ),
                          children: [
                            TextSpan(
                              text: ' Daftar Sekarang',
                              recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.register, arguments: false),
                              style: AppTheme.textStyle.primaryTextStyle.copyWith(
                                fontSize: AppTheme.textConfig.size.n,
                                fontWeight: AppTheme.textConfig.weight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
