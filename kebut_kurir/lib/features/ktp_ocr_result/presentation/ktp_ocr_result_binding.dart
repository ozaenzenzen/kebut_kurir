import 'package:get/get.dart';
import 'package:kebut_kurir/features/ktp_ocr_result/presentation/ktp_ocr_result_controller.dart';

class KTPOcrResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KTPOcrResultController());
  }
  
}