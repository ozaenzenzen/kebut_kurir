import 'dart:io';

import 'package:kebut_kurir/core/enums/ocr_enum.dart';

class SIMLivenessResultArgs {
  final OcrEnum card;
  final String nik;
  final String name;
  final String address;
  final String rtRw;
  final String subDistrict;
  final String district;
  final String city;
  final String province;
  final String pob;
  final String dob;
  final String height;
  final String profession;
  final String expired;
  final String bloodType;
  final String citizenship;
  final String maritalStatus;
  final String religion;
  final String gender;
  final File ktpImage;
  final File croppedKtpImage;
  final File? liveness;

  SIMLivenessResultArgs({
    required this.card,
    required this.nik,
    required this.name,
    required this.address,
    required this.rtRw,
    required this.subDistrict,
    required this.district,
    required this.city,
    required this.province,
    required this.pob,
    required this.dob,
    required this.height,
    required this.profession,
    required this.expired,
    required this.bloodType,
    required this.citizenship,
    required this.maritalStatus,
    required this.religion,
    required this.gender,
    required this.ktpImage,
    required this.croppedKtpImage,
    required this.liveness,
  });
}
