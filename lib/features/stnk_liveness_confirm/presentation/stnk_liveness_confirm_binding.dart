import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/presentation/stnk_liveness_confirm_controller.dart';

class STNKLivenessConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => STNKLivenessConfirmController());
  }
}
