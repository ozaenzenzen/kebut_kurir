import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/forgot_password/presentation/forgot_password_controller.dart';

class NewPasswordScreen extends GetView<ForgotPasswordController> {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.whiteColor1,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.whiteColor1,
          elevation: 10,
          shadowColor: const Color(0xff1018280D),
          centerTitle: true,
          title: Text(
            'Buat Password Baru',
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.nl,
              fontWeight: AppTheme.textConfig.weight.semiBold,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
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
                'Silahkan masukkan password baru kamu.',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.n,
                  fontWeight: AppTheme.textConfig.weight.regular,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Password baru',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.m,
                  fontWeight: AppTheme.textConfig.weight.regular,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => UnderlineTextFieldWidget(
                  hintText: 'Masukkan password baru',
                  label: 'Masukkan password baru',
                  filled: true,
                  controller: controller.passwordBaruController,
                  isObstruct: (controller.showPasswordBaruField.value) ? false : true,
                  onChanged: (String value) {},
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.showPasswordBaruField.value = !controller.showPasswordBaruField.value;
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: controller.showPasswordBaruField.value ? AppTheme.colors.primaryColor : const Color(0xff121419),
                      size: 20.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Konfirmasi Password baru',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.m,
                  fontWeight: AppTheme.textConfig.weight.regular,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => UnderlineTextFieldWidget(
                  hintText: 'ketik ulang password baru',
                  label: 'ketik ulang password baru',
                  filled: true,
                  controller: controller.konfirmasiPasswordBaruController,
                  isObstruct: (controller.showKonfirmasiPasswordBaruField.value) ? false : true,
                  onChanged: (String value) {},
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.showKonfirmasiPasswordBaruField.value = !controller.showKonfirmasiPasswordBaruField.value;
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: controller.showKonfirmasiPasswordBaruField.value ? AppTheme.colors.primaryColor : const Color(0xff121419),
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
            onTap: () {
              controller.resetPassword().then(
                    (_) => DialogsUtils().showSuccessDialog(
                      context: context,
                      title: 'Selamat! Password baru berhasil dibuat',
                      description: 'Sekarang kamu bisa login kembali menggunakan password baru.',
                      primaryButtonText: 'Oke, tutup',
                      primaryOnTap: () {
                        Get.back();
                        Get.back();
                      },
                    ),
                  );
            },
            child: Container(
              alignment: Alignment.center,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppTheme.colors.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Buat Password Baru',
                style: AppTheme.textStyle.whiteTextStyle.copyWith(
                  color: AppTheme.colors.whiteColor1,
                  fontSize: AppTheme.textConfig.size.nl,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
