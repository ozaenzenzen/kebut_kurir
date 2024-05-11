import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_kendaraan_liveness_result/presentation/stnk_kendaraan_liveness_result_controller.dart';

class STNKKendaraanLivenessResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => STNKKendaraanLivenessResultController());
  }
}
