import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/location_utils.dart';

class MainScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  MainScreenController();
  late TabController tabController;
  RxInt tabIndex = 0.obs;
  Position? userPosition;
  RxString userLocation = ''.obs;

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
      print('ISI LOKASI USER ${userLocation.value}');
    } catch (e) {
      debugPrint("user location");
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
