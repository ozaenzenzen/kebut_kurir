import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/absen/data/absen_model.dart';
import 'package:kebut_kurir/features/absen/data/request/absen_request_model.dart';

class AbsenRepository {
  final ApiClient apiClient = ApiClient();
  Future<AbsenModel?> postAbsen({required AbsenRequestModel body}) async {
    AbsenModel? result;
    try {
      log("Isi request postAbsen : ${body.toJson()}");
      await apiClient.postRequest(
        'api/web/common/presensi-kurir',
        data: body.toJson(),
      ).then((Response<dynamic> value) {
        print('REPONSE LOGIN $value');
        result = AbsenModel.fromJson(value.data);
      });
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
}