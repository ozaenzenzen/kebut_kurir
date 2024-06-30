import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/edit_profile/data/get_user_data_response_model.dart';
import 'package:kebut_kurir/features/login/domain/login_repository.dart';

class EditProfileController extends GetxController {
  TextEditingController namaPanggilanController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHandphoneController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  final DialogsUtils _dialogsUtils = DialogsUtils();

  @override
  void onInit() async {
    super.onInit();
    await getUserDataRemote(
      onSuccess: (data) {},
      onFailed: (error) {},
    );
  }

  RxBool getRemoteDataLoading = false.obs;

  ResultUserData? resultUserData;

  Future<void> getUserDataRemote({
    required Function(GetUserDataResponseModel) onSuccess,
    required Function(String) onFailed,
  }) async {
    // _dialogsUtils.showLoading();
    getRemoteDataLoading.value = true;
    String uuid = await Prefs.userId;
    try {
      GetUserDataResponseModel? result = await LoginRepository().getUserDataRemote(
        uuid: uuid,
      );
      if (result != null) {
        if (result.status == 200) {
          if (result.result!.isNotEmpty) {
            await Prefs.setUserData(json.encode(result.result!.first.toJson()));
            if (result.result!.first.photoProfile != null) {
              String dataPhoto = result.result!.first.photoProfile!;
              await Prefs.setProfilePicture('https://kebut-main-api.jdi.web.id${dataPhoto.replaceAll(' ', '%20')}');
            } else {
              //
            }
            resultUserData = result.result!.first;
            // _dialogsUtils.hideLoading();
            getRemoteDataLoading.value = false;
            onSuccess(result);
          } else {
            // _dialogsUtils.hideLoading();
            getRemoteDataLoading.value = false;
            onFailed('data is null');
          }
        } else {
          // _dialogsUtils.hideLoading();
          getRemoteDataLoading.value = false;
          onFailed('data is null');
        }
      } else {
        // _dialogsUtils.hideLoading();
        getRemoteDataLoading.value = false;
        onFailed('data is null');
      }
    } catch (e) {
      // _dialogsUtils.hideLoading();
      getRemoteDataLoading.value = false;
      onFailed(e.toString());
    }
  }
}
