import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/register/data/districts_model.dart';
import 'package:kebut_kurir/features/register/data/province_model.dart';
import 'package:kebut_kurir/features/register/data/regencies_model.dart';
import 'package:kebut_kurir/features/register/data/register_step_one_body_model.dart';
import 'package:kebut_kurir/features/register/data/register_step_one_model.dart';
import 'package:kebut_kurir/features/register/data/villages_model.dart';
import 'package:kebut_kurir/features/register/domain/register_repository.dart';

class RegisterController extends GetxController {
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecNik = TextEditingController();
  TextEditingController tecTmptLahir = TextEditingController();
  TextEditingController tecTglLahir = TextEditingController();
  TextEditingController tecNoHp = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecAlamat = TextEditingController();
  TextEditingController tecEmailPt = TextEditingController();
  TextEditingController tecNomorPt = TextEditingController();
  TextEditingController tecAlamatPt = TextEditingController();
  TextEditingController tecRtRw = TextEditingController();
  TextEditingController tecKel = TextEditingController();
  TextEditingController tecKec = TextEditingController();
  TextEditingController tecKota = TextEditingController();
  TextEditingController tecProv = TextEditingController();
  TextEditingController tecKodePos = TextEditingController();
  TextEditingController tecPass = TextEditingController();
  TextEditingController tecPassConfirm = TextEditingController();

  RxBool viewPass = false.obs;
  RxBool viewPassConfirm = false.obs;

  String selectedProvince = '';
  String selectedRegencies = '';
  String selectedDistricts = '';

  final double keyboardHeight = ScreenUtil().screenHeight * 0.4;
  RxBool isShowKeyboard = false.obs;

  String photoProfile = '';

  final DialogsUtils _dialogsUtils = DialogsUtils();

  Rx<ProvinceModel?> listProvinsi = Rx<ProvinceModel?>(null);
  Rx<RegenciesModel?> listRegencies = Rx<RegenciesModel?>(null);
  Rx<DistrictsModel?> listDistricts = Rx<DistrictsModel?>(null);
  Rx<VillagesModel?> listVillages = Rx<VillagesModel?>(null);

  final RegisterRepository _registerRepository = RegisterRepository();

  Future<List<String>> getListProvince(String query) async {
    List<String> listName = [];
    List<String> list = [];

    listProvinsi.value = await _registerRepository.getProvince();
    for (ProvinceData i in listProvinsi.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  Future<List<String>> getListRegencies(String query) async {
    List<String> listName = [];
    List<String> list = [];
    selectedProvince = listProvinsi.value!.result!.data!.firstWhere((ProvinceData element) => element.name == tecProv.text).uuid ?? '';
    print('UUID PROINVCE SELECTED $selectedProvince');
    listRegencies.value = await _registerRepository.getRegencies(selectedProvince);
    for (var i in listRegencies.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  Future<List<String>> getListDistricts(String query) async {
    List<String> listName = [];
    List<String> list = [];
    selectedRegencies = listRegencies.value!.result!.data!.firstWhere((element) => element.name == tecKota.text).uuid ?? '';
    listDistricts.value = await _registerRepository.getDistricts(selectedRegencies);
    for (var i in listDistricts.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  Future<List<String>> getListVillages(String query) async {
    List<String> listName = [];
    List<String> list = [];
    selectedDistricts = listDistricts.value!.result!.data!.firstWhere((element) => element.name == tecKec.text).uuid ?? '';
    listVillages.value = await _registerRepository.getVillages(selectedDistricts);
    for (var i in listVillages.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  Future<String?> _getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
  }

  Future<String?> _getDeviceModel() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.model;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    }
  }

  String _getDeviceType() {
    if (Platform.isIOS) {
      return 'ios';
    } else {
      return 'android';
    }
  }

  Future<void> registerStepOne({
    required Function() onSucces,
    required Function(String value) onFailed,
  }) async {
    _dialogsUtils.showLoading();
    String? deviceId = await _getDeviceId();
    String? deviceModel = await _getDeviceModel();
    String? deviceType = await _getDeviceType();

    RegisterStepOneModel? result = await _registerRepository.registerStepOne(
      body: RegisterStepOneBodyModel(
        email: tecEmail.text,
        handphone: tecNoHp.text,
        officeAddress: tecAlamatPt.text,
        officeEmail: tecEmailPt.text,
        officePhone: tecNomorPt.text,
        password: tecPass.text,
        repeatPassword: tecPassConfirm.text,
        shortname: tecNama.text,
        uuidTypeCustomers: usageType.value == 'Pribadi' ? 'mhZxPQQipb8SSeo' : '6rredhwyWgWdSpN',
        deviceId: deviceId,
        deviceModel: deviceModel,
        deviceType: deviceType,
      ),
    );
    print('RESULT REGISTER --->>> $result');
    if (result != null) {
      await Prefs.setUserId(result.result?.data?.uuid ?? '');
      print('PROFILE PHOTO USER ===> $photoProfile');
      await _registerRepository.registerUploadPhotoProfile(filePhoto: photoProfile, uuid: result.result!.data!.uuid ?? '');
      _dialogsUtils.hideLoading();
      onSucces();
    } else {
      _dialogsUtils.hideLoading();

      return onFailed('Register Gagal, Mohon cek kembali');
    }
  }

  RxString valuePenggunaan = ''.obs;
  RxString usageType = 'Pribadi'.obs;
  final bool argument = Get.arguments as bool;

  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((bool visible) {
      isShowKeyboard.value = visible;
    });
    super.onInit();
  }
}
