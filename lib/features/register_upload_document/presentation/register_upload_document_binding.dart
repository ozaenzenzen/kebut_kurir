import 'package:get/get.dart';
import 'package:kebut_kurir/features/register_upload_document/presentation/register_upload_document_controller.dart';

class RegisterUploadDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUploadDocumentController());
  }
}
