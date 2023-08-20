import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_liveness/presentation/stnk_liveness_controller.dart';

class STNKLivenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => STNKLivenessController());
  }
}
