import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/forgot_password/presentation/forgot_password_controller.dart';
import 'package:kebut_kurir/ui/forgot_password/widgets/forgot_password_resend_widget.dart';
import 'package:kebut_kurir/ui/register/widgets/register_textfield.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          child: const AppBarWidget(
            title: 'Lupa Password',
          ),
          preferredSize: Size.fromHeight(56.h),
        ),
        body: Obx(
          () => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(15.w, 34.h, 15.w, 41.h),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AssetImageWidget(
                        assets: 'assets/icon_forgot_password.png',
                        height: 125.h,
                        width: 125.w,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        controller.isSend.value ? 'Permintaan reset password anda telah terkirim silahkan cek kotak masuk email anda' : 'Silahkan masukkan alamat email anda untuk permintaan reset password.',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          fontSize: AppTheme.textConfig.size.ml,
                        ),
                      ),
                      SizedBox(height: 35.h),
                      RegisterTextField(
                        label: 'Email',
                        hint: 'Masukkan alamat email anda',
                        controller: controller.tecEmail,
                        onChanged: (String value) {
                          if (value.isNotEmpty) {
                            controller.emailFilled.value = true;
                          } else {
                            controller.emailFilled.value = false;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Obx(
                () => controller.isSend.value
                    ? Obx(
                        () => Visibility(
                          visible: controller.isSend.value,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                text: 'Belum terima email?',
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  fontSize: AppTheme.textConfig.size.ml,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' Kirim Ulang',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async => await controller.bottomSheetUtils.showBottomSheet(
                                            withStrip: true,
                                            radius: 20.r,
                                            padding: EdgeInsets.all(16.w),
                                            content: ForgotPasswordResendWidget(
                                              controllerText: controller.tecEmail,
                                              controller: controller,
                                            ),
                                          ),
                                    style: AppTheme.textStyle.primaryTextStyle.copyWith(
                                      color: AppTheme.colors.secondaryColor,
                                      fontSize: AppTheme.textConfig.size.ml,
                                      fontWeight: AppTheme.textConfig.weight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : ButtonCustom(
                        text: 'Kirim',
                        textSize: 18,
                        buttonColor: controller.emailFilled.value == true ? AppTheme.colors.primaryColor : AppTheme.colors.disabledColor,
                        textColor: controller.emailFilled.value == true ? AppTheme.colors.neutral500 : AppTheme.colors.whiteColor1,
                        onTap: () async {
                          if (controller.tecEmail.text.isEmpty) {
                            await DialogsUtils().showFailedDialog(
                              context: context,
                              title: 'Gagal',
                              description: 'Anda belum mengisi email',
                            );
                          } else {
                            if (controller.isSend.value) {
                              Get.offNamed(Routes.login);
                            } else {
                              FocusManager.instance.primaryFocus?.unfocus();
                              await controller.sendEmail(
                                onSuccess: () {
                                  DialogsUtils().showSuccessDialog(
                                    context: context,
                                    title: 'Berhasil',
                                    description: 'Permintaan reset password anda telah terkirim. Silahkan cek email anda',
                                    useTimeOut: false,
                                  );
                                },
                                onFailed: (String errorMessage) {
                                  DialogsUtils().showFailedDialog(
                                    context: context,
                                    title: 'Terjadi Kesalahan',
                                    description: errorMessage,
                                    useTimeOut: false,
                                  );
                                },
                              );
                              controller.isSend.value = true;
                            }
                          }
                        },
                        borderRadius: 10,
                        paddingVer: 13,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
