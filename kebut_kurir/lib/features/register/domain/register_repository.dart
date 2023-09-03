import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/gender_model.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/marital_status_model.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/data/religion_model.dart';
import 'package:kebut_kurir/features/register/args/register_upload_file_args.dart';
import 'package:kebut_kurir/features/register/data/districts_model.dart';
import 'package:kebut_kurir/features/register/data/postal_code_model.dart';
import 'package:kebut_kurir/features/register/data/province_model.dart';
import 'package:kebut_kurir/features/register/data/regencies_model.dart';
import 'package:kebut_kurir/features/register/data/register_step_one_body_model.dart';
import 'package:kebut_kurir/features/register/data/register_step_one_model.dart';
import 'package:kebut_kurir/features/register/data/verify_ktp_model.dart';
import 'package:kebut_kurir/features/register/data/verify_stnk_model.dart';
import 'package:kebut_kurir/features/register/data/villages_model.dart';

class RegisterRepository {
  final ApiClient apiClient = ApiClient();

  Future<GenderModel?> getGender() async {
    GenderModel? result;
    try {
      await apiClient.getRequest('api/web/reference/gender', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = GenderModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<MaritalStatusModel?> getMaritalStatus() async {
    MaritalStatusModel? result;
    try {
      await apiClient.getRequest('api/web/reference/marital-status', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = MaritalStatusModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ReligionModel?> getReligions() async {
    ReligionModel? result;
    try {
      await apiClient.getRequest('api/web/reference/religions', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = ReligionModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ProvinceModel?> getProvince() async {
    ProvinceModel? result;
    try {
      await apiClient.getRequest('api/web/master/provinces', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
      }).then((dio.Response<dynamic> value) => result = ProvinceModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<RegenciesModel?> getRegencies(String provinceId) async {
    RegenciesModel? result;
    try {
      await apiClient.getRequest('api/web/master/regencies', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
        'key': provinceId,
      }).then((dio.Response<dynamic> value) => result = RegenciesModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<DistrictsModel?> getDistricts(String regenciesId) async {
    DistrictsModel? result;
    try {
      await apiClient.getRequest('api/web/master/districts', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
        'key': regenciesId,
      }).then((dio.Response<dynamic> value) => result = DistrictsModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<VillagesModel?> getVillages(String villagesId) async {
    VillagesModel? result;
    try {
      await apiClient.getRequest('api/web/master/villages', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
        'key': villagesId,
      }).then((dio.Response<dynamic> value) => result = VillagesModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<PostalCodeModel?> getPostalCode(String villagesId) async {
    PostalCodeModel? result;
    try {
      await apiClient.getRequest('api/web/master/postal-codes', queryParameters: {
        'search': '-',
        'page': '1',
        'limit': '999',
        'key': villagesId,
      }).then((dio.Response<dynamic> value) => result = PostalCodeModel.fromJson(value.data));
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<RegisterStepOneModel?> registerStepOne({required RegisterStepOneBodyModel body}) async {
    RegisterStepOneModel? result;
    log("request body : ${body.toString()}");
    try {
      await apiClient
          .postRequest(
        'api/auth/register/kurir',
        data: body.toJson(),
      )
          .then(
        (dio.Response<dynamic> value) {
          print('RETURN FIRST REGISTER ====>>> $value');
          result = RegisterStepOneModel.fromJson(value.data);
        },
      );

      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> registerUploadPhotoProfile({required String filePhoto, required String uuid}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap(
        {
          'file_photo_profile': await dio.MultipartFile.fromFile(
            '$filePhoto',
            filename: filePhoto.toString().split('/').last,
            contentType: MediaType('image', 'jpg'),
          ),
        },
      );
      await apiClient.putRequest('api/auth/register/upload-photo-profile/$uuid', data: formData).then(
        (value) {
          print('RETURN UPLOAD PHOTO PROFILE $value');
        },
      );
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> registerUploadKtp({required String filePhoto, required String uuid}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap(
        {
          'file_ktp': await dio.MultipartFile.fromFile(
            '$filePhoto',
            filename: 'ktp',
            contentType: MediaType('image', 'jpeg'),
          ),
        },
      );
      await apiClient.putRequest('api/auth/register/upload-ktp/$uuid', data: formData);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> registerUploadKtpSelfie({required String filePhoto, required String uuid}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap(
        {
          'file_selfie_ktp': await dio.MultipartFile.fromFile(
            '$filePhoto',
            filename: 'ktp_selfie',
            contentType: MediaType('image', 'jpeg'),
          ),
        },
      );
      await apiClient.putRequest('api/auth/register/upload-ktp-selfie/$uuid', data: formData);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> registerUploadEmployeCard({required String filePhoto, required String uuid}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap(
        {
          'file_employee_id_card': await dio.MultipartFile.fromFile(
            '$filePhoto',
            filename: 'employe_card',
            contentType: MediaType('image', 'jpeg'),
          ),
        },
      );
      await apiClient.putRequest('api/auth/register/upload-employee-id-card/$uuid', data: formData);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> registerUploadFile({required List<RegisterUploadFileArgs> listFiles, required String uuid, required String endPoint}) async {
    try {
      bool result = false;
      Map<String, dynamic> dataForm = <String, dynamic>{};
      for (var i = 0; i < listFiles.length; i++) {
        Map<String, dynamic> dataFormTemp = <String, dynamic>{};
        var values = listFiles.elementAt(i);
        dataFormTemp = {
          values.keyName!: await dio.MultipartFile.fromFile(
            values.filePath!,
            filename: values.filePath!.toString().split('/').last,
            contentType: MediaType('image', 'jpeg'),
          )
        };
        dataForm.addAll(dataFormTemp);
      }
      dio.FormData formData = dio.FormData.fromMap(
        dataForm,
      );

      await apiClient.putRequest(
        'api/auth/register/$endPoint/$uuid',
        data: formData,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
      ).then((value) {
        print('RETURN REGISTER ${value.data}');
        if (value.data['status'] == 200) {
          result = true;
        }
      });
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerVerifyKtp({required VerifyKtpBodyModel body, required String uuid}) async {
    try {
      bool result = false;
      await apiClient
          .putRequest(
        'api/auth/register/kurir/$uuid',
        data: body.toJson(),
      )
          .then(
        (value) {
          print('VALUE STATUS KTP ${value.data}');
          if (value.data['status'] == 200) {
            result = true;
          } else {
            result = false;
          }
        },
      );
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerVerifySTNK({required VerifyStnkBodyModel body, required String uuid}) async {
    try {
      bool result = false;
      await apiClient
          .putRequest(
        'api/auth/register/kurir/verify-doc/$uuid',
        data: body.toJson(),
      )
          .then(
        (value) {
          print('VALUE STATUS STNK ${value.data}');
          if (value.data['status'] == 200) {
            result = true;
          } else {
            result = false;
          }
        },
      );
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
