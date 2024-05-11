import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/detail_pickup_data.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/pickup_data.dart';
import 'package:kebut_kurir/features/pick_up_barang/domain/pickup_repository.dart';

class PickupBarangController extends GetxController {
  RxBool pickupBarang = false.obs;
  final PickupRepository _pickupRepository = PickupRepository();
  Rx<PickupData?> pickupData = Rx<PickupData?>(null);

  final DialogsUtils dialogsUtils = DialogsUtils();

  @override
  void onReady() {
    fetchListPickup().then((value) {
      pickupData.value = value;
      update();
      dialogsUtils.hideLoading();
    });
    super.onReady();
  }

  Future<PickupData?> fetchListPickup() async {
    dialogsUtils.showLoading();
    final PickupData? result = await _pickupRepository.getListPickup(
      uuid: await Prefs.userId,
      isHardcode: true,
    );
    if (result != null) {
      if (result.result != null) {
        if (result.result!.data != null) {
          if (result.result!.data!.isNotEmpty) {
            result.result!.data!.forEach(
              (element) async {
                await fetchDetailPickup(uuidDeliveryOrders: element.uuidDeliveryOrders ?? '').then(
                  (value) {
                    if (value != null) {
                      if (value.result != null) {
                        if (value.result!.data != null) {
                          element.detailPickup.value = value.result!.data!;
                          update();
                        }
                      }
                    }
                  },
                );
              },
            );
          }
        }
      }
    }
    return result;
  }

  Future<DetailPickupModel?> fetchDetailPickup({required String uuidDeliveryOrders}) async {
    final DetailPickupModel? result = await _pickupRepository.getDetailPickup(uuidDeliveryOrders: uuidDeliveryOrders);
    return result;
  }

 
}
