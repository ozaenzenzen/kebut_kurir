import 'package:get/get.dart';
import 'package:kebut_kurir/features/edit_profile/presentation/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
