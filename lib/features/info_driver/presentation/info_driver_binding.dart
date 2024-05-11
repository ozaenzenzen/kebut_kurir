import 'package:get/get.dart';
import 'package:kebut_kurir/features/info_driver/presentation/info_driver_controller.dart';

class InfoDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoDriverController());
  }
}
