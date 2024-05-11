
import 'package:get/get.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}
