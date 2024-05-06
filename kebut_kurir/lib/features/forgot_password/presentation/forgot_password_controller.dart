import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/forgot_password/domain/forgot_password_repository.dart';

class ForgotPasswordController extends GetxController {
  final BottomSheetUtils bottomSheetUtils = BottomSheetUtils();
  final DialogsUtils _dialogsUtils = DialogsUtils();
  TextEditingController tecEmail = TextEditingController();

  final ForgotPasswordRepository _forgotPasswordRepository = ForgotPasswordRepository();

  TextEditingController passwordLamaController = TextEditingController();
  TextEditingController passwordBaruController = TextEditingController();
  TextEditingController konfirmasiPasswordBaruController = TextEditingController();

  RxBool showPasswordBaruField = false.obs;
  RxBool showKonfirmasiPasswordBaruField = false.obs;

  RxBool emailFilled = false.obs;

  Future<void> sendEmail() async {
    _dialogsUtils.showLoading();
    await _forgotPasswordRepository.sendEmail(email: tecEmail.text);
    _dialogsUtils.hideLoading();
  }

  Future<void> resetPassword() async {
    _dialogsUtils.showLoading();
    await _forgotPasswordRepository.resetPassword(
      email: tecEmail.text,
      newPass: passwordBaruController.text,
      newPassConfirm: konfirmasiPasswordBaruController.text,
    );
    _dialogsUtils.hideLoading();
  }

  RxBool isSend = false.obs;
}
