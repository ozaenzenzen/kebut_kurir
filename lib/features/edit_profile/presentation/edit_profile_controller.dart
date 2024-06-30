import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/edit_profile/data/edit_profile_company_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/get_user_data_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/request/edit_profile_company_request_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/upload_photo_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/domain/edit_profile_repository.dart';
import 'package:kebut_kurir/features/login/domain/login_repository.dart';

class EditProfileController extends GetxController {
  TextEditingController namaPanggilanController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHandphoneController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  final DialogsUtils _dialogsUtils = DialogsUtils();

  RxString imageProfile = "".obs;
  ImageData? profileImage;

  bool fieldChanged = false;

  @override
  void onInit() async {
    super.onInit();
    await getUserDataRemote(
      onSuccess: (data) {},
      onFailed: (error) {},
    );
    await getImageProfile();
  }

  Future<void> uploadPhotoProfile(
    ImageData imageData, {
    required Function() onSuccess,
    required Function(String) onFailed,
  }) async {
    _dialogsUtils.showLoading();
    try {
      List<String> listSplitString = imageData.filePath.toString().split('/');
      debugPrint('listSplitString $listSplitString');

      dio.MultipartFile multipartFile = await dio.MultipartFile.fromFile(
        '${imageData.filePath}',
        filename: listSplitString.last,
        contentType: MediaType('image', 'jpeg'),
      );

      Map<String, dynamic> dataSent = <String, dynamic>{
        'file_photo_profile': multipartFile,
      };
      String uuidUser = await Prefs.userId;
      // String uuidUser = 'fdaHJ79356JLLgg';
      debugPrint('uuidUser $uuidUser');
      final UploadPhotoResponseModel? dataResponse = await EditProfileRepository().uploadPhotoProfile(
        imageData: dataSent,
        uuid: uuidUser,
      );

      if (dataResponse != null) {
        if (dataResponse.status == 200) {
          // await Prefs.setProfilePicture(imageData.base64Value!);
          _dialogsUtils.hideLoading();
          onSuccess();
        } else {
          _dialogsUtils.hideLoading();
          onFailed(dataResponse.result.toString());
        }
      } else {
        _dialogsUtils.hideLoading();
        onFailed('returned null');
      }
    } catch (error) {
      _dialogsUtils.hideLoading();
      onFailed(error.toString());
    }
  }

  Future<String?> getImageProfile() async {
    debugPrint('getImageProfile');
    try {
      imageProfile.value = await Prefs.userProfilePicture;
      // debugPrint('imageProfile.value ${imageProfile.value}');
      return await Prefs.userProfilePicture;
    } catch (e) {
      return null;
    }
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

  Future<void> editProfile({
    required EditProfileCompanyRequestModel data,
    required Function(EditProfileCompanyResponseModel) onSuccess,
    required Function(String) onFailed,
  }) async {
    _dialogsUtils.showLoading();
    // getRemoteDataLoading.value = true;
    String uuid = await Prefs.userId;
    try {
      EditProfileCompanyResponseModel? result = await EditProfileRepository().editProfileCompany(
        uuid: uuid,
        data: data,
      );
      if (result != null) {
        if (result.status == 200) {
          // getRemoteDataLoading.value = false;
          onSuccess(result);
        } else {
          _dialogsUtils.hideLoading();
          // getRemoteDataLoading.value = false;
          onFailed('data is null');
        }
      } else {
        _dialogsUtils.hideLoading();
        // getRemoteDataLoading.value = false;
        onFailed('data is null');
      }
    } catch (e) {
      _dialogsUtils.hideLoading();
      // getRemoteDataLoading.value = false;
      onFailed(e.toString());
    }
  }
}
