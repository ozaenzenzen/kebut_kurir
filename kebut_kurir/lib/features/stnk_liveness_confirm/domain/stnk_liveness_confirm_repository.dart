import 'package:dio/dio.dart' as dio;
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/register/data/verify_stnk_model.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/data/transportation_type_model.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/data/vehicle_ownership_model.dart';

class STNKLivenessConfirmRepository {
  final ApiClient apiClient = ApiClient();

  Future<VehicleOwnershipModel?> getVehicleOwnership() async {
    VehicleOwnershipModel? result;
    try {
      await apiClient.getRequest('api/web/reference/vehicle-ownerships/', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = VehicleOwnershipModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<TransportationTypeModel?> getTransportationType() async {
    TransportationTypeModel? result;
    try {
      await apiClient.getRequest('api/web/reference/transportation-types/', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = TransportationTypeModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> registerVerifySTNK({required VerifyStnkBodyModel body, required String uuid}) async {
    try {
      bool result = false;
      await apiClient
          .putRequest(
        'api/auth/register/kurir/verify-doc/$uuid',
        data: body.toJson(),
      )
          .then(
        (value) {
          print('VALUE STATUS STNK ${value.data}');
          if (value.data['status'] == 200) {
            result = true;
          } else {
            result = false;
          }
        },
      );
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
