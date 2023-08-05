import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/home/data/home_banner_model.dart';
import 'package:kebut_kurir/features/home/data/home_menu_model.dart';

class HomeRepository {
  HomeRepository();
  final ApiClient apiClient = ApiClient();
  Future<HomeMenuModel?> getListMenu({required String uuid}) async {
    HomeMenuModel? result;
    try {
      await apiClient.getRequest(
        'api/web/reference/feature',
        queryParameters: {
          'uuid': uuid,
          'search': '-',
          'page': '1',
          'limit': '999',
        },
      ).then(
        (Response<dynamic> value) {
          print('HASIL GET PROMO ====>>> ${value.data}');
          result = HomeMenuModel.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }

   Future<HomeBannerModel?> getHomeBanner() async {
    HomeBannerModel? result;
    try {
      await apiClient.getRequest(
        'api/web/reference/banner',
        queryParameters: {
          'search': '-',
          'page': '1',
          'limit': '999',
        },
      ).then(
        (Response<dynamic> value) {
          print('HASIL GET PROMO ====>>> ${value.data}');
          result = HomeBannerModel.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }
}
