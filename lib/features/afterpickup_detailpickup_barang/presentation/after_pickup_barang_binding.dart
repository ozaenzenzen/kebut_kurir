import 'package:get/get.dart';
import 'package:kebut_kurir/features/afterpickup_detailpickup_barang/presentation/after_pickup_barang_controller.dart';

class AfterPickupBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AfterPickupBarangController());
  }
}
