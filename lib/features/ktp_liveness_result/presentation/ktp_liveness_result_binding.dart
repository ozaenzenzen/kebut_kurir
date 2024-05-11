import 'package:get/get.dart';
import 'package:kebut_kurir/features/ktp_liveness_result/presentation/ktp_liveness_result_controller.dart';

class KTPLivenessResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KTPLivenessResultController());
  }
}
