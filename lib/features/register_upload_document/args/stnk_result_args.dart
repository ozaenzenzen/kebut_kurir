import 'dart:io';

class STNKResultArgs {
  final File? kendaraanDepan;
  final File? kendaraanBelakang;
  final File? kendaraansampingKanan;
  final File? kendaraanSampingKiri;
  final File? stnk;

  STNKResultArgs({
    this.kendaraanDepan,
    this.kendaraanBelakang,
    this.kendaraansampingKanan,
    this.kendaraanSampingKiri,
    this.stnk,
  });
}
