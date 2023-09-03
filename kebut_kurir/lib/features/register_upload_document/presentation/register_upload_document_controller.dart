import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/register/args/register_upload_file_args.dart';
import 'package:kebut_kurir/features/register_upload_document/domain/register_upload_document_repository.dart';

class RegisterUploadDocumentController extends GetxController {
  final BottomSheetUtils guideDialog = Get.find();
  OcrEnum card = OcrEnum.KTP;
  RxBool isAgree = false.obs;

  final DialogsUtils _dialogsUtils = DialogsUtils();

  Rx<File?> ocrKtp = Rx<File?>(null);
  Rx<File?> liveness = Rx<File?>(null);
  Rx<File?> sim = Rx<File?>(null);
  Rx<File?> stnk = Rx<File?>(null);

  Rx<File?> kendaraanDepan = Rx<File?>(null);
  Rx<File?> kendaraanBelakang = Rx<File?>(null);
  Rx<File?> kendaraanSampingKiri = Rx<File?>(null);
  Rx<File?> kendaraansampingKanan = Rx<File?>(null);

  final RegisterUploadDocumentRepository _registerUploadDocumentRepository = RegisterUploadDocumentRepository();

  // RxBool buttonUploadActive = false.obs;

  Future<void> uploadAllSingle({required Function() onSuccess, required Function(String) onFailed}) async {
    try {
      _dialogsUtils.showLoading();
      await Future.wait([
        uploadKTP(),
        uploaSelfie(),
        uploadSIM(),
        uploadSTNK(),
        uploadKendaraan(),
      ]).then((value) {
        _dialogsUtils.hideLoading();
        return onSuccess();
      });
    } catch (e) {
      _dialogsUtils.hideLoading();
      log("Error when upload All File $e");
      return onFailed(e.toString());
    }
  }

  Future<bool> uploadKTP() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: ocrKtp.value!.path,
        keyName: 'file_ktp',
      )
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'upload-file-ktp',
    );
    if (!result) {
      throw Exception('When upload KTP');
    }
    return result;
  }

  Future<bool> uploaSelfie() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: liveness.value!.path,
        keyName: 'file_selfie_ktp',
      )
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'kurir/upload-file-ktp-with-selfie-ktp',
    );
    if (!result) {
      throw Exception('When upload Selfie');
    }
    return result;
  }

  Future<bool> uploadKTPandSelfie() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: ocrKtp.value!.path,
        keyName: 'file_ktp',
      ),
      RegisterUploadFileArgs(
        filePath: liveness.value!.path,
        keyName: 'file_selfie_ktp',
      )
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'kurir/upload-file-ktp-with-selfie-ktp',
    );
    if (!result) {
      throw Exception('When upload KTP and Selfie');
    }
    return result;
  }

  Future<bool> uploadSIM() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: sim.value!.path,
        keyName: 'file_sim',
      ),
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'kurir/upload-sim',
    );
    if (!result) {
      throw Exception('When upload SIM');
    }
    return result;
  }

  Future<bool> uploadSTNK() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: stnk.value!.path,
        keyName: 'file_stnk',
      ),
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'kurir/upload-stnk',
    );
    if (!result) {
      throw Exception('When upload STNK');
    }
    return result;
  }

  Future<bool> uploadKendaraan() async {
    List<RegisterUploadFileArgs> list = [
      RegisterUploadFileArgs(
        filePath: kendaraanDepan.value!.path,
        keyName: 'image_front_view',
      ),
      RegisterUploadFileArgs(
        filePath: kendaraanSampingKiri.value!.path,
        keyName: 'image_side_view',
      ),
      RegisterUploadFileArgs(
        filePath: kendaraanBelakang.value!.path,
        keyName: 'image_back_view',
      ),
    ];
    final bool result = await _registerUploadDocumentRepository.registerUploadFile(
      listFiles: list,
      uuid: await Prefs.userId,
      endPoint: 'kurir/upload-image-vehicle',
    );
    if (!result) {
      throw Exception('When upload Foto Kendaraan');
    }
    return result;
  }
}
