import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/detail_pickup_data.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/pickup_data.dart';

class PickupRepository {
  PickupRepository();
  final ApiClient apiClient = ApiClient();
  Future<PickupData?> getListPickup({required String uuid, bool isHardcode = false}) async {
    PickupData? result;
    try {
      await apiClient.getRequest(
        'api/web/kurir/list-pickup',
        queryParameters: {
          'uuid_users_handle': isHardcode ? 'ruOnAzLVphhtz7m' : uuid,
        },
      ).then(
        (Response<dynamic> value) {
          log('HASIL GET LIST PICKUP ====>>> ${value.data}');
          result = PickupData.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      log("error when get list pickup : $e");
    }
    return result;
  }

  Future<DetailPickupModel?> getDetailPickup({required String uuidDeliveryOrders}) async {
    DetailPickupModel? result;
    try {
      await apiClient.getRequest(
        'api/web/kurir/pickup-detail',
        queryParameters: {
          'uuid_delivery_orders': uuidDeliveryOrders,
        },
      ).then(
        (Response<dynamic> value) {
          log('HASIL GET DETAIL PICKUP ====>>> ${value.data}');
          result = DetailPickupModel.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      log("error when get detail pickup : $e");
    }
    return result;
  }

  Future<bool> postPickup({
    required String uuidDeliveryOrders,
    required String uuid,
    bool isHardcode = false,
  }) async {
    bool result = false;
    try {
      await apiClient.postRequest(
        'api/web/kurir/pickup-package',
        data: {
          "uuid_delivery_orders": uuidDeliveryOrders,
          "uuid_users_handle": uuid,
        },
      ).then(
        (Response<dynamic> value) {
          log('HASIL POST PICKUP ====>>> ${value.data}');
          if (value.statusCode == 200) {
            if (value.data != null) {
              if (value.data["status"] != 401) {
                result = true;
              }
            }
          }
        },
      );
      return result;
    } catch (e) {
      log("error when get detail pickup : $e");
    }
    return result;
  }
}
