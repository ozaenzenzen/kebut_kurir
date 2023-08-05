import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/login/data/model/login_model.dart';
import 'package:kebut_kurir/features/login/domain/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepo = LoginRepository();
  final DialogsUtils dialogsUtils = DialogsUtils();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();
  LoginModel? userData;
  RxString userLocation = ''.obs;
  RxBool isError = false.obs;
  RxBool viewPass = false.obs;

  RxString errorText = ''.obs;
  // ResultUserData? resultUserData;

  // Future<LoginModel?> loginUser() async {
  //   dialogsUtils.showLoading();
  //   userData = await _loginRepo.postLogin(
  //     email: tecEmail.text,
  //     password: tecPass.text,
  //   );
  //   await Prefs.setIsLogin(true);
  //   // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // await prefs.setBool(AppConstant.IS_LOGIN, true);
  //   print('USER DATA $userData');
  //   bool balikan = await Prefs.isLogin;
  //   debugPrint('isLogin $balikan');
  //   if (userData != null) {
  //     if (userData!.result!.token != null) {
  //       await Prefs.setUserId(userData!.result!.user!.uuid ?? '');
  //       GetUserDataResponseModel? getUserDataResponseModel = await _loginRepo.getUserDataRemote(
  //         uuid: userData!.result!.user!.uuid.toString(),
  //       );
  //       if (getUserDataResponseModel != null) {
  //         if (getUserDataResponseModel.status == 200) {
  //           if (getUserDataResponseModel.result!.isNotEmpty) {
  //             await Prefs.setUserData(
  //               json.encode(
  //                 getUserDataResponseModel.result!.first.toJson(),
  //               ),
  //             );
  //             resultUserData = getUserDataResponseModel.result!.first;
  //             isError.value = false;
  //           } else {
  //             errorText.value = getUserDataResponseModel.status.toString();
  //             isError.value = true;
  //           }
  //         } else {
  //           errorText.value = getUserDataResponseModel.status.toString();
  //           isError.value = true;
  //         }
  //       } else {
  //         errorText.value = getUserDataResponseModel?.status.toString() ?? 'Error From Server';
  //         isError.value = true;
  //       }
  //     } else {
  //       errorText.value = userData!.result!.message ?? 'Error From Server';
  //       isError.value = true;
  //     }
  //   } else {
  //     errorText.value = 'Error From Server';
  //     isError.value = true;
  //   }
  //   dialogsUtils.hideLoading();
  //   return userData;
  // }

  @override
  void onInit() {
    super.onInit();
  }
}
