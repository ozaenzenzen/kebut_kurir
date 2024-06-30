import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:kebut_kurir/app/app_constant.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/edit_profile/data/get_user_data_response_model.dart';
import 'package:kebut_kurir/features/profile/data/req/change_password_request_model.dart';
import 'package:kebut_kurir/features/profile/data/resp/change_password_response_model.dart';
import 'package:kebut_kurir/features/profile/data/resp/get_faq_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final ApiClient apiClient = ApiClient();

  Future<String> helper() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefsData = prefs.getString(AppConstant.USER_DATA) ?? '';
    return prefsData;
  }

  Future<ResultUserData?> getUserDataLocal() async {
    try {
      // String prefsData = await Prefs.userData;
      // debugPrint('prefsData ${prefsData}');
      String prefsData = await helper();
      debugPrint('prefsData $prefsData');
      ResultUserData resultUserData = ResultUserData.fromJson(jsonDecode(prefsData));
      // debugPrint('resultUserData ${resultUserData}');
      return resultUserData;
    } catch (e) {
      return null;
    }
  }

  Future<ChangePasswordResponseModel?> changePassword({
    required ChangePasswordRequestModel data,
    required String uuid,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.putRequest(
        'api/web/user/config/change-password/$uuid',
        data: data.toJson(),
      );
      if (response.data != null) {
        if (response.data['status'] == 200) {
          return ChangePasswordResponseModel.fromJson(response.data);
        } else {
          return ChangePasswordResponseModel(
            status: response.data['status'],
            result: response.data ?? 'Error gud msg',
          );
        }
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<GetFAQResponseModel?> getFAQ() async {
    try {
      final Response<dynamic> response = await apiClient.getRequest(
        'api/web/setting/faq/?search=-&page=1&limit=99',
      );
      if (response.data != null) {
        if (response.data['status'] == 200) {
          return GetFAQResponseModel.fromJson(response.data);
        } else {
          return GetFAQResponseModel(
            status: response.data['status'],
            result: response.data ?? 'Error gud msg',
          );
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
