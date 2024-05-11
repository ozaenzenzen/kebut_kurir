import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';

import 'package:kebut_kurir/features/main/presentation/main_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    // Get.lazyPut(() => MyOrderController());
    // Get.lazyPut(() => HelpCenterController());
    Get.put(() => BottomSheetUtils(), permanent: true);
  }
}
