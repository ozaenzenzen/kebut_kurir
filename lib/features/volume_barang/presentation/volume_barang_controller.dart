import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';

class VolumeBarangController extends GetxController {
  TextEditingController controllerPanjang = TextEditingController();
  TextEditingController controllerLebar = TextEditingController();
  TextEditingController controllerTinggi = TextEditingController();
  TextEditingController controllerVolume = TextEditingController();

  final DialogsUtils dialogUtils = Get.find();
}
