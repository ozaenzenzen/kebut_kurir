import 'package:get/get.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_controller.dart';

class InfoPengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoPengajuanController());
  }
  
}