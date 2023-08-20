import 'package:get/get.dart';
import 'package:kebut_kurir/features/ktp_ocr/presentation/ktp_ocr_controller.dart';

class KTPOcrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KTPOcrController());
  }
}
