import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';

class CreatePasswordRepository {
  final ApiClient apiClient = ApiClient();

  Future<dio.Response<dynamic>?> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var status = await apiClient.postRequest(
        '/api/auth/register/create-password',
        data: <String, dynamic>{
          'email': email,
          "password": password,
          "repeat_password": confirmPassword,
        },
      );
      debugPrint('RESPONSE createPassword ${status.data}');
      debugPrint('RESPONSE createPassword ${status.statusCode}');
      debugPrint('RESPONSE createPassword ${status.statusMessage}');
      // if (status.data['status'] == 200) {
      if (status.statusCode?.toInt() == 200) {
        return status;
      } else {
        return status;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return e.response;
    } catch (e){
      return null;
    }
  }
}
