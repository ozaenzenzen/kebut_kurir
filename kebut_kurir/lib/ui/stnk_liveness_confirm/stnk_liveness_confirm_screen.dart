import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/features/register/data/verify_stnk_model.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_result_args.dart';
import 'package:kebut_kurir/features/stnk_kendaraan_liveness/presentation/stnk_kendaraan_liveness_binding.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/presentation/stnk_liveness_confirm_controller.dart';
import 'package:kebut_kurir/ui/stnk_kendaraan_liveness/stnk_kendaraan_liveness_screen.dart';
import 'package:kebut_kurir/ui/stnk_liveness_confirm/widgets/confirm_data_field_widget.dart';
import 'package:kebut_kurir/ui/stnk_liveness_confirm/widgets/confirm_data_radio_widget.dart';

class STNKLivenessConfirmScreen extends GetView<STNKLivenessConfirmController> {
  const STNKLivenessConfirmScreen({super.key});

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
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Periksa kembali data kamu',
                          textAlign: TextAlign.start,
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.ll,
                            fontWeight: AppTheme.textConfig.weight.semiBold,
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        Text(
                          'Pastikan data kamu sudah sesuai dengan data yang ada pada STNK.',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.n,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Foto STNK',
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
                        SizedBox(height: 6.h),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.stnkLivenessScreen),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppTheme.colors.greyColor2.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                'Ketuk untuk mengambil ulang foto',
                                style: AppTheme.textStyle.whiteTextStyle.copyWith(
                                  fontSize: AppTheme.textConfig.size.sm,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Ukuran foto max 10Mb dan menggunakan format JPG, Jpeg, atau PNG',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.sm,
                            color: AppTheme.colors.greyColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      children: <Widget>[
                        Obx(
                          () => controller.listTransportationTypes.isEmpty
                              ? const ConfirmDataRadioWidget(
                                  label: 'Jenis Kendaraan',
                                  listValue: ['Roda 2', 'Roda 4'],
                                )
                              : ConfirmDataRadioWidget(
                                  label: 'Jenis Kendaraan',
                                  listValue: controller.listTransportationTypes,
                                ),
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(label: 'Merk Kendaraan', hint: 'Merk Kendaraan anda', controller: controller.tecMerkKendaraan),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(label: 'Type Kendaraan', hint: 'Type Kendaraan anda', controller: controller.tecTypeKendaraan),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(label: 'Plat No Kendaraan', hint: 'Plat no Kendaraan anda', controller: controller.tecPlatnoKendaraan),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          label: 'Tahun Kendaraan',
                          hint: 'Tahun Kendaraan anda',
                          controller: controller.tecTahunKendaraan,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(label: 'Tanggal Pajak Kendaraan', hint: 'Tanggal Pajak Kendaraan anda', controller: controller.tecPajakKendaraan),
                        SizedBox(height: 16.h),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            'Status Kepemilikan Kendaraan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.semiBold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showBottomSheetSubjectComplain(context, size);
                          },
                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF5F6F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      child: Obx(
                                    () => Text(
                                      controller.selectedJenisKepemilikan.value,
                                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                                        color: controller.radioButtonValue.value == -1 ? const Color(0xFF7C7E83) : const Color(0xFF404040),
                                        fontSize: AppTheme.textConfig.size.n,
                                        fontWeight: AppTheme.textConfig.weight.regular,
                                      ),
                                    ),
                                  )),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 24,
                                  color: Color(0xFF42526D),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),

                        SizedBox(
                          width: size.width,
                          child: Text(
                            'Foto Kendaraan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.semiBold,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    String? result = await Get.to(
                                      const STNKKEndaraanLivenessScreen(),
                                      binding: STNKKendaraanLivenessBinding(),
                                      transition: Transition.rightToLeftWithFade,
                                    );
                                    print("FOTO DEPAN RESULT $result");
                                    if (result != null) {
                                      if (result.isNotEmpty) {
                                        controller.kendaraanDepan.value = File(result);
                                        // Get.back();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          margin: const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF5F6F7),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          ),
                                          child: Obx(
                                            () => controller.kendaraanDepan.value != null
                                                ? Image.file(
                                                    controller.kendaraanDepan.value!,
                                                  )
                                                : Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        size: 25.w,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(height: 6),
                                                      Text(
                                                        'Tampak Depan',
                                                        textAlign: TextAlign.center,
                                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                                          color: AppTheme.colors.blackColor2,
                                                          fontSize: AppTheme.textConfig.size.n,
                                                          fontWeight: AppTheme.textConfig.weight.regular,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => controller.kendaraanDepan.value == null
                                              ? Container()
                                              : Positioned(
                                                  right: 0,
                                                  top: -12,
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.cancel,
                                                      color: Color(0xFFFE0000),
                                                      size: 24,
                                                    ),
                                                    onPressed: () {
                                                      controller.kendaraanDepan.value = null;
                                                    },
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () async {
                                    String? result = await Get.to(
                                      const STNKKEndaraanLivenessScreen(),
                                      binding: STNKKendaraanLivenessBinding(),
                                      transition: Transition.rightToLeftWithFade,
                                    );
                                    print("FOTO BELAKANG RESULT $result");
                                    if (result != null) {
                                      if (result.isNotEmpty) {
                                        controller.kendaraanBelakang.value = File(result);
                                        // Get.back();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          margin: const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF5F6F7),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          ),
                                          child: Obx(
                                            () => controller.kendaraanBelakang.value != null
                                                ? Image.file(
                                                    controller.kendaraanBelakang.value!,
                                                  )
                                                : Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        size: 25.w,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(height: 6),
                                                      Text(
                                                        'Tampak Belakang',
                                                        textAlign: TextAlign.center,
                                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                                          color: AppTheme.colors.blackColor2,
                                                          fontSize: AppTheme.textConfig.size.n,
                                                          fontWeight: AppTheme.textConfig.weight.regular,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => controller.kendaraanBelakang.value == null
                                              ? Container()
                                              : Positioned(
                                                  right: 0,
                                                  top: -12,
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.cancel,
                                                      color: Color(0xFFFE0000),
                                                      size: 24,
                                                    ),
                                                    onPressed: () {
                                                      controller.kendaraanBelakang.value = null;
                                                    },
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () async {
                                    String? result = await Get.to(
                                      const STNKKEndaraanLivenessScreen(),
                                      binding: STNKKendaraanLivenessBinding(),
                                      transition: Transition.rightToLeftWithFade,
                                    );
                                    print("FOTO KIRI RESULT $result");
                                    if (result != null) {
                                      if (result.isNotEmpty) {
                                        controller.kendaraanSampingKiri.value = File(result);
                                        // Get.back();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          margin: const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF5F6F7),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          ),
                                          child: Obx(
                                            () => controller.kendaraanSampingKiri.value != null
                                                ? Image.file(
                                                    controller.kendaraanSampingKiri.value!,
                                                  )
                                                : Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        size: 25.w,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(height: 6),
                                                      Text(
                                                        'Tampak Samping Kiri',
                                                        textAlign: TextAlign.center,
                                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                                          color: AppTheme.colors.blackColor2,
                                                          fontSize: AppTheme.textConfig.size.n,
                                                          fontWeight: AppTheme.textConfig.weight.regular,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => controller.kendaraanSampingKiri.value == null
                                              ? Container()
                                              : Positioned(
                                                  right: 0,
                                                  top: -12,
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.cancel,
                                                      color: Color(0xFFFE0000),
                                                      size: 24,
                                                    ),
                                                    onPressed: () {
                                                      controller.kendaraanSampingKiri.value = null;
                                                    },
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () async {
                                    String? result = await Get.to(
                                      const STNKKEndaraanLivenessScreen(),
                                      binding: STNKKendaraanLivenessBinding(),
                                      transition: Transition.rightToLeftWithFade,
                                    );
                                    print("FOTO KANAN RESULT $result");
                                    if (result != null) {
                                      if (result.isNotEmpty) {
                                        controller.kendaraansampingKanan.value = File(result);
                                        // Get.back();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          margin: const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF5F6F7),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          ),
                                          child: Obx(
                                            () => controller.kendaraansampingKanan.value != null
                                                ? Image.file(
                                                    controller.kendaraansampingKanan.value!,
                                                  )
                                                : Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        size: 25.w,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(height: 6),
                                                      Text(
                                                        'Tampak Samping Kanan',
                                                        textAlign: TextAlign.center,
                                                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                                                          color: AppTheme.colors.blackColor2,
                                                          fontSize: AppTheme.textConfig.size.n,
                                                          fontWeight: AppTheme.textConfig.weight.regular,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => controller.kendaraansampingKanan.value == null
                                              ? Container()
                                              : Positioned(
                                                  right: 0,
                                                  top: -12,
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.cancel,
                                                      color: Color(0xFFFE0000),
                                                      size: 24,
                                                    ),
                                                    onPressed: () {
                                                      controller.kendaraansampingKanan.value = null;
                                                    },
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                )
                              ],
                            ),
                          ),
                        )
                        // SizedBox(height: 16.h),
                        // Obx(
                        //   () => ConfirmDataDropDownWidget(
                        //     label: 'Status Perkawinan',
                        //     listMenu: const [
                        //       'Lajang',
                        //       'Menikah',
                        //       'Cerai Hidup',
                        //       'Cerai Mati',
                        //     ],
                        //     valueList: controller.valueStatusPerkawinan.value,
                        //     hint: 'Status',
                        //     onChanged: (String? v) {
                        //       if (v != null) {
                        //         controller.valueStatusPerkawinan.value = v;
                        //       }
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: const Offset(0, -4), // Menggeser bayangan ke atas
                ),
              ],
            ),
            child: ButtonCustom(
              text: 'Simpan',
              textColor: AppTheme.colors.blackColor2,
              height: 48,
              onTap: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: 'Apakah data kamu sudah benar?',
                      primaryButtonText: 'Lanjut',
                      secondaryButtonText: 'Periksa Kembali',
                      reverseButton: true,
                      onTapSecondary: (data) {
                        Get.back();
                      },
                      buttonDirection: ButtonDirection.HORIZONTAL,
                      asset: 'assets/ic_confirm.png',
                      subTitle: 'Pastikan data kamu telah sesuai',
                      onTapPrimary: () {
                        // print("OCR VALUE : ${ controller.ocr.value!.path}");
                        // Get.offNamedUntil(Routes.registerUploadDocumentScreen, (route) => false);
                        Get.back();
                        Get.back();
                        Get.back();
                        Get.back(
                          result: STNKResultArgs(
                            kendaraanBelakang: controller.kendaraanBelakang.value,
                            kendaraanDepan: controller.kendaraanDepan.value,
                            kendaraanSampingKiri: controller.kendaraanSampingKiri.value,
                            kendaraansampingKanan: controller.kendaraansampingKanan.value,
                            stnk: controller.stnk.value,
                          ),
                        );
                        // Get.offAndToNamed(
                        //   Routes.ktpGuide,
                        //   arguments: KtpOcrArgs(
                        //     card: controller.card,
                        //     ocr: controller.ocr!,
                        //     ocrCropped: controller.ocrCropped!,
                        //   ),
                        // );
                      },
                    );
                  },
                );
                // await controller.verifyDataStnk(
                //   body: VerifyStnkBodyModel(
                //     uuidTransportationTypes: controller.uuidTransportationType(),
                //     uuidVehicleOwnershipsUser: controller.uuidVehicleOwnership(),
                //     dateVehicles: controller.tecPajakKendaraan.text,
                //     merk: controller.tecMerkKendaraan.text,
                //     platNumber: controller.tecPlatnoKendaraan.text,
                //     type: controller.tecTypeKendaraan.text,
                //     yearVehicles: controller.tecTahunKendaraan.text,
                //   ),
                //   onSucces: () async {
                //     await showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (BuildContext context) {
                //         return CustomDialog(
                //           title: 'Apakah data kamu sudah benar?',
                //           primaryButtonText: 'Lanjut',
                //           secondaryButtonText: 'Periksa Kembali',
                //           reverseButton: true,
                //           onTapSecondary: (data) {
                //             Get.back();
                //           },
                //           buttonDirection: ButtonDirection.HORIZONTAL,
                //           asset: 'assets/ic_confirm.png',
                //           subTitle: 'Pastikan data kamu telah sesuai',
                //           onTapPrimary: () {
                //             // print("OCR VALUE : ${ controller.ocr.value!.path}");
                //             // Get.offNamedUntil(Routes.registerUploadDocumentScreen, (route) => false);
                //             Get.back();
                //             Get.back();
                //             Get.back();
                //             Get.back(
                //               result: STNKResultArgs(
                //                 kendaraanBelakang: controller.kendaraanBelakang.value,
                //                 kendaraanDepan: controller.kendaraanDepan.value,
                //                 kendaraanSampingKiri: controller.kendaraanSampingKiri.value,
                //                 kendaraansampingKanan: controller.kendaraansampingKanan.value,
                //                 stnk: controller.stnk.value,
                //               ),
                //             );
                //             // Get.offAndToNamed(
                //             //   Routes.ktpGuide,
                //             //   arguments: KtpOcrArgs(
                //             //     card: controller.card,
                //             //     ocr: controller.ocr!,
                //             //     ocrCropped: controller.ocrCropped!,
                //             //   ),
                //             // );
                //           },
                //         );
                //       },
                //     );
                //   },
                //   onFailed: (value) {},
                // );
              },
              width: MediaQuery.of(context).size.width,
              borderRadius: 6,
              paddingVer: 11,
            ),
          ),
        ],
      ),
    );
  }
}
