import 'package:get/get.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
