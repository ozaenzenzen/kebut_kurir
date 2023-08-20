import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/register_upload_document/args/ktp_liveness_result_args.dart';

class KTPLivenessResultController extends GetxController {
  OcrEnum card = OcrEnum.KTP;
  Rx<File?> ocr = Rx<File?>(null);
  Rx<File?> ocrCropped = Rx<File?>(null);
  final BottomSheetUtils bottomSheet = BottomSheetUtils();
  final DialogsUtils dialog = DialogsUtils();
  Rx<File?> livenessImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments is KtpLivenessResultArgs) {
        final KtpLivenessResultArgs? args = Get.arguments as KtpLivenessResultArgs?;
        if (args != null) {
          card = args.card;
          ocr.value = args.ktpImage;
          ocrCropped.value = args.croppedKtpImage;
          livenessImage.value = args.liveness;
        }
      }
    }
  }
}
