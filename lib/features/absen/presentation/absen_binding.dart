import 'package:get/get.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_controller.dart';

class AbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbsenController());
  }
}
