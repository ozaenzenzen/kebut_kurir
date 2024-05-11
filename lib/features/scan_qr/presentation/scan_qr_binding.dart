import 'package:get/get.dart';
import 'package:kebut_kurir/features/scan_qr/presentation/scan_qr_controller.dart';

class ScanQRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQRController());
  }
  
}