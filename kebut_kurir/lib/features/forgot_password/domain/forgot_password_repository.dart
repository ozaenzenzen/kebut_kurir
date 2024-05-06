import 'package:dio/src/response.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';

class ForgotPasswordRepository {
  final ApiClient apiClient = ApiClient();

  Future<void> sendEmail({required String email}) async {
    try {
      await apiClient.postRequest('api/web/forgot-password', data: <String, dynamic>{
        'email': email,
      }).then((Response<dynamic> value) {
        print('REPONSE LOGIN $value');
      });
    } catch (e) {
      print(e);
    }
    return null;
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
