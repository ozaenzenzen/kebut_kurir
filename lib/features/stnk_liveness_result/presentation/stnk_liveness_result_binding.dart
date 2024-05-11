import 'package:get/get.dart';
import 'package:kebut_kurir/features/stnk_liveness_result/presentation/stnk_liveness_result_controller.dart';

class STNKLivenessResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => STNKLivenessResultController());
  }
}
