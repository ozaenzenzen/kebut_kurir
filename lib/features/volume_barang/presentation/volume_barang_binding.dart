import 'package:get/get.dart';
import 'package:kebut_kurir/features/volume_barang/presentation/volume_barang_controller.dart';

class VolumeBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VolumeBarangController());
  }
}
