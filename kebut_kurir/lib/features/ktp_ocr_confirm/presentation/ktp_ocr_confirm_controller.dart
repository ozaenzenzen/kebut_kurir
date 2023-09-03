import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/args/ktp_ocr_confirm_args.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/gender_model.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/marital_status_model.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/religion_model.dart';
import 'package:kebut_kurir/features/register/data/districts_model.dart';
import 'package:kebut_kurir/features/register/data/postal_code_model.dart';
import 'package:kebut_kurir/features/register/data/province_model.dart';
import 'package:kebut_kurir/features/register/data/regencies_model.dart';
import 'package:kebut_kurir/features/register/data/verify_ktp_model.dart';
import 'package:kebut_kurir/features/register/data/villages_model.dart';
import 'package:kebut_kurir/features/register/domain/register_repository.dart';

class KTPOcrConfirmController extends GetxController {
  OcrEnum card = OcrEnum.KTP;
  // File? ocr;
  // File? ocrCropped;
  Rx<File?> ocr = Rx<File?>(null);
  Rx<File?> ocrCropped = Rx<File?>(null);
  final BottomSheetUtils bottomSheetUtils = BottomSheetUtils();
  final DialogsUtils dialogUtils = Get.find();

  TextEditingController tecNik = TextEditingController();
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecTmptLahir = TextEditingController();
  TextEditingController tecNegaraLahir = TextEditingController();
  TextEditingController tecTglLahir = TextEditingController();
  TextEditingController tecStatusKawin = TextEditingController();
  TextEditingController tecAgama = TextEditingController();
  TextEditingController tecAlamat = TextEditingController();
  TextEditingController tecRt = TextEditingController();
  TextEditingController tecRw = TextEditingController();
  TextEditingController tecProvinsi = TextEditingController();
  TextEditingController tecKota = TextEditingController();
  TextEditingController tecKelurahan = TextEditingController();
  TextEditingController tecKecamatan = TextEditingController();
  TextEditingController tecKodePos = TextEditingController();
  TextEditingController tecPekerjaan = TextEditingController();
  TextEditingController tecGolDarah = TextEditingController();

  var selectedGender = 'Pria'.obs;

  Rx<ProvinceModel?> listProvinsi = Rx<ProvinceModel?>(null);
  Rx<RegenciesModel?> listRegencies = Rx<RegenciesModel?>(null);
  Rx<DistrictsModel?> listDistricts = Rx<DistrictsModel?>(null);
  Rx<VillagesModel?> listVillages = Rx<VillagesModel?>(null);
  Rx<PostalCodeModel?> listPostalCode = Rx<PostalCodeModel?>(null);

  final double keyboardHeight = ScreenUtil().screenHeight * 0.4;
  RxBool isShowKeyboard = false.obs;

  String selectedProvince = '';
  String selectedRegencies = '';
  String selectedDistricts = '';
  String selectedVillages = '';

  RxString valueStatusPerkawinan = ''.obs;
  RxString valueAgama = ''.obs;

  final RegisterRepository _registerRepository = RegisterRepository();

  RxList<String> listGenders = RxList<String>();
  RxList<String> listMaritalStatus = RxList<String>();
  RxList<String> listReligions = RxList<String>();

  Rx<GenderModel?> genderModels = Rx<GenderModel?>(null);
  Rx<MaritalStatusModel?> martialStatusModels = Rx<MaritalStatusModel?>(null);
  Rx<ReligionModel?> religionsModel = Rx<ReligionModel?>(null);

