import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_kendaraan_liveness_result/args/stnk_kendaraan_args.dart';

class STNKKendaraanLivenessResultController extends GetxController {
  Rx<File?> file = Rx<File?>(null);
  Rx<File?> compressedFile = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments is STNKKendaraanArgs) {
        final STNKKendaraanArgs? args = Get.arguments as STNKKendaraanArgs?;
        if (args != null) {
          file.value = args.file;
          compressedFile.value = args.compressedFile;
        }
      }
    }
  }
}
