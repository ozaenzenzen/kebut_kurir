import 'package:get/get.dart';
import 'package:kebut_kurir/features/delivery_barang/presentation/delivery_barang_controller.dart';

class DeliveryBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryBarangController());
  }
}
