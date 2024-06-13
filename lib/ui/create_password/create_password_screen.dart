import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/create_password/presentation/create_password_controller.dart';

class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: const Color(0xff1018280d),
            centerTitle: true,
            title: Text(
              'Buat Password',
              style: AppTheme.textStyle.blackTextStyle.copyWith(
                fontSize: AppTheme.textConfig.size.nl,
                fontWeight: AppTheme.textConfig.weight.semiBold,
              ),
            ),
            leading: InkWell(
              onTap: () {
                // Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppTheme.colors.blackColor1,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icon_ubah_password_page_yellow.png',
                    height: 120.h,
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Silakan daftarkan email dan password kamu',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.n,
                    fontWeight: AppTheme.textConfig.weight.regular,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Email',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.m,
                    fontWeight: AppTheme.textConfig.weight.regular,
                  ),
                ),
                SizedBox(height: 6.h),
                UnderlineTextFieldWidget(
                  hintText: 'Masukkan email',
                  label: 'Masukkan email',
                  filled: false,
                  enabled: false,
                  controller: controller.emailController,
                  onChanged: (String value) {},
                ),
                SizedBox(height: 16.h),
                Text(
                  'Password',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.m,
                    fontWeight: AppTheme.textConfig.weight.regular,
                  ),
                ),
                SizedBox(height: 6.h),
                Obx(
                  () => UnderlineTextFieldWidget(
                    hintText: 'Masukkan password',
                    label: 'Masukkan password',
                    filled: true,
                    controller: controller.passwordController,
                    isObstruct: (controller.showPasswordBaruField.value) ? false : true,
                    onChanged: (String value) {},
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.showPasswordBaruField.value = !controller.showPasswordBaruField.value;
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        color: controller.showPasswordBaruField.value ? AppTheme.colors.primaryColor2 : AppTheme.colors.greyColor6,
                        size: 20.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Konfirmasi Password',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.m,
                    fontWeight: AppTheme.textConfig.weight.regular,
                  ),
                ),
                SizedBox(height: 6.h),
                Obx(
                  () => UnderlineTextFieldWidget(
                    hintText: 'ketik ulang password',
                    label: 'ketik ulang password',
                    filled: true,
                    controller: controller.confirmPasswordController,
                    isObstruct: (controller.showKonfirmasiPasswordBaruField.value) ? false : true,
                    onChanged: (String value) {},
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.showKonfirmasiPasswordBaruField.value = !controller.showKonfirmasiPasswordBaruField.value;
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        color: controller.showKonfirmasiPasswordBaruField.value ? AppTheme.colors.primaryColor2 : AppTheme.colors.greyColor6,
                        size: 20.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 80.h,
            padding: EdgeInsets.all(16.h),
            child: InkWell(
              onTap: () async {
                if (controller.emailController.text.isEmpty || controller.passwordController.text.isEmpty || controller.confirmPasswordController.text.isEmpty) {
                  //
                } else {
                  await controller.createPassword(
                    onSuccess: () {
                      DialogsUtils().showSuccessDialog(
                        context: context,
                        title: 'Selamat! Password berhasil dibuat',
                        description: 'Sekarang kamu bisa melakukan login',
                        primaryButtonText: 'Ke Halaman Login',
                        primaryOnTap: () {
                          Get.offAllNamed(Routes.login);
                        },
                      );
                    },
                    onFailed: (errorMessage) {
                      DialogsUtils().showFailedDialog(
                        context: context,
                        title: 'Terjadi kesalahan',
                        description: errorMessage,
                        primaryButtonText: 'Kembali',
                        primaryOnTap: () {
                          Get.back();
                        },
                      );
                    },
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppTheme.colors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Buat Password',
                  style: AppTheme.textStyle.whiteTextStyle.copyWith(
                    color: AppTheme.colors.neutral500,
                    fontSize: AppTheme.textConfig.size.nl,
                    fontWeight: AppTheme.textConfig.weight.semiBold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
