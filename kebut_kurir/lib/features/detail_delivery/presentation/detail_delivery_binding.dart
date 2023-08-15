import 'package:get/get.dart';
import 'package:kebut_kurir/features/detail_delivery/presentation/detail_delivery_controller.dart';

class DetailDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailDeliveryController());
  }
}
