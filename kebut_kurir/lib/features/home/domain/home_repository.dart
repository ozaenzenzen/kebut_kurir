import 'package:dio/dio.dart';
import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/home/data/home_banner_model.dart';
import 'package:kebut_kurir/features/home/data/home_menu_model.dart';
import 'package:kebut_kurir/features/home/data/total_delivery_daily_model.dart';
import 'package:kebut_kurir/features/home/data/total_pickup_daily_model.dart';

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

  Future<ResultTotalPickupDailyModel?> getTotalPickupDaily({required String uuid}) async {
    ResultTotalPickupDailyModel? result;
    try {
      await apiClient.getRequest(
        'api/web/kurir/total-pickup-daily/',
        queryParameters: {
          'uuid_users': uuid,
        },
      ).then(
        (Response<dynamic> value) {
          print('HASIL GET TOTAL DAILY ====>>> ${value.data}');
          result = ResultTotalPickupDailyModel.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<ResultTotalDeliveryDailyModel?> getTotalDelivertDaily({required String uuid}) async {
    ResultTotalDeliveryDailyModel? result;
    try {
      await apiClient.getRequest(
        'api/web/kurir/total-delivery-daily/',
        queryParameters: {
          'uuid_users': uuid,
        },
      ).then(
        (Response<dynamic> value) {
          print('HASIL GET TOTAL DAILY ====>>> ${value.data}');
          result = ResultTotalDeliveryDailyModel.fromJson(value.data);
        },
      );
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }
}
