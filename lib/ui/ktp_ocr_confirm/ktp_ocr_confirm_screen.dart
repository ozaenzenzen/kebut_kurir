import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/presentation/ktp_ocr_confirm_controller.dart';
import 'package:kebut_kurir/features/register/data/verify_ktp_model.dart';
import 'package:kebut_kurir/ui/ktp_ocr_confirm/widgets/confirm_data_drop_down_widget.dart';
import 'package:kebut_kurir/ui/ktp_ocr_confirm/widgets/confirm_data_field_widget.dart';
import 'package:kebut_kurir/ui/ktp_ocr_confirm/widgets/confirm_data_loc_widget.dart';
import 'package:kebut_kurir/ui/ktp_ocr_confirm/widgets/confirm_data_radio_widget.dart';

class KTPOcrConfirmScreen extends GetView<KTPOcrConfirmController> {
  const KTPOcrConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'Pastikan data kamu sudah sesuai dengan data yang ada pada KTP.',
                          style: AppTheme.textStyle.blackTextStyle.copyWith(
                            fontSize: AppTheme.textConfig.size.n,
                          ),
                        ),
                        SizedBox(height: 24.h),
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
                              File(controller.ocr.value!.path),
                              width: 145.w,
                              height: 110.h,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.ocrKtp),
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
                        ConfirmDataFieldWidget(
                          label: 'Nomor KTP (NIK)',
                          hint: 'NIK anda',
                          controller: controller.tecNik,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(label: 'Nama Lengkap (Sesuai KTP)', hint: 'Nama lengkap anda', controller: controller.tecNama),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          label: 'Tempat Lahir',
                          hint: 'Tempat lahir anda',
                          controller: controller.tecTmptLahir,
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          label: 'Tanggal Lahir',
                          hint: 'Tanggal lahir anda',
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1800),
                              lastDate: DateTime.now(),
                            ).then(
                              (DateTime? value) {
                                if (value != null) {
                                  controller.tecTglLahir.text = DateFormat('yyyy-MM-dd').format(value);
                                }
                              },
                            );
                          },
                          readOnly: true,
                          controller: controller.tecTglLahir,
                          suffixIcon: const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Obx(
                          () => controller.listGenders.isEmpty 
                              ? const ConfirmDataRadioWidget(
                                  label: 'Jenis Kelamin',
                                  listValue: ['Pria', 'Wanita'],
                                )
                              : ConfirmDataRadioWidget(
                                  label: 'Jenis Kelamin',
                                  listValue: controller.listGenders,
                                ),
                        ),
                        SizedBox(height: 16.h),
                        Obx(
                          () => controller.listMaritalStatus.isEmpty
                              ? ConfirmDataDropDownWidget(
                                  label: 'Status Perkawinan',
                                  listMenu: const [
                                    'Lajang',
                                    'Menikah',
                                    'Cerai Hidup',
                                    'Cerai Mati',
                                  ],
                                  valueList: controller.valueStatusPerkawinan.value,
                                  hint: 'Status',
                                  onChanged: (String? v) {
                                    if (v != null) {
                                      controller.valueStatusPerkawinan.value = v;
                                    }
                                  },
                                )
                              : ConfirmDataDropDownWidget(
                                  label: 'Status Perkawinan',
                                  listMenu: controller.listMaritalStatus,
                                  valueList: controller.valueStatusPerkawinan.value,
                                  hint: 'Status',
                                  onChanged: (String? v) {
                                    if (v != null) {
                                      controller.valueStatusPerkawinan.value = v;
                                    }
                                  },
                                ),
                        ),
                        SizedBox(height: 16.h),
                        Obx(
                          () => controller.listReligions.isEmpty
                              ? ConfirmDataDropDownWidget(
                                  label: 'Agama',
                                  listMenu: const [
                                    'Islam',
                                    'Protestan',
                                    'Katolik',
                                    'Hindu',
                                    'Buddha',
                                    'Khonghucu',
                                    'Lainnya',
                                  ],
                                  valueList: controller.valueAgama.value,
                                  hint: 'Agama',
                                  onChanged: (String? v) {
                                    if (v != null) {
                                      controller.valueAgama.value = v;
                                    }
                                  },
                                )
                              : ConfirmDataDropDownWidget(
                                  label: 'Agama',
                                  listMenu: controller.listReligions,
                                  valueList: controller.valueAgama.value,
                                  hint: 'Agama',
                                  onChanged: (String? v) {
                                    if (v != null) {
                                      controller.valueAgama.value = v;
                                    }
                                  },
                                ),
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          controller: controller.tecPekerjaan,
                          label: 'Pekerjaan',
                          hint: 'Pekerjaan anda',
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          controller: controller.tecAlamat,
                          label: 'Alamat',
                          hint: 'Alamat sesuai ktp anda',
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          label: 'RT/RW',
                          hint: 'RT/RW anda',
                          controller: controller.tecRt,
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataLocWidget(
                          label: 'Provinsi',
                          controller: controller.tecProvinsi,
                          suggestionsCallback: (String v) async {
                            return await controller.getListProvince(v);
                          },
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataLocWidget(
                          label: 'Kota/Kabupaten',
                          controller: controller.tecKota,
                          suggestionsCallback: (String v) async {
                            return await controller.getListRegencies(v);
                          },
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataLocWidget(
                          label: 'Kecamatan',
                          controller: controller.tecKecamatan,
                          suggestionsCallback: (String v) async {
                            return await controller.getListDistricts(v);
                          },
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataLocWidget(
                          label: 'Kelurahan',
                          controller: controller.tecKelurahan,
                          suggestionsCallback: (String v) async {
                            return await controller.getListVillages(v);
                          },
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataLocWidget(
                          label: 'Kode Pos',
                          controller: controller.tecKodePos,
                          suggestionsCallback: (String v) async {
                            return await controller.getPostalCode(v);
                          },
                        ),
                        SizedBox(height: 16.h),
                        ConfirmDataFieldWidget(
                          controller: controller.tecGolDarah,
                          label: 'Golongan Darah',
                          hint: 'Golongan darah anda',
                        ),
                        SizedBox(height: 16.h),
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
                await controller.verifyKtpData(
                  body: VerifyKtpBodyModel(
                    addressAccordingToId: controller.tecAlamat.text,
                    bloodType: controller.tecGolDarah.text,
                    dateOfBirth: controller.tecTglLahir.text,
                    fullname: controller.tecNama.text,
                    national: 'Indonesia',
                    nik: controller.tecNik.text,
                    placeOfBirth: controller.tecTmptLahir.text,
                    rt: controller.tecRt.text,
                    rw: controller.tecRt.text,
                    state: 'verify-ktp',
                    uuidDistricts: controller.selectedDistricts,
                    uuidGenders: controller.uuidGender(),
                    uuidMaritalStatus: controller.uuidMartialStatus(),
                    uuidProvinces: controller.selectedProvince,
                    uuidRegencies: controller.selectedRegencies,
                    uuidReligions: controller.uuidReligions(),
                    uuidVillages: controller.selectedVillages,
                    work: controller.tecPekerjaan.text,
                  ),
                  onSucces: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: 'Data KTP Berhasil Disimpan',
                          primaryButtonText: 'Lanjut',
                          asset: 'assets/check_img.png',
                          subTitle: 'Silahkan melanjutkan proses Pendaftaraan. ',
                          onTapPrimary: () {
                            // print("OCR VALUE : ${ controller.ocr.value!.path}");
                            // Get.offNamedUntil(Routes.registerUploadDocumentScreen, (route) => false);
                            Get.back();
                            Get.back();
                            Get.back();
                            Get.back(result: controller.ocr.value!.path);
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
                  },
                  onFailed: (value) async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: 'Terjadi Kesalahan',
                          primaryButtonText: 'Kembali',
                          asset: 'assets/icon_popup_error.png',
                          subTitle: 'Silahkan coba kembali.\n {$value}',
                          onTapPrimary: () {
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                );
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
