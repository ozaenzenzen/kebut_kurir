import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:kebut_kurir/core/utils/api_function.dart';

class NotificationRepository {
  final ApiClient apiClient = ApiClient();

  Future<dynamic> getNotification({
    required String uuidUser,
  }) async {
    try {
      final dio.Response<dynamic> response = await apiClient.getRequest(
        '',
      );
      if (response.data != null) {
        // return RegisterLevel2UploadKtpResponseModel.fromJson(response.data);
        return dynamic;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
