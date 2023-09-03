import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/toast_custom.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/features/ktp_liveness/presentation/ktp_liveness_binding.dart';
import 'package:kebut_kurir/features/ktp_ocr/presentation/ktp_ocr_binding.dart';
import 'package:kebut_kurir/features/register_upload_document/args/ktp_liveness_args.dart';
import 'package:kebut_kurir/features/register_upload_document/args/sim_args.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_result_args.dart';
import 'package:kebut_kurir/features/register_upload_document/presentation/register_upload_document_controller.dart';
import 'package:kebut_kurir/features/static_page/presentation/static_page_binding.dart';
import 'package:kebut_kurir/features/stnk_liveness/presentation/stnk_liveness_binding.dart';
import 'package:kebut_kurir/ui/ktp_liveness/ktp_liveness_screen.dart';
import 'package:kebut_kurir/ui/ktp_ocr/ktp_ocr_screen.dart';
import 'package:kebut_kurir/ui/register_upload_document/widgets/ktp/ktp_bottom_sheet_guide.dart';
import 'package:kebut_kurir/ui/register_upload_document/widgets/register_upload_document_empty_widget.dart';
import 'package:kebut_kurir/ui/register_upload_document/widgets/selfie_ktp/liveness_guide_bottom_sheet.dart';
import 'package:kebut_kurir/ui/register_upload_document/widgets/sim/sim_guide_bottom_sheet.dart';
import 'package:kebut_kurir/ui/register_upload_document/widgets/stnk/stnk_guide_bttom_sheet.dart';
import 'package:kebut_kurir/ui/static_page/static_page_screen.dart';
import 'package:kebut_kurir/ui/stnk_liveness/stnk_liveness_screen.dart';

