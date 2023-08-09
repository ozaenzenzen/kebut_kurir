import 'package:get/get.dart';
import 'package:kebut_kurir/features/pesan/presentation/pesan_controller.dart';

class PesanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PesanController());
  }
}
