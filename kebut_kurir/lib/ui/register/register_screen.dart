import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/insert_photo_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/register/presentation/register_controller.dart';
import 'package:kebut_kurir/ui/register/widgets/empty_profile.dart';
import 'package:kebut_kurir/ui/register/widgets/register_by_usage_widget.dart';
import 'package:kebut_kurir/ui/register/widgets/register_textfield.dart';
import 'package:kebut_kurir/ui/register/widgets/type_usage_widget.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.w, 24.h, 15.w, 24.h),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 63.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  SizedBox(height: 24.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.whiteColor4,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Foto Profil',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.sm,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        InsertPhotoWidget(
                          size: 60,
                          isProfile: true,
                          onImageSelected: (ImageData imgResult) {
                            controller.photoProfile = imgResult.filePath!;
                          },
                          placeholderWidget: Column(
                            children: [
                              const EmptyProfile(),
                              SizedBox(height: 8.h),
                              Text(
                                'Upload Foto',
                                style: AppTheme.textStyle.primaryTextStyle.copyWith(
                                  fontSize: AppTheme.textConfig.size.sm,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Penggunaan',
                        textAlign: TextAlign.start,
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          fontSize: AppTheme.textConfig.size.ssm,
                          color: AppTheme.colors.greyColor2,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => TypeUsageWidget(
                              groupValue: controller.usageType.value,
                              value: 'Pribadi',
                              onChanged: (v) {
                                if (v != null) {
                                  controller.usageType.value = v;
                                }
                              },
                            ),
                          ),
                          Obx(
                            () => TypeUsageWidget(
                              groupValue: controller.usageType.value,
                              value: 'Perusahaan',
                              onChanged: (v) {
                                if (v != null) {
                                  controller.usageType.value = v;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.usageType.value == 'Perusahaan',
                          child: RegisterByUsageWidget(
                            controller: controller,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.viewPass.value = !controller.viewPass.value;
                                  },
                                  child: Obx(
                                    () => Icon(
                                      controller.viewPass.value ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                hintText: 'Masukkan password anda',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konfirmasi Password',
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
                                isObstruct: controller.viewPassConfirm.value,
                                controller: controller.tecPassConfirm,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.viewPassConfirm.value = !controller.viewPassConfirm.value;
                                  },
                                  child: Obx(
                                    () => Icon(
                                      controller.viewPassConfirm.value ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                hintText: 'Masukkan password anda',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 86),
              Obx(
                () => Visibility(
                  visible: controller.isShowKeyboard.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: controller.keyboardHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: AppTheme.colors.greyColor6,
              width: 1,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ButtonCustom(
                text: 'Lanjut',
                textColor: Colors.white,
                textSize: 18,
                onTap: () {
                  // controller.registerStepOne(
                  //   onSucces: () {
                  //     Get.toNamed(Routes.ktpGuide);
                  //   },
                  //   onFailed: (String value) {
                  //     showToast(value);
                  //   },
                  // );
                },
                borderRadius: 6.r,
                paddingVer: 13,
              ),
            ),
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                text: 'Sudah punya akun?',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.n,
                  color: AppTheme.colors.greyColor3,
                ),
                children: [
                  TextSpan(
                    text: ' Masuk',
                    recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(Routes.login, arguments: false),
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
    );
  }
}
