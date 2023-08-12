import 'package:get/get.dart';

class AfterPickupBarangController extends GetxController {
  RxBool fromDetailScreen = false.obs;
  // dynamic argumentData = Get.arguments;
  @override
  void onInit() {
    final bool? args = Get.arguments as bool?;
    if (args != null) {
      fromDetailScreen.value = args;
    } else {
      fromDetailScreen.value = false;
    }

    print("fromDetailScreen :");

    super.onInit();
  }
}
