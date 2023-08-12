import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';

class DetailPickupBarangController extends GetxController {
  final DialogsUtils dialogUtils = Get.find();
  final BottomSheetUtils bottomSheetUtils = BottomSheetUtils();
  RxBool afterPickupBarang = false.obs;
  RxBool fromScanQR = false.obs;
  RxBool volumeDone = false.obs;
  var valueScan = Get.parameters;
  RxString fileName = ''.obs;
  Rx<File?> docFilePengirim = Rx<File?>(null);
  Rx<File?> docFileBarang = Rx<File?>(null);
  final ImagePickerUtils profilePictureUtils = ImagePickerUtils();

  @override
  void onInit() {
    if (Get.arguments is bool) {
      final bool? args = Get.arguments as bool?;
      if (args != null) {
        afterPickupBarang.value = args;
      } else {
        afterPickupBarang.value = false;
      }
    }
    if (Get.parameters.isNotEmpty) {
      var valueScan = Get.parameters['fromScan'];
      if (valueScan == "false") {
        fromScanQR.value = false;
      } else {
        fromScanQR.value = true;
      }
    }

    print("fromDetailScreen :");

    super.onInit();
  }

  bool enableUpload() {
    bool result = false;
    // if (docFile.value != null) {
    //   result = true;
    // }
    return result;
  }
}
