import 'package:kebut_kurir/app/app_constant.dart';
import 'package:kebut_kurir/core/utils/preferences_helper.dart';

class Prefs {
  static Future<String> get userLogin => PreferencesHelper.getString(AppConstant.ACTIVE_USER);
  static Future<dynamic> setUserLogin(String value) => PreferencesHelper.setString(AppConstant.ACTIVE_USER, value);

  static Future<String> get authorizationToken => PreferencesHelper.getString(AppConstant.ACTIVE_TOKEN);
  static Future<dynamic> setAuthorizationToken(String value) => PreferencesHelper.setString(AppConstant.ACTIVE_TOKEN, value);

  static Future<bool> get isLogin => PreferencesHelper.getBool(AppConstant.IS_LOGIN);
  static Future<dynamic> setIsLogin(bool value) => PreferencesHelper.setBool(AppConstant.IS_LOGIN, value);

  static Future<String> get isAlreadyAbsen => PreferencesHelper.getString(AppConstant.DATE_TIME_ABSEN);
  static Future<dynamic> setIsAlreadyAbsen(String value) => PreferencesHelper.setString(AppConstant.DATE_TIME_ABSEN, value);

  static Future<String> get language => PreferencesHelper.getString(AppConstant.LANGUAGE);
  static Future<dynamic> setLanguage(String value) => PreferencesHelper.setString(AppConstant.LANGUAGE, value);

  static Future<String> get userId => PreferencesHelper.getString(AppConstant.USER_ID);
  static Future<dynamic> setUserId(String value) => PreferencesHelper.setString(AppConstant.USER_ID, value);

  static Future<String> get role => PreferencesHelper.getString(AppConstant.ROLE);
  static Future<dynamic> setRole(String value) => PreferencesHelper.setString(AppConstant.ROLE, value);

  static Future<String> get userProfilePicture => PreferencesHelper.getString(AppConstant.USER_PROFILE_PICTURE);
  static Future<dynamic> setProfilePicture(String value) => PreferencesHelper.setString(AppConstant.USER_PROFILE_PICTURE, value);

  static Future<bool> get rememberCredentials => PreferencesHelper.getBool(AppConstant.REMEMBER_CREDENTIAL);
  static Future<dynamic> setRememberCredentials(bool value) => PreferencesHelper.setBool(AppConstant.REMEMBER_CREDENTIAL, value);

  static Future<String> get email => PreferencesHelper.getString(AppConstant.EMAIL);
  static Future<dynamic> setEmail(String value) => PreferencesHelper.setString(AppConstant.EMAIL, value);

  static Future<String> get password => PreferencesHelper.getString(AppConstant.PASSWORD);
  static Future<dynamic> setPassword(String value) => PreferencesHelper.setString(AppConstant.PASSWORD, value);

  static Future<String> get userData => PreferencesHelper.getString(AppConstant.USER_DATA);
  static Future<dynamic> setUserData(String value) => PreferencesHelper.setString(AppConstant.USER_DATA, value);

  Future<void> clear() async {
    await Future.wait(<Future<dynamic>>[
      setIsLogin(false),
    ]);
  }
}
