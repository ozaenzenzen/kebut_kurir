import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    dio = Dio();
    dio.options.baseUrl = 'https://kebut-main-api.jdi.web.id/'; // API URL
  }

  Future<Response> getRequest(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // handle server response errors

      } else {
        // handle no response errors

      }
      rethrow;
    }
  }

  Future<Response> postRequest(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // handle server response errors

      } else {
        // handle no response errors

      }
      rethrow;
    }
  }

  Future<Response> putRequest(String path, {Object? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // handle server response errors

      } else {
        // handle no response errors

      }
      rethrow;
    }
  }

  Future<Response> deleteRequest(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.delete(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // handle server response errors
       
      } else {
        // handle no response errors
      }
      rethrow;
    }
  }

}
