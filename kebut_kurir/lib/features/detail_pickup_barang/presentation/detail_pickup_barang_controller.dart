import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/detail_pickup_data.dart';
import 'package:kebut_kurir/features/pick_up_barang/domain/pickup_repository.dart';

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
  Rx<DataDetailPickup?> detailPickup = Rx<DataDetailPickup?>(null);

  final DialogsUtils dialogsUtils = DialogsUtils();

  final PickupRepository _pickupRepository = PickupRepository();

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments is bool) {
        final bool? args = Get.arguments as bool?;
        if (args != null) {
          afterPickupBarang.value = args;
        } else {
          afterPickupBarang.value = false;
        }
      }
      if (Get.arguments is DataDetailPickup) {
        detailPickup.value = Get.arguments as DataDetailPickup;
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

  Future<void> sendPickup({
    required String uuidDeliveryOrders,
    required Function() onSuccess,
    required Function(String) onFailed,
  }) async {
    dialogsUtils.showLoading();
    final bool result = await _pickupRepository.postPickup(uuidDeliveryOrders: uuidDeliveryOrders, uuid: await Prefs.userId);
    if (result) {
      onSuccess();
    } else {
      onFailed("Error");
    }
  }
}
