import 'dart:developer';

import 'package:http_parser/http_parser.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/register/args/register_upload_file_args.dart';
import 'package:dio/dio.dart' as dio;

class RegisterUploadDocumentRepository {
  final ApiClient apiClient = ApiClient();

  Future<bool> registerUploadFile({required List<RegisterUploadFileArgs> listFiles, required String uuid, required String endPoint}) async {
    try {
      bool result = false;
      Map<String, dynamic> dataForm = <String, dynamic>{};
      for (var i = 0; i < listFiles.length; i++) {
        Map<String, dynamic> dataFormTemp = <String, dynamic>{};
        var values = listFiles.elementAt(i);
        log("Data File ${values.filePath}");
        dataFormTemp = {
          values.keyName!: await dio.MultipartFile.fromFile(
            values.filePath!,
            filename: values.filePath!.toString().split('/').last,
            contentType: MediaType('image', values.filePath!.toString().split('/').last.split('.').last),
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
      log("Success When upload endpoint : $endPoint");
      return result;
    } catch (e) {
      print(e);
      log("Error When upload endpoint : $endPoint");
      return false;
    }
  }
}
