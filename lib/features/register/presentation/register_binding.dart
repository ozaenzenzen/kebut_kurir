import 'package:get/get.dart';
import 'package:kebut_kurir/features/register/presentation/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
