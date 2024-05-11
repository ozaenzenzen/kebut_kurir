import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_kendaraan_liveness/presentation/stnk_kendaraan_liveness_controller.dart';

class STNKKendaraanLivenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => STNKKendaraanLivenessController());
  }
}
