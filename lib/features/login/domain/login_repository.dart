import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/edit_profile/data/get_user_data_response_model.dart';
import 'package:kebut_kurir/features/login/data/model/login_model.dart';

class LoginRepository {
  final ApiClient apiClient = ApiClient();
  Future<LoginModel?> postLogin({required String email, required String password, bool passwordHardcode = false}) async {
    LoginModel? result;
    try {
      await apiClient.postRequest(
        'api/web/login',
        data: <String, String>{
          'email': passwordHardcode ? "kurir_paket_1_pulau_tidung@kebut.com" : email,
          'password': passwordHardcode ? "login123" : password,
        },
      ).then((Response<dynamic> value) {
        log('REPONSE LOGIN $value');
        result = LoginModel.fromJson(value.data);
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

  Future<GetUserDataResponseModel?> getUserDataRemote({
    required String uuid,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.getRequest(
        'api/web/user/profile/$uuid',
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          return GetUserDataResponseModel.fromJson(response.data);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
