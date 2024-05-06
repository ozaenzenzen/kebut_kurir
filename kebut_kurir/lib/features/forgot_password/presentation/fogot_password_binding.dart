
import 'package:get/get.dart';
import 'package:kebut_kurir/features/forgot_password/presentation/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
