import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/location_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/main/data/check_courier_by_postal_code_data.dart';
import 'package:kebut_kurir/features/main/domain/main_repository.dart';

class MainScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  MainScreenController();
  late TabController tabController;
  RxInt tabIndex = 0.obs;
  Position? userPosition;
  RxString userLocation = ''.obs;

  final MainRepository _mainRepository = MainRepository();

  void getUserLocation() async {
    try {
      final Position? _userPosition = await LocationUtils.getCurrentPosition();

      final LocationUtils? _locationInstance = await LocationUtils.instance(
        latitude: _userPosition?.latitude,
        longitude: _userPosition?.longitude,
      );
      print('ISI LATITUTE USER ${_locationInstance?.latitude}');
      print('ISI LONGITUTE USER ${_locationInstance?.longitude}');

      final String _userLocation = await _locationInstance!.getLocationAddress(
        latitude: _locationInstance.latitude ?? 0,
        longitude: _locationInstance.longitude ?? 0,
      );
      userPosition = _userPosition;
      userLocation.value = _userLocation;
      if (userLocation.value.isNotEmpty) {
        await fetchCheckCourierbyPostalCode();
      }
      print('ISI LOKASI USER ${userLocation.value}');
    } catch (e) {
      debugPrint("user location");
    }
  }

  Future<void> fetchCheckCourierbyPostalCode() async {
    final CheckCourierbyPostalCodeData? result = await _mainRepository.getCheckCourierbyPostalCode(postalCode: userLocation.value.split(',').last.trim());
    if (result != null) {
      if (result.result != null) {
        if (result.result!.isNotEmpty) {
          String uuid = await Prefs.userId;
          result.result!.forEach((element) {
            if (element.uuid == uuid) {
              print("ada couriernya : ${element.email}");
            }
          });
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    initTab();
    getUserLocation();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void initTab() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      tabIndex.value = tabController.index;
      tabManager();
    });
  }

  void tabManager() {
    tabController.animateTo(tabIndex.value);
  }
}
