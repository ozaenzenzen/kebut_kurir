import 'package:get/get.dart';
import 'package:kebut_kurir/features/static_page/presentation/static_page_controller.dart';

class StaticPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StaticPageController());
  }
}
