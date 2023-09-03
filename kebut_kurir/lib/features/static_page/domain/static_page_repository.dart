import 'package:dio/dio.dart';

import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/static_page/args/static_page_args.dart';

class StaticPageRepository {
  StaticPageRepository();
  final ApiClient apiClient = ApiClient();
  Future<StaticPageArg> getStaticPage({required String staticType}) async {
    StaticPageArg? result;
    try {
      await apiClient
          .getRequest('api/web/reference/global-setting/app', queryParameters: {
        'key': staticType,
      }).then(
        (Response<dynamic> value) {
          print('ISI VALUE STATIC ${value.data['result'][0]['value']}');
          String title = '';
          if (value.data['result'][0]['key'] == 'term') {
            title = 'Syarat dan Ketentuan';
          } else {
            title = 'Kebijakan Privasi';
          }
          result = StaticPageArg(
              title: title, content: value.data['result'][0]['value']);
          return result;
        },
      );
      return result!;
    } catch (e) {
      print(e);
    }
    return StaticPageArg(title: '', content: '');
  }
}
