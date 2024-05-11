// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRController extends GetxController {
  final result = Barcode(null, BarcodeFormat.unknown, null).obs;

  void onQrViewCreated(QRViewController controller) {}

  void updateBarCode(Barcode barcode) {
    result.value = barcode;
  }
}