  Future<List<String>> getListGenders() async {
    List<String> listName = [];
    List<String> list = [];

    genderModels.value = await _registerRepository.getGender();
    for (GenderData i in genderModels.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listGenders.clear();
    listName.addAll(list);
    listGenders.addAll(list);
    return listName;
  }

  Future<List<String>> getListMaritalStatus() async {
    List<String> listName = [];
    List<String> list = [];

    martialStatusModels.value = await _registerRepository.getMaritalStatus();
    for (MaritalStatusData i in martialStatusModels.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listGenders.clear();
    listName.addAll(list);
    listMaritalStatus.addAll(list);
    return listName;
  }

  Future<List<String>> getReligions() async {
    List<String> listName = [];
    List<String> list = [];

    religionsModel.value = await _registerRepository.getReligions();
    for (ReligionData i in religionsModel.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listGenders.clear();
    listName.addAll(list);
    listGenders.addAll(list);
    return listName;
  }

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
    selectedProvince = listProvinsi.value!.result!.data!.firstWhere((ProvinceData element) => element.name == tecProvinsi.text).uuid ?? '';
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
    selectedDistricts = listDistricts.value!.result!.data!.firstWhere((element) => element.name == tecKecamatan.text).uuid ?? '';
    listVillages.value = await _registerRepository.getVillages(selectedDistricts);
    for (var i in listVillages.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  Future<List<String>> getPostalCode(String query) async {
    List<String> listName = [];
    List<String> list = [];
    selectedVillages = listVillages.value!.result!.data!.firstWhere((element) => element.name == tecKelurahan.text).uuid ?? '';
    listPostalCode.value = await _registerRepository.getPostalCode(selectedVillages);
    for (var i in listPostalCode.value!.result!.data!) {
      list.add(i.name ?? '');
    }
    listName.addAll(list);
    listName.retainWhere((String s) => s.toLowerCase().contains(query.toLowerCase()));
    return listName;
  }

  String uuidGender() {
    String result = '';
    for (var i in genderModels.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == selectedGender.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidMartialStatus() {
    String result = '';
    for (var i in martialStatusModels.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == valueStatusPerkawinan.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidReligions() {
    String result = '';
    for (var i in religionsModel.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == valueAgama.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidProvince() {
    String result = '';
    for (var i in listProvinsi.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == selectedProvince.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidRegencies() {
    String result = '';
    for (var i in listRegencies.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == selectedRegencies.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidDistrict() {
    String result = '';
    for (var i in listDistricts.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == selectedDistricts.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  String uuidVilage() {
    String result = '';
    for (var i in listVillages.value!.result!.data!) {
      if (i.name != null) {
        if (i.name!.toLowerCase() == selectedVillages.toLowerCase()) {
          if (i.uuid != null) {
            result = i.uuid!;
          }
        }
      }
    }
    return result;
  }

  Future<void> verifyKtpData({
    required VerifyKtpBodyModel body,
    required Function() onSucces,
    required Function(String value) onFailed,
  }) async {
    dialogUtils.showLoading();
    log("body verify data KTP : ${body.toJson()} ");
    final bool result = await _registerRepository.registerVerifyKtp(body: body, uuid: await Prefs.userId);
    if (result) {
      dialogUtils.hideLoading();

      return onSucces();
    } else {
      dialogUtils.hideLoading();
      return onFailed('Proses Gagal');
    }
  }

  @override
  void onReady() async {
    List<Future> futures = [
      getListGenders(),
      getListMaritalStatus(),
      getReligions(),
    ];
    await Future.wait(futures);
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    final KtpConfirmDataArgs? args = Get.arguments as KtpConfirmDataArgs?;
    KeyboardVisibilityController().onChange.listen((bool visible) {
      isShowKeyboard.value = visible;
    });
    if (args != null) {
      card = args.card;
      ocr.value = args.ocr;
      ocrCropped.value = args.ocrCropped;
      tecNik.text = args.nik;
      tecNama.text = args.nama;
      tecTmptLahir.text = args.tempatLahir;
      tecTglLahir.text = args.tglLahir;
      tecStatusKawin.text = args.statusKawin;
      tecAgama.text = args.agama;
      tecAlamat.text = args.alamat;
      tecRt.text = args.rt;
      tecRw.text = args.rw;
      tecProvinsi.text = args.kecamatan;
      tecKelurahan.text = args.kelurahan;
      tecKecamatan.text = args.kecamatan;
      selectedGender.value = args.jenisKelamin.toLowerCase().contains('lak') ? 'Pria' : 'Wanita';
    }
  }
}
