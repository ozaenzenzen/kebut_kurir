import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';

class ForgotPasswordRepository {
  final ApiClient apiClient = ApiClient();

  Future<Response<dynamic>?> sendEmail({required String email}) async {
    try {
      var status = await apiClient.postRequest(
        'api/web/forgot-password',
        data: <String, dynamic>{
          'email': email,
        },
      );
      debugPrint('REPONSE LOGIN ${status.data['status']}');
      debugPrint('Error ${status.data['result']['message_detail']}');
      if (status.data['status'] == 200) {
        return status;
      } else {
        return status;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> resetPassword({
    required String email,
    required String newPass,
    required String newPassConfirm,
  }) async {
    try {
      print('ISI EMAIL $email');
      print('ISI EMAIL $newPass');
      print('ISI EMAIL $newPassConfirm');

      await apiClient.putRequest('api/web/reset-password', data: <String, dynamic>{
        'email': email,
        'new_password': newPass,
        'new_password1': newPassConfirm,
      }).then((Response<dynamic> value) {
        print('REPONSE LOGIN $value');
      });
    } catch (e) {
      print(e);
    }
    return null;
  }
}
