import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/src/response.dart' as rp;
import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/edit_profile/data/edit_profile_company_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/edit_profile_pribadi_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/get_user_data_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/request/edit_profile_company_request_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/request/edit_profile_pribadi_request_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/upload_photo_response_model.dart';

class EditProfileRepository {
  final ApiClient apiClient = ApiClient();

  Future<UploadPhotoResponseModel?> uploadPhotoProfile({
    required String uuid,
    required dynamic imageData,
  }) async {
    try {
      final rp.Response<dynamic> response = await apiClient.putRequest(
        'api/auth/register/upload-photo-profile/$uuid',
        data: FormData.fromMap(imageData),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
      );
      if (response.data != null) {
        if (response.data['error'] == null) {
          return UploadPhotoResponseModel.fromJson(response.data);
        } else {
          // debugPrint('er 1 ${response.data['error']}');
          // debugPrint('er 2 ${response.data['error']['status']}');
          return UploadPhotoResponseModel(
            status: response.statusCode,
            result: response.data['error']['message'].toString(),
          );
        }
      } else {
        return UploadPhotoResponseModel(
          status: response.statusCode,
          result: 'response is null',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<GetUserDataResponseModel?> getUserDataRemote({
    required String uuid,
  }) async {
    try {
      final rp.Response<dynamic> response = await apiClient.getRequest(
        'api/web/user/profile/$uuid',
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          return GetUserDataResponseModel.fromJson(response.data);
        } else {
          return GetUserDataResponseModel(
            status: response.statusCode,
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

  Future<ResultUserData?> getUserDataLocal() async {
    try {
      String prefsData = await Prefs.userData;
      debugPrint('prefsData ${prefsData}');
      ResultUserData resultUserData = ResultUserData.fromJson(jsonDecode(prefsData));
      debugPrint('resultUserData ${resultUserData}');
      return resultUserData;
    } catch (e) {
      return null;
    }
  }

  Future<EditProfilePribadiResponseModel?> editProfilePribadi({
    required String uuid,
    required EditProfilePribadiRequestModel data,
  }) async {
    try {
      final rp.Response<dynamic> response = await apiClient.putRequest(
        // 'api/web/user/config/edit-personal-profile/mngXentMfKeh3RF',
        'api/web/user/config/edit-personal-profile/$uuid',
        data: data.toJson(),
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          return EditProfilePribadiResponseModel.fromJson(response.data);
        } else {
          return EditProfilePribadiResponseModel(
            status: response.statusCode,
            result: response.data ?? 'Error trlx msg',
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

  Future<EditProfileCompanyResponseModel?> editProfileCompany({
    required String uuid,
    required EditProfileCompanyRequestModel data,
  }) async {
    try {
      final rp.Response<dynamic> response = await apiClient.putRequest(
        // 'api/web/user/config/edit-personal-profile/mngXentMfKeh3RF',
        'api/web/user/config/edit-company-profile/$uuid',
        data: data.toJson(),
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          return EditProfileCompanyResponseModel.fromJson(response.data);
        } else {
          return EditProfileCompanyResponseModel(
            status: response.statusCode,
            result: response.data ?? 'Error trlx msg',
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
