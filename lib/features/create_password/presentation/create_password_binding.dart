
import 'package:get/get.dart';
import 'package:kebut_kurir/features/create_password/presentation/create_password_controller.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePasswordController());
  }
}