class RegisterUploadDocumentScreen extends GetView<RegisterUploadDocumentController> {
  const RegisterUploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Daftar',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload Dokumen',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ll,
                        fontWeight: AppTheme.textConfig.weight.semiBold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Harap menyiapkan dokumen dibawah ini',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.n,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Obx(
                      () => controller.ocrKtp.value != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Foto KTP',
                                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                                    fontSize: AppTheme.textConfig.size.m,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  decoration: BoxDecoration(
                                    color: AppTheme.colors.whiteColor4,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Image.file(
                                      File(controller.ocrKtp.value!.path),
                                      width: 145.w,
                                      height: 110.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                InkWell(
                                  onTap: () async {
                                    controller.guideDialog.showBottomSheet(
                                      withStrip: true,
                                      radius: 20.r,
                                      padding: EdgeInsets.all(16.w),
                                      content: KtpBottomSheetGuide(
                                        nextStep: () async {
                                          String? result = await Get.to(
                                            const KTPOcrScreen(),
                                            binding: KTPOcrBinding(),
                                            transition: Transition.rightToLeftWithFade,
                                          );
                                          print("FOTO KTP RESULT $result");
                                          if (result != null) {
                                            if (result.isNotEmpty) {
                                              controller.ocrKtp.value = File(result);
                                              Get.back();
                                            }
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: size.width,
                                    // height: 100,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                    child: Center(
                                      child: Text(
                                        'Ketuk untuk mengambil ulang foto',
                                        textAlign: TextAlign.center,
                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                          fontSize: AppTheme.textConfig.size.ml,
                                          color: Colors.white,
                                          fontWeight: AppTheme.textConfig.weight.regular,
                                          height: 1.33,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : RegisterUploadDocumentEmptyWidget(
                              title: 'Foto KTP',
                              size: size,
                              description: 'Ukuran foto max 10Mb dan menggunakan format JPG, Jpeg, atau PNG',
                              placeHolderText: 'Ambil Foto e-KTP',
                              onTap: () {
                                controller.guideDialog.showBottomSheet(
                                  withStrip: true,
                                  radius: 20.r,
                                  padding: EdgeInsets.all(16.w),
                                  content: KtpBottomSheetGuide(
                                    nextStep: () async {
                                      String? result = await Get.to(
                                        const KTPOcrScreen(),
                                        binding: KTPOcrBinding(),
                                        transition: Transition.rightToLeftWithFade,
                                      );
                                      print("FOTO KTP RESULT $result");
                                      if (result != null) {
                                        if (result.isNotEmpty) {
                                          controller.ocrKtp.value = File(result);
                                          Get.back();
                                        }
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                    SizedBox(height: 32.h),
                    Obx(
                      () => controller.liveness.value != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Foto Selfie KTP',
                                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                                    fontSize: AppTheme.textConfig.size.m,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  decoration: BoxDecoration(
                                    color: AppTheme.colors.whiteColor4,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Image.file(
                                      File(controller.liveness.value!.path),
                                      width: 145.w,
                                      height: 110.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                InkWell(
                                  onTap: () async {
                                    controller.guideDialog.showBottomSheet(
                                      withStrip: true,
                                      radius: 20.r,
                                      padding: EdgeInsets.all(16.w),
                                      content: LivenessGuideBottomSheet(
                                        onTap: () async {
                                          String? result = await Get.to(
                                            const KTPLivenessScreen(),
                                            binding: KTPLivenessBinding(),
                                            transition: Transition.rightToLeftWithFade,
                                            arguments: KtpLivenessArgs(
                                              card: OcrEnum.KTP,
                                              nik: '317181612030003',
                                              name: 'Yerikho',
                                              address: 'Jln Pendidikan',
                                              rtRw: '06/006',
                                              subDistrict: 'cijantung',
                                              district: 'Pasar rebo',
                                              city: 'Jakarta',
                                              province: 'Jakarta',
                                              pob: '12',
                                              dob: '12',
                                              height: '190',
                                              profession: 'Programmer',
                                              expired: '',
                                              bloodType: '0',
                                              citizenship: 'Indonesia',
                                              maritalStatus: 'belum kawin',
                                              religion: 'Katolik',
                                              gender: 'Male',
                                              // ktpImage: controller.ocrKtp.value!,
                                            ),
                                          );
                                          print("SELFIE RESULT : $result");
                                          if (result != null) {
                                            if (result.isNotEmpty) {
                                              controller.liveness.value = File(result);
                                              Get.back();
                                            }
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: size.width,
                                    // height: 100,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                    child: Center(
                                      child: Text(
                                        'Ketuk untuk mengambil ulang foto',
                                        textAlign: TextAlign.center,
                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                          fontSize: AppTheme.textConfig.size.ml,
                                          color: Colors.white,
                                          fontWeight: AppTheme.textConfig.weight.regular,
                                          height: 1.33,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : RegisterUploadDocumentEmptyWidget(
                              title: 'Foto Selfie KTP',
                              size: size,
                              description: 'Ukuran foto max 10Mb dan menggunakan format JPG, Jpeg, atau PNG',
                              placeHolderText: 'Ambil Foto Selfie KTP',
                              onTap: () {
                                controller.guideDialog.showBottomSheet(
                                  withStrip: true,
                                  radius: 20.r,
                                  padding: EdgeInsets.all(16.w),
                                  content: LivenessGuideBottomSheet(
                                    onTap: () async {
                                      String? result = await Get.to(
                                        const KTPLivenessScreen(),
                                        binding: KTPLivenessBinding(),
                                        transition: Transition.rightToLeftWithFade,
                                        arguments: KtpLivenessArgs(
                                          card: OcrEnum.KTP,
                                          nik: '317181612030003',
                                          name: 'Yerikho',
                                          address: 'Jln Pendidikan',
                                          rtRw: '06/006',
                                          subDistrict: 'cijantung',
                                          district: 'Pasar rebo',
                                          city: 'Jakarta',
                                          province: 'Jakarta',
                                          pob: '12',
                                          dob: '12',
                                          height: '190',
                                          profession: 'Programmer',
                                          expired: '',
                                          bloodType: '0',
                                          citizenship: 'Indonesia',
                                          maritalStatus: 'belum kawin',
                                          religion: 'Katolik',
                                          gender: 'Male',
                                          // ktpImage: controller.ocrKtp.value!,
                                        ),
                                      );
                                      print("SELFIE RESULT : $result");
                                      if (result != null) {
                                        if (result.isNotEmpty) {
                                          controller.liveness.value = File(result);
                                          Get.back();
                                        }
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                    SizedBox(height: 32.h),
                    Obx(
                      () => controller.sim.value != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Foto SIM',
                                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                                    fontSize: AppTheme.textConfig.size.m,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  decoration: BoxDecoration(
                                    color: AppTheme.colors.whiteColor4,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Image.file(
                                      File(controller.sim.value!.path),
                                      width: 145.w,
                                      height: 110.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                InkWell(
                                  onTap: () async {
                                    controller.guideDialog.showBottomSheet(
                                      withStrip: true,
                                      radius: 20.r,
                                      padding: EdgeInsets.all(16.w),
                                      content: SIMGuideBottomSheet(
                                        nextStep: () async {
                                          String? result = await Get.to(const KTPLivenessScreen(),
                                              binding: KTPLivenessBinding(),
                                              transition: Transition.rightToLeftWithFade,
                                              arguments: SimArgs(
                                                // ktpImage: controller.ocrKtp.value!,
                                                card: OcrEnum.KTP,
                                                //         )
                                              ));
                                          print("SIM RESULT : $result");
                                          if (result != null) {
                                            if (result.isNotEmpty) {
                                              controller.sim.value = File(result);
                                              Get.back();
                                            }
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: size.width,
                                    // height: 100,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                    child: Center(
                                      child: Text(
                                        'Ketuk untuk mengambil ulang foto',
                                        textAlign: TextAlign.center,
                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                          fontSize: AppTheme.textConfig.size.ml,
                                          color: Colors.white,
                                          fontWeight: AppTheme.textConfig.weight.regular,
                                          height: 1.33,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : RegisterUploadDocumentEmptyWidget(
                              title: 'Foto SIM',
                              size: size,
                              description: 'Ukuran foto max 10Mb dan menggunakan format JPG, Jpeg, atau PNG',
                              placeHolderText: 'Ambil Foto SIM',
                              onTap: () {
                                controller.guideDialog.showBottomSheet(
                                  withStrip: true,
                                  radius: 20.r,
                                  padding: EdgeInsets.all(16.w),
                                  content: SIMGuideBottomSheet(
                                    nextStep: () async {
                                      String? result = await Get.to(const KTPLivenessScreen(),
                                          binding: KTPLivenessBinding(),
                                          transition: Transition.rightToLeftWithFade,
                                          arguments: SimArgs(
                                            // ktpImage: controller.ocrKtp.value!,
                                            card: OcrEnum.KTP,
                                            //         )
                                          ));
                                      print("SIM RESULT : $result");
                                      if (result != null) {
                                        if (result.isNotEmpty) {
                                          controller.sim.value = File(result);
                                          Get.back();
                                        }
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                    SizedBox(height: 32.h),
                    Obx(
                      () => controller.stnk.value != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Foto STNK & Data Kendaraan (Wajib)',
                                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                                    fontSize: AppTheme.textConfig.size.m,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  decoration: BoxDecoration(
                                    color: AppTheme.colors.whiteColor4,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Image.file(
                                      File(controller.stnk.value!.path),
                                      width: 145.w,
                                      height: 110.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    controller.guideDialog.showBottomSheet(
                                      withStrip: true,
                                      radius: 20.r,
                                      padding: EdgeInsets.all(16.w),
                                      content: STNKGuideBottomSheet(
                                        nextStep: () async {
                                          STNKResultArgs? result = await Get.to(
                                            const STNKLivenessScreen(),
                                            binding: STNKLivenessBinding(),
                                            transition: Transition.rightToLeftWithFade,
                                          );
                                          print("SELFIE RESULT : $result");
                                          if (result != null) {
                                            controller.stnk.value = result.stnk;
                                            controller.kendaraanBelakang.value = result.kendaraanBelakang;
                                            controller.kendaraanDepan.value = result.kendaraanDepan;
                                            controller.kendaraansampingKanan.value = result.kendaraansampingKanan;
                                            controller.kendaraanSampingKiri.value = result.kendaraanSampingKiri;
                                            Get.back();
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: size.width,
                                    // height: 100,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                    child: Center(
                                      child: Text(
                                        'Ketuk untuk mengambil ulang foto',
                                        textAlign: TextAlign.center,
                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                          fontSize: AppTheme.textConfig.size.ml,
                                          color: Colors.white,
                                          fontWeight: AppTheme.textConfig.weight.regular,
                                          height: 1.33,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : RegisterUploadDocumentEmptyWidget(
                              title: 'Foto STNK & Data Kendaraan',
                              size: size,
                              description: 'Ukuran foto max 10Mb dan menggunakan format JPG, Jpeg, atau PNG',
                              placeHolderText: 'Ambil Foto STNK',
                              onTap: () {
                                controller.guideDialog.showBottomSheet(
                                  withStrip: true,
                                  radius: 20.r,
                                  padding: EdgeInsets.all(16.w),
                                  content: STNKGuideBottomSheet(
                                    nextStep: () async {
                                      STNKResultArgs? result = await Get.to(
                                        const STNKLivenessScreen(),
                                        binding: STNKLivenessBinding(),
                                        transition: Transition.rightToLeftWithFade,
                                      );
                                      print("SELFIE RESULT : $result");
                                      if (result != null) {
                                        controller.stnk.value = result.stnk;
                                        controller.kendaraanBelakang.value = result.kendaraanBelakang;
                                        controller.kendaraanDepan.value = result.kendaraanDepan;
                                        controller.kendaraansampingKanan.value = result.kendaraansampingKanan;
                                        controller.kendaraanSampingKiri.value = result.kendaraanSampingKiri;
                                        Get.back();
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Obx(
                      () => Checkbox(
                        value: controller.isAgree.value,
                        onChanged: (bool? value) async {
                          bool? result = await Get.to(
                            const StaticPageScreen(),
                            binding: StaticPageBinding(),
                            arguments: 'term',
                            transition: Transition.rightToLeftWithFade,
                          );
                          if (result != null) {
                            controller.isAgree.value = result;
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Saya menyetujui Syarat Ketentuan Layanan dan Kebijakan Privasi Kebut Express.',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => ButtonCustom(
                      text: 'Daftar',
                      isActive: controller.ocrKtp.value != null && controller.isAgree.value && controller.stnk.value != null && controller.liveness.value != null && controller.sim.value != null,
                      textColor: Colors.white,
                      textSize: 18,
                      onTap: () async {
                        await controller.uploadAllSingle(
                          onSuccess: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Pendaftaran Berhasil',
                                  primaryButtonText: 'Masuk',
                                  asset: 'assets/check_img.png',
                                  subTitle: 'Selamat, akun anda akan telah didaftarkan.',
                                  onTapPrimary: () {
                                    Get.offNamed(Routes.login);
                                  },
                                );
                              },
                            );
                          },
                          onFailed: (value) {
                            showToast(value);
                          },
                        );
                      },
                      borderRadius: 6.r,
                      paddingVer: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
