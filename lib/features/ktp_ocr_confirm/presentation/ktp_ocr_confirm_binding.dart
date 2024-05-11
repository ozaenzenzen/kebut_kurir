import 'package:get/get.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/presentation/ktp_ocr_confirm_controller.dart';

class KTPOcrConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KTPOcrConfirmController());
  }
  
}