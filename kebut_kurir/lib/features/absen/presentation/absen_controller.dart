import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/location_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/absen/data/absen_model.dart';
import 'package:kebut_kurir/features/absen/data/request/absen_request_model.dart';
import 'package:kebut_kurir/features/absen/domain/absen_repository.dart';

class AbsenController extends GetxController {
  final DialogsUtils dialogUtils = Get.find();
  final AbsenRepository _absenRepository = AbsenRepository();

  Rx<Position>? userPosition;
  RxString userLocation = ''.obs;
  AbsenModel? absenData;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration.zero,()async{
      await getUserLocation();
    });
  }

  Future<void> getUserLocation() async {
    try {
      final Position? _userPosition = await LocationUtils.getCurrentPosition();

      if (_userPosition == null) {
        print("Jalan loh ini");
        return;
      }

      final LocationUtils? _locationInstance = await LocationUtils.instance(
        latitude: _userPosition.latitude,
        longitude: _userPosition.longitude,
      );

      if (_locationInstance == null) {
        return;
      }

      print('ISI LATITUTE USER ${_locationInstance.latitude}');
      print('ISI LONGITUTE USER ${_locationInstance.longitude}');

      final String _userLocation = await _locationInstance.getLocationAddress(
        latitude: _locationInstance.latitude ?? 0,
        longitude: _locationInstance.longitude ?? 0,
      );
      userPosition!.value = _userPosition;
      userLocation.value = _userLocation;
      update();
      print('ISI LOKASI USER ${userLocation.value}');
    } catch (e) {
      log("Error when get Location $e");
      debugPrint("user location");
    }
  }

  Future<AbsenModel?> absenUser() async {
    dialogUtils.showLoading();
    await getUserLocation();
    if (userPosition != null) {
      String uuid = await Prefs.userId;
      absenData = await _absenRepository.postAbsen(
        body: AbsenRequestModel(
          address: userLocation.value,
          uuidUsers: uuid,
          attendanceDatetime: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString(),
          latitude: userPosition!.value.latitude.toString(),
          longitude: userPosition!.value.longitude.toString(),
        ),
      );
      dialogUtils.hideLoading();
      return absenData;
    } else {
      dialogUtils.hideLoading();
      return absenData;
    }
  }
}
