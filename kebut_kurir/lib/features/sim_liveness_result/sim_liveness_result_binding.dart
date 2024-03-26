import 'package:get/get.dart';
import 'package:kebut_kurir/features/sim_liveness_result/sim_liveness_result_controller.dart';

class SIMLivenessResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SIMLivenessResultController());
  }
}
