import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/create_password/domain/create_password_repository.dart';

class CreatePasswordController extends GetxController {
  final BottomSheetUtils bottomSheetUtils = BottomSheetUtils();
  final DialogsUtils _dialogsUtils = DialogsUtils();

  final CreatePasswordRepository _forgotPasswordRepository = CreatePasswordRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool showPasswordBaruField = false.obs;
  RxBool showKonfirmasiPasswordBaruField = false.obs;

  RxBool emailFilled = false.obs;

  Future<void> createPassword({
    void Function()? onSuccess,
    void Function(String errorMessage)? onFailed,
  }) async {
    try {
      _dialogsUtils.showLoading();
      var status = await _forgotPasswordRepository.createPassword(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      if (status != null) {
        if (status.data['status'] == 200) {
          _dialogsUtils.hideLoading();
          onSuccess?.call();
        } else {
          _dialogsUtils.hideLoading();
          onFailed?.call("Error ${status.data['result']['message_detail']}");
        }
      } else {
        _dialogsUtils.hideLoading();
        onFailed?.call("Other error");
      }
    } catch (e) {
      _dialogsUtils.hideLoading();
      onFailed?.call("${e}");
    }
  }

  // Future<void> resetPassword() async {
  //   _dialogsUtils.showLoading();
  //   await _forgotPasswordRepository.resetPassword(
  //     email: tecEmail.text,
  //     newPass: passwordBaruController.text,
  //     newPassConfirm: konfirmasiPasswordBaruController.text,
  //   );
  //   _dialogsUtils.hideLoading();
  // }

  RxBool isSend = false.obs;
}
