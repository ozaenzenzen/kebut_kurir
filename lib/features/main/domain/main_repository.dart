import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/main/data/check_courier_by_postal_code_data.dart';

class MainRepository {
  MainRepository();
  final ApiClient apiClient = ApiClient();

  Future<CheckCourierbyPostalCodeData?> getCheckCourierbyPostalCode({required String postalCode}) async {
    CheckCourierbyPostalCodeData? result;
    try {
      await apiClient
          .getRequest(
        'api/web/master/courier/postal_code/$postalCode',
      )
          .then(
        (Response<dynamic> value) {
          log('HASIL GET CHECK COURIER BY POSTAL CODE ====>>> ${value.data}');
          result = CheckCourierbyPostalCodeData.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }

  
}
