import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/profile/data/req/change_password_request_model.dart';
import 'package:kebut_kurir/features/profile/data/resp/change_password_response_model.dart';
import 'package:kebut_kurir/features/profile/data/resp/get_faq_response_model.dart';
import 'package:kebut_kurir/features/profile/domain/profile_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileController extends GetxController {
  final DialogsUtils _dialogsUtils = DialogsUtils();
  RxString version = ''.obs;

  RxString imageProfile = ''.obs;

  Future<String?> getImageProfile() async {
    try {
      var returnImageData = await Prefs.userProfilePicture;
      imageProfile.value = returnImageData;
      // // await SharedPreferences.getInstance();  SharedPreferences prefs = await SharedPreferences.getInstance();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // imageProfile.value = await prefs.getString(AppConstant.USER_PROFILE_PICTURE)!;
      // debugPrint('imageProfile.value ${imageProfile.value}');
      return await Prefs.userProfilePicture;
    } catch (e) {
      return null;
    }
  }

  // ResultUserData? resultUserData;

  // Future<void> getUserDataLocal({
  //   required Function(ResultUserData) onSuccess,
  //   required Function(String) onFailed,
  // }) async {
  //   _dialogsUtils.showLoading();
  //   try {
  //     ResultUserData? result = await ProfileRepository().getUserDataLocal();
  //     if (result != null) {
  //       resultUserData = result;
  //       _dialogsUtils.hideLoading();
  //       onSuccess(result);
  //     } else {
  //       _dialogsUtils.hideLoading();
  //       onFailed('data is null');
  //     }
  //   } catch (e) {
  //     _dialogsUtils.hideLoading();
  //     onFailed(e.toString());
  //   }
  // }

  // Future<void> getUserDataRemote({
  //   required Function(GetUserDataResponseModel) onSuccess,
  //   required Function(String) onFailed,
  // }) async {
  //   // _dialogsUtils.showLoading();
  //   String uuid = await Prefs.userId;
  //   try {
  //     GetUserDataResponseModel? result = await LoginRepository().getUserDataRemote(
  //       uuid: uuid,
  //     );
  //     if (result != null) {
  //       if (result.status == 200) {
  //         if (result.result!.isNotEmpty) {
  //           await Prefs.setUserData(json.encode(result.result!.first.toJson()));
  //           String dataPhoto = result.result!.first.photoProfile!;
  //           await Prefs.setProfilePicture('https://kebut-main-api.jdi.web.id${dataPhoto.replaceAll(' ', '%20')}');
  //           resultUserData = result.result!.first;
  //           // _dialogsUtils.hideLoading();
  //           onSuccess(result);
  //         } else {
  //           // _dialogsUtils.hideLoading();
  //           onFailed('data is null');
  //         }
  //       } else {
  //         // _dialogsUtils.hideLoading();
  //         onFailed('data is null');
  //       }
  //     } else {
  //       // _dialogsUtils.hideLoading();
  //       onFailed('data is null');
  //     }
  //   } catch (e) {
  //     // _dialogsUtils.hideLoading();
  //     onFailed(e.toString());
  //   }
  // }

  Future<void> changePassword({
    required ChangePasswordRequestModel data,
    required Function(ChangePasswordResponseModel) onSuccess,
    required Function(String) onFailed,
  }) async {
    _dialogsUtils.showLoading();
    try {
      String uuid = await Prefs.userId;
      final ChangePasswordResponseModel? dataResponse = await ProfileRepository().changePassword(
        uuid: uuid,
        data: data,
      );
      if (dataResponse != null) {
        if (dataResponse.status == 200) {
          _dialogsUtils.hideLoading();
          onSuccess(dataResponse);
        } else {
          _dialogsUtils.hideLoading();
          onFailed('failed to get data');
        }
      } else {
        _dialogsUtils.hideLoading();
        onFailed('data is null');
      }
    } catch (error) {
      _dialogsUtils.hideLoading();
      onFailed(error.toString());
    }
  }

  GetFAQResponseModel? dataGetFAQResponseModel;

  Future<void> getFAQ({
    required Function(GetFAQResponseModel) onSuccess,
    required Function(String) onFailed,
  }) async {
    _dialogsUtils.showLoading();
    try {
      final GetFAQResponseModel? dataResponse = await ProfileRepository().getFAQ();
      if (dataResponse != null) {
        if (dataResponse.status == 200) {
          dataGetFAQResponseModel = dataResponse;
          _dialogsUtils.hideLoading();
          onSuccess(dataResponse);
        } else {
          _dialogsUtils.hideLoading();
          onFailed('failed to get data');
        }
      } else {
        _dialogsUtils.hideLoading();
        onFailed('data is null');
      }
    } catch (error) {
      _dialogsUtils.hideLoading();
      onFailed(error.toString());
    }
  }

  Future<void> generateVersionApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = '${packageInfo.version}+${packageInfo.buildNumber}';
  }

  @override
  void onInit() {
    super.onInit();
    generateVersionApp();
  }

  ScrollController scrollController = ScrollController();
  RxBool isRead = false.obs;

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    isRead.value = true;
  }
}
