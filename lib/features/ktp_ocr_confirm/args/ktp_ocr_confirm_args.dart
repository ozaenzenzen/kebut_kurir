import 'dart:io';

import 'package:kebut_kurir/core/enums/ocr_enum.dart';

class KtpConfirmDataArgs {
  final String nik;
  final String nama;
  final String agama;
  final String alamat;
  final String tempatLahir;
  final String tglLahir;
  final String jenisKelamin;
  final String rt;
  final String rw;

  final String kelurahan;
  final String kecamatan;
  final String statusKawin;
  final String kewarganegaraan;
  final OcrEnum card;
  final File ocr;
  final File ocrCropped;

  KtpConfirmDataArgs({
    required this.nik,
    required this.nama,
    required this.agama,
    required this.card,
    required this.ocr,
    required this.ocrCropped,
    required this.alamat,
    required this.tempatLahir,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.rt,
    required this.kelurahan,
    required this.kecamatan,
    required this.statusKawin,
    required this.kewarganegaraan,
    required this.rw,
  });
}
