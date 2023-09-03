import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/toast_custom.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/register/presentation/register_controller.dart';
import 'package:kebut_kurir/ui/register/widgets/register_textfield.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Daftar',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Selamat Datang!',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.ll,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Silahkan Lengkapi formulir pendaftaran terlebih dahulu.',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.n,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RegisterTextField(
                        controller: controller.tecNama,
                        label: 'Nama',
                        hint: 'Masukkan nama anda',
                      ),
                      SizedBox(height: 16.h),
                      RegisterTextField(
                        controller: controller.tecEmail,
                        label: 'Email',
                        hint: 'Masukkan Email',
                      ),
                      SizedBox(height: 16.h),
                      RegisterTextField(
                        controller: controller.tecNoHp,
                        inputType: TextInputType.phone,
                        label: 'No Handphone',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          child: Text(
                            '+62',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.bold,
                            ),
                          ),
                        ),
                        hint: 'Nomor Handphone',
                      ),
                      SizedBox(height: 16.h),
                      RegisterTextField(
                        controller: controller.tecAlamat,
                        label: 'Alamat Saat ini',
                        hint: 'Masukkan alamat anda',
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ButtonCustom(
              text: 'Lanjut',
              textColor: AppTheme.colors.blackColor2,
              textSize: 18,
              onTap: () {
                // Get.toNamed(Routes.registerUploadDocumentScreen);
                controller.registerStepOne(
                  onSucces: () {
                    Get.toNamed(Routes.registerUploadDocumentScreen);
                  },
                  onFailed: (String value) {
                    showToast(value);
                  },
                );
              },
              isActive: controller.buttonNextActive(),
              borderRadius: 6.r,
              paddingVer: 13,
            ),
          ),
          SizedBox(
            height: 16.h,
          )
        ],
      ),
    );
  }
}
