import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_args.dart';

class STNKLivenessConfirmController extends GetxController {
  Rx<File?> kendaraanDepan = Rx<File?>(null);
  Rx<File?> kendaraanBelakang = Rx<File?>(null);
  Rx<File?> kendaraanSampingKiri = Rx<File?>(null);
  Rx<File?> kendaraansampingKanan = Rx<File?>(null);

  Rx<File?> stnk = Rx<File?>(null);

  TextEditingController tecMerkKendaraan = TextEditingController();
  TextEditingController tecTypeKendaraan = TextEditingController();
  TextEditingController tecPlatnoKendaraan = TextEditingController();
  TextEditingController tecTahunKendaraan = TextEditingController();
  TextEditingController tecPajakKendaraan = TextEditingController();

  TextEditingController tecKepemilikanKendaraan = TextEditingController();

  var selectedJenisRoda = 'Roda 2'.obs;
  var selectedJenisKepemilikan = 'Pilih kepemilikan kendaraan'.obs;
  var selectedJenisKepemilikanTemp = 'Pilih kepemilikan kendaraan'.obs;

  RxInt radioButtonValue = 0.obs;
  RxInt radioButtonTempValue = 0.obs;

  final BottomSheetUtils bottomSheetUtils = BottomSheetUtils();
  final DialogsUtils dialogUtils = DialogsUtils();

  @override
  void onInit() {
    super.onInit();
    radioButtonValue.value = -1;
    if (Get.arguments != null) {
      if (Get.arguments is STNKArgs) {
        final STNKArgs? args = Get.arguments as STNKArgs?;
        if (args != null) {
          stnk.value = args.stnk;
        }
      }
    }
  }

  void showBottomSheetSubjectComplain(BuildContext context, Size size) {
    radioButtonTempValue.value = radioButtonValue.value;
    selectedJenisKepemilikanTemp.value = selectedJenisKepemilikan.value;
    bottomSheetUtils.showBottomSheetV2(
      context: context,
      radius: 24,
      title: 'Kepemilikan Kendaraan',
      isDismissable: false,
      isScrollControlled: true,
      withStrip: true,
      content: Column(
        children: [
          InkWell(
            onTap: () {
              radioButtonTempValue.value = 0;
            },
            child: Container(
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'Milik Sendiri',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          color: const Color(0xFF404040),
                          fontSize: AppTheme.textConfig.size.n,
                          fontWeight: AppTheme.textConfig.weight.regular,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Obx(
                    () => Radio<int>(
                      value: 0,
                      groupValue: radioButtonTempValue.value,
                      activeColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00B050)),
                      onChanged: (values) {
                        radioButtonTempValue.value = 0;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              radioButtonTempValue.value = 1;
            },
            child: Container(
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'Keluarga',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          color: const Color(0xFF404040),
                          fontSize: AppTheme.textConfig.size.n,
                          fontWeight: AppTheme.textConfig.weight.regular,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Obx(
                    () => Radio<int>(
                      value: 1,
                      groupValue: radioButtonTempValue.value,
                      activeColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00B050)),
                      onChanged: (values) {
                        radioButtonTempValue.value = 1;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              radioButtonTempValue.value = -2;
            },
            child: Container(
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'Lainnya',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          color: const Color(0xFF404040),
                          fontSize: AppTheme.textConfig.size.n,
                          fontWeight: AppTheme.textConfig.weight.regular,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Obx(
                    () => Radio<int>(
                      value: -2,
                      groupValue: radioButtonTempValue.value,
                      activeColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00B050)),
                      onChanged: (values) {
                        radioButtonTempValue.value = -2;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => radioButtonTempValue.value == -2
                ? Column(
                    children: [
                      UnderlineTextFieldWidget(
                        withBorder: false,
                        radius: 12,
                        filled: true,
                        onChanged: (val) {
                          selectedJenisKepemilikanTemp.value = val;
                        },
                        isDense: true,
                        hintText: 'Masukkan lainnya',
                        controller: tecKepemilikanKendaraan,
                        hintTextStyle: AppTheme.textStyle.blackTextStyle.copyWith(
                          color: const Color(0xFF7C7E83),
                          fontSize: AppTheme.textConfig.size.n,
                          fontWeight: AppTheme.textConfig.weight.regular,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  )
                : Container(),
          ),
          InkWell(
            onTap: () {
              if (radioButtonTempValue.value == 0) {
                selectedJenisKepemilikan.value = 'Milik Sendiri';
                tecKepemilikanKendaraan.text = '';
              } else if (radioButtonTempValue.value == 1) {
                selectedJenisKepemilikan.value = 'Keluarga';
                tecKepemilikanKendaraan.text = '';
              } else if (radioButtonTempValue.value == -2) {
                if (selectedJenisKepemilikanTemp.value.isEmpty) {
                  selectedJenisKepemilikan.value = 'Lainnya';
                  tecKepemilikanKendaraan.text = 'Lainnya';
                } else {
                  selectedJenisKepemilikan.value = selectedJenisKepemilikanTemp.value;
                  tecKepemilikanKendaraan.text = selectedJenisKepemilikan.value;
                }
              }
              radioButtonValue.value = radioButtonTempValue.value;
              Get.back();
            },
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: ShapeDecoration(
                color: AppTheme.colors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Konfirmasi',
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      color: const Color(0xFF7C7E83),
                      fontSize: AppTheme.textConfig.size.nl,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
