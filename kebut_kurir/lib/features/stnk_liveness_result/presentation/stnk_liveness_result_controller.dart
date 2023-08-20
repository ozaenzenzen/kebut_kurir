import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/register_upload_document/args/stnk_args.dart';

class STNKLivenessResultController extends GetxController {
  OcrEnum card = OcrEnum.KTP;
  Rx<File?> stnk = Rx<File?>(null);
  Rx<File?> stnkCropped = Rx<File?>(null);
  final BottomSheetUtils bottomSheet = BottomSheetUtils();
  final DialogsUtils dialogsUtils = DialogsUtils();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments is STNKArgs) {
        final STNKArgs? args = Get.arguments as STNKArgs?;
        if (args != null) {
          stnk.value = args.stnk;
          stnkCropped.value = args.compressedFile;
        }
      }
    }
  }

  void onPressToNextStep() async {
    dialogsUtils.showLoading();
    if (stnk.value != null && stnkCropped.value != null) {
      Get.toNamed(
        Routes.stnkLivenessConfirmScreen,
        arguments: STNKArgs(
          compressedFile: stnkCropped.value,
          stnk: stnk.value,
        ),
      );
    } else {
      dialogsUtils.showError('Terjadi Kesalahan');
    }
    // print('ISI HASIL EXTRAK $extractedText');
  }
}
