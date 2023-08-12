import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';

class DetailPickupBarangController extends GetxController {
  final DialogsUtils dialogUtils = Get.find();
  RxBool afterPickupBarang = false.obs;

  @override
  void onInit() {
    final bool? args = Get.arguments as bool?;
    if (args != null) {
      afterPickupBarang.value = args;
    } else {
      afterPickupBarang.value = false;
    }

    print("fromDetailScreen :");

    super.onInit();
  }
}
