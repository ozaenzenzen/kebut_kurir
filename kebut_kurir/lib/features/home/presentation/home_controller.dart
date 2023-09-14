import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/home/data/home_banner_model.dart';
import 'package:kebut_kurir/features/home/data/home_menu_model.dart';
import 'package:kebut_kurir/features/home/data/total_delivery_daily_model.dart';
import 'package:kebut_kurir/features/home/data/total_pickup_daily_model.dart';
import 'package:kebut_kurir/features/home/domain/home_repository.dart';

class HomeController extends GetxController {
  List<String> homeBanner = <String>[];
  RxInt activeIndex = 0.obs;
  RxList<HomeMenuData> listMenu = RxList<HomeMenuData>();

  RxInt totalPickupDaily = 0.obs;
  RxInt totalDeliveryDaily = 0.obs;

  RxBool isAlreadyPresent = false.obs;

  final HomeRepository _homeRepository = HomeRepository();

  Future<void> fetchTotalPickupDaily() async {
    final ResultTotalPickupDailyModel? result = await _homeRepository.getTotalPickupDaily(uuid: await Prefs.userId);
    if (result != null) {
      if (result.result != null) {
        totalPickupDaily.value = result.result!.total!;
      }
    }
  }

  Future<void> fetchTotalDelivertDaily() async {
    final ResultTotalDeliveryDailyModel? result = await _homeRepository.getTotalDelivertDaily(uuid: await Prefs.userId);
    if (result != null) {
      if (result.result != null) {
        totalDeliveryDaily.value = result.result!.total!;
      }
    }
  }

  void onBannerChanged(int index) {
    activeIndex.value = index;
  }

  @override
  void onReady() {
    // getVoucherData(
    //   onSuccess: (GetVoucherResponseModel data) {
    //     update();
    //   },
    //   onFailed: (String errorMessage) {},
    // );
    super.onReady();
  }

  @override
  void onInit() {
    // fetchHomeBanner();
    // fetchListMenu();
    // getUserDataRemote(
    //   onSuccess: (GetUserDataResponseModel data) {
    //     update();
    //   },
    //   onFailed: (String errorMessage) {},
    // );
    super.onInit();
    Future.wait([
      isAlreadyAbsen(),
      fetchTotalDelivertDaily(),
      fetchTotalPickupDaily(),
    ]);
  }

  Future<void> isAlreadyAbsen() async {
    String presentDatetime = await Prefs.isAlreadyAbsen;
    if (presentDatetime.isNotEmpty) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final dateToCheck = DateTime.parse(await Prefs.isAlreadyAbsen);
      final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
      if (aDate == today) {
        isAlreadyPresent.value = true;
      } else {
        isAlreadyPresent.value = false;
      }
      update();
    }
  }

  RxString imageProfile = ''.obs;

  Future<String?> getImageProfile() async {
    try {
      var returnImageData = await Prefs.userProfilePicture;
      imageProfile.value = returnImageData;
      return await Prefs.userProfilePicture;
    } catch (e) {
      return null;
    }
  }

  // Future<void> getUserDataRemote({
  //   required Function(GetUserDataResponseModel) onSuccess,
  //   required Function(String) onFailed,
  // }) async {
  //   // _dialogsUtils.showLoading();
  //   String uuid = await Prefs.userId;
  //   try {
  //     GetUserDataResponseModel? result = await LoginRepository().getUserDataRemote(
  //       uuid: uuid,
  //     );
  //     if (result != null) {
  //       if (result.status == 200) {
  //         if (result.result!.isNotEmpty) {
  //           await Prefs.setUserData(json.encode(result.result!.first.toJson()));
  //           String dataPhoto = result.result!.first.photoProfile!;
  //           await Prefs.setProfilePicture('https://kebut-main-api.jdi.web.id${dataPhoto.replaceAll(' ', '%20')}');
  //           resultUserData = result.result!.first;
  //           // _dialogsUtils.hideLoading();
  //           onSuccess(result);
  //         } else {
  //           // _dialogsUtils.hideLoading();
  //           onFailed('data is null');
  //         }
  //       } else {
  //         // _dialogsUtils.hideLoading();
  //         onFailed('data is null');
  //       }
  //     } else {
  //       // _dialogsUtils.hideLoading();
  //       onFailed('data is null');
  //     }
  //   } catch (e) {
  //     // _dialogsUtils.hideLoading();
  //     onFailed(e.toString());
  //   }
  // }

  // ResultUserData? resultUserData;

  // Future<ResultUserData?> getUserDataLocal() async {
  //   try {
  //     try {
  //       String returnUserData = await Prefs.userData;
  //       resultUserData = ResultUserData.fromJson(json.decode(returnUserData));
  //       return resultUserData;
  //     } catch (e) {
  //       return null;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // final DialogsUtils _dialogsUtils = DialogsUtils();

  // List<ResultGetVoucher>? listDataVoucher;

  // Future<void> getVoucherData({
  //   required Function(GetVoucherResponseModel) onSuccess,
  //   required Function(String) onFailed,
  // }) async {
  //   _dialogsUtils.showLoading();
  //   try {
  //     String uuid = await Prefs.userId;
  //     final GetVoucherResponseModel? dataResponse = await VoucherRepository().getVoucherData(
  //       uuid,
  //     );
  //     if (dataResponse != null) {
  //       if (dataResponse.status == 200) {
  //         listDataVoucher = dataResponse.result;
  //         _dialogsUtils.hideLoading();
  //         onSuccess(dataResponse);
  //       } else {
  //         _dialogsUtils.hideLoading();
  //         onFailed('failed to get data');
  //       }
  //     } else {
  //       _dialogsUtils.hideLoading();
  //       onFailed('data is null');
  //     }
  //   } catch (error) {
  //     _dialogsUtils.hideLoading();
  //     onFailed(error.toString());
  //   }
  // }
}
 // HomeMenuModelData(
    //     asset: 'assets/ab_img.png',
    //     title: 'Antar Barang',
    //     route: Routes.kurirPaketScreen),
    // HomeMenuModelData(
    //     asset: 'assets/ic_sewa_gudang.png',
    //     title: 'Sewa Gudang',
    //     route: '/antar_barang'),
    // HomeMenuModelData(
    //     asset: 'assets/order_ic.svg',
    //     title: 'Pesanan Saya',
    //     route: Routes.myOrder),
    // HomeMenuModelData(
    //     asset: 'assets/outlet_ic.svg',
    //     title: 'Outlet',
    //     route: Routes.rekamJejakScreen),
    // HomeMenuModelData(
    //     asset: 'assets/voucher_ic.svg',
    //     title: 'Voucher',
    //     route: Routes.voucherScreen),
    // HomeMenuModelData(
    //   asset: 'assets/promo_ic.svg',
    //   title: 'Promo',
    //   route: Routes.promoScreen,
    // ),
    // HomeMenuModelData(
    //     asset: 'assets/dompet_ic.svg',
    //     title: 'Dompetku',
    //     route: '/antar_barang'),
    // HomeMenuModelData(
    //     asset: 'assets/hubungin_ic.svg',
    //     title: 'Hubungi Kami',
    //     route: Routes.hubungiKami),