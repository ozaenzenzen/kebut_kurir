import 'dart:io';

import 'package:kebut_kurir/core/enums/ocr_enum.dart';

class SimArgs {
  final OcrEnum card;
  final File? ktpImage;
  final File? croppedKtpImage;

  SimArgs({
    this.ktpImage,
    this.croppedKtpImage,
    required this.card,
  });
}
