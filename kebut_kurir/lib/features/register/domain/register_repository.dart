// import 'package:dio/dio.dart' as dio;
// import 'package:http_parser/http_parser.dart';
// import 'package:kebut_kurir/core/utils/api_function.dart';
// import 'package:kebut_kurir/features/register/data/districts_model.dart';
// import 'package:kebut_kurir/features/register/data/postal_code_model.dart';
// import 'package:kebut_kurir/features/register/data/province_model.dart';
// import 'package:kebut_kurir/features/register/data/regencies_model.dart';
// import 'package:kebut_kurir/features/register/data/register_step_one_body_model.dart';
// import 'package:kebut_kurir/features/register/data/register_step_one_model.dart';
// import 'package:kebut_kurir/features/register/data/verify_ktp_model.dart';
// import 'package:kebut_kurir/features/register/data/villages_model.dart';

// class RegisterRepository {
//   final ApiClient apiClient = ApiClient();

//   Future<ProvinceModel?> getProvince() async {
//     ProvinceModel? result;
//     try {
//       await apiClient.getRequest('api/web/master/provinces', queryParameters: {
//         'search': '-',
//         'page': '1',
//         'limit': '999',
//       }).then((dio.Response<dynamic> value) => result = ProvinceModel.fromJson(value.data));
//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<RegenciesModel?> getRegencies(String provinceId) async {
//     RegenciesModel? result;
//     try {
//       await apiClient.getRequest('api/web/master/regencies', queryParameters: {
//         'search': '-',
//         'page': '1',
//         'limit': '999',
//         'key': provinceId,
//       }).then((dio.Response<dynamic> value) => result = RegenciesModel.fromJson(value.data));
//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<DistrictsModel?> getDistricts(String regenciesId) async {
//     DistrictsModel? result;
//     try {
//       await apiClient.getRequest('api/web/master/districts', queryParameters: {
//         'search': '-',
//         'page': '1',
//         'limit': '999',
//         'key': regenciesId,
//       }).then((dio.Response<dynamic> value) => result = DistrictsModel.fromJson(value.data));
//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<VillagesModel?> getVillages(String villagesId) async {
//     VillagesModel? result;
//     try {
//       await apiClient.getRequest('api/web/master/villages', queryParameters: {
//         'search': '-',
//         'page': '1',
//         'limit': '999',
//         'key': villagesId,
//       }).then((dio.Response<dynamic> value) => result = VillagesModel.fromJson(value.data));
//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<PostalCodeModel?> getPostalCode(String villagesId) async {
//     PostalCodeModel? result;
//     try {
//       await apiClient.getRequest('api/web/master/postal-codes', queryParameters: {
//         'search': '-',
//         'page': '1',
//         'limit': '999',
//         'key': villagesId,
//       }).then((dio.Response<dynamic> value) => result = PostalCodeModel.fromJson(value.data));
//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<RegisterStepOneModel?> registerStepOne({required RegisterStepOneBodyModel body}) async {
//     RegisterStepOneModel? result;
//     try {
//       await apiClient
//           .postRequest(
//         'api/auth/register/customer',
//         data: body.toJson(),
//       )
//           .then(
//         (dio.Response<dynamic> value) {
//           print('RETURN FIRST REGISTER ====>>> $value');
//           result = RegisterStepOneModel.fromJson(value.data);
//         },
//       );

//       if (result != null) {
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<void> registerUploadPhotoProfile({required String filePhoto, required String uuid}) async {
//     try {
//       dio.FormData formData = dio.FormData.fromMap(
//         {
//           'file_photo_profile': await dio.MultipartFile.fromFile(
//             '$filePhoto',
//             filename: filePhoto.toString().split('/').last,
//             contentType: MediaType('image', 'jpg'),
//           ),
//         },
//       );
//       await apiClient.putRequest('api/auth/register/upload-photo-profile/$uuid', data: formData).then(
//         (value) {
//           print('RETURN UPLOAD PHOTO PROFILE $value');
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<void> registerUploadKtp({required String filePhoto, required String uuid}) async {
//     try {
//       dio.FormData formData = dio.FormData.fromMap(
//         {
//           'file_ktp': await dio.MultipartFile.fromFile(
//             '$filePhoto',
//             filename: 'ktp',
//             contentType: MediaType('image', 'jpeg'),
//           ),
//         },
//       );
//       await apiClient.putRequest('api/auth/register/upload-ktp/$uuid', data: formData);
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<void> registerUploadKtpSelfie({required String filePhoto, required String uuid}) async {
//     try {
//       dio.FormData formData = dio.FormData.fromMap(
//         {
//           'file_selfie_ktp': await dio.MultipartFile.fromFile(
//             '$filePhoto',
//             filename: 'ktp_selfie',
//             contentType: MediaType('image', 'jpeg'),
//           ),
//         },
//       );
//       await apiClient.putRequest('api/auth/register/upload-ktp-selfie/$uuid', data: formData);
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<void> registerUploadEmployeCard({required String filePhoto, required String uuid}) async {
//     try {
//       dio.FormData formData = dio.FormData.fromMap(
//         {
//           'file_employee_id_card': await dio.MultipartFile.fromFile(
//             '$filePhoto',
//             filename: 'employe_card',
//             contentType: MediaType('image', 'jpeg'),
//           ),
//         },
//       );
//       await apiClient.putRequest('api/auth/register/upload-employee-id-card/$uuid', data: formData);
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<bool> registerUploadFile(
//       {required String photoKtp, required String photoSelfie, required String photoEmploye, required String uuid}) async {
//     try {
//       bool result = false;
//       dio.FormData formData = dio.FormData.fromMap(
//         {
//           'file_ktp': await dio.MultipartFile.fromFile(
//             photoKtp,
//             filename: photoKtp.toString().split('/').last,
//             contentType: MediaType('image', 'jpeg'),
//           ),
//           'file_selfie_ktp': await dio.MultipartFile.fromFile(
//             photoSelfie,
//             filename: photoSelfie.toString().split('/').last,
//             contentType: MediaType('image', 'jpeg'),
//           ),
//           if (photoEmploye != '')
//             'file_employee_id_card': await dio.MultipartFile.fromFile(
//               photoEmploye,
//               filename: photoEmploye.toString().split('/').last,
//               contentType: MediaType('image', 'jpeg'),
//             ),
//         },
//       );
//       print('ISI FORM DATA ${photoSelfie.toString().split('/').last}');

//       await apiClient.putRequest(
//         'api/auth/register/upload-file/$uuid',
//         data: formData,
//         headers: <String, String>{
//           'Accept': 'application/json',
//           'Content-Type': 'multipart/form-data',
//         },
//       ).then((value) {
//         print('RETURN REGISTER ${value.data}');
//         if (value.data['status'] == 200) {
//           result = true;
//         }
//       });
//       return result;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> registerVerifyKtp({required VerifyKtpBodyModel body, required String uuid}) async {
//     try {
//       bool result = false;
//       await apiClient
//           .putRequest(
//         'api/auth/register/customer/$uuid',
//         data: body.toJson(),
//       )
//           .then(
//         (value) {
//           print('VALUE STATUS KTP ${value.data}');
//           if (value.data['status'] == 200) {
//             result = true;
//           } else {
//             result = false;
//           }
//         },
//       );
//       return result;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
