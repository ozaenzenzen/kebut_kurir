

import 'package:get/get.dart';
import 'package:kebut_kurir/ui/notification/presentation/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }

}
