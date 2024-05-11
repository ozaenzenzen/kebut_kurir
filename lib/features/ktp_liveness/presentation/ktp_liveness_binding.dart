import 'package:get/get.dart';
import 'package:kebut_kurir/features/ktp_liveness/presentation/ktp_liveness_controller.dart';

class KTPLivenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KTPLivenessController());
  }
}
