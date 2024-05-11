import 'package:get/get.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_controller.dart';

class PickupBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickupBarangController());
  }
}
