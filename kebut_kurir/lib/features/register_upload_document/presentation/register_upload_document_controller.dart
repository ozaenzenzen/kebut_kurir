import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';

class RegisterUploadDocumentController extends GetxController {
  final BottomSheetUtils guideDialog = Get.find();
  OcrEnum card = OcrEnum.KTP;

  Rx<File?> ocrKtp = Rx<File?>(null);
  Rx<File?> liveness = Rx<File?>(null);
  Rx<File?> sim = Rx<File?>(null);
  Rx<File?> stnk = Rx<File?>(null);

  Rx<File?> kendaraanDepan = Rx<File?>(null);
  Rx<File?> kendaraanBelakang = Rx<File?>(null);
  Rx<File?> kendaraanSampingKiri = Rx<File?>(null);
  Rx<File?> kendaraansampingKanan = Rx<File?>(null);
}
