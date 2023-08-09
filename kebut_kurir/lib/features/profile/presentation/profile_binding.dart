import 'package:get/get.dart';

import 'package:kebut_kurir/features/profile/presentation/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
