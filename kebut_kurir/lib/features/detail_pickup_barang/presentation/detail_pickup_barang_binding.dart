import 'package:get/get.dart';

import 'detail_pickup_barang_controller.dart';

class DetailPickupBarangBindng extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPickupBarangController());
  }
}
