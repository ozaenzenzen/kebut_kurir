import 'package:get/get.dart';
import 'package:kebut_kurir/features/sim_liveness/sim_liveness_controller.dart';

class SIMLivenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SIMLivenessController());
  }
}
