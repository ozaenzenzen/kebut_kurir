import 'dart:io';

import 'package:kebut_kurir/core/enums/ocr_enum.dart';

class KtpOcrArgs {
  final OcrEnum card;
  final File? ocr;
  final File? ocrCropped;
  final File? liveness;
  final File? employeCard;

  KtpOcrArgs({required this.card, this.ocr, this.ocrCropped, this.liveness, this.employeCard});
}
