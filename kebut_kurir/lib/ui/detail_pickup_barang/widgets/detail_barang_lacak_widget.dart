import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/detail_pickup_barang/presentation/detail_pickup_barang_controller.dart';
import 'package:kebut_kurir/features/volume_barang/presentation/volume_barang_binding.dart';
import 'package:kebut_kurir/ui/volume_barang/volume_barang_screen.dart';

class DetailBarangLacakPesananWidget extends GetView<DetailPickupBarangController> {
  const DetailBarangLacakPesananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var valueScan = Get.parameters;
    if (valueScan.isNotEmpty) {
      controller.valueScan = valueScan;
      if (controller.valueScan["fromScan"] == "false") {
        controller.fromScanQR.value = false;
      } else {
        controller.fromScanQR.value = true;
      }
    } else {
      controller.fromScanQR.value = false;
    }
    return Container(
      width: size.width,
      // height: 129,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Detail Barang',
                      style: GoogleFonts.mukta(
                        color: const Color(0xFF1D2129),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pakaian Muslim',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF121419),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Ukuran : Kecil',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF121419),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_scale.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '3.0 Kg',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_box.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '1000cm3',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Obx(
            () => controller.fromScanQR.value
                ? Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            'Volume Barang',
                            style: GoogleFonts.mukta(
                              color: const Color(0xFF1D2129),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InkWell(
                          onTap: () async {
                            // String? result = await Get.toNamed(Routes.volumeBarangScreen);
                            String? result = await Get.to(
                              const VolumeBarangScreen(),
                              binding: VolumeBarangBinding(),
                              transition: Transition.rightToLeftWithFade,
                            );
                            if (result != null) {
                              if (result.isNotEmpty) {
                                if (result == "Sudah sesuai") {
                                  controller.volumeDone.value = true;
                                } else {
                                  controller.volumeDone.value = false;
                                }
                              } else {
                                controller.volumeDone.value = false;
                              }
                            } else {
                              controller.volumeDone.value = false;
                            }
                          },
                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE6F7EE),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Obx(
                                  () => controller.volumeDone.value
                                      ? Row(
                                          children: [
                                            Container(
                                              width: 16,
                                              height: 16,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                'Sudah Sesuai',
                                                style: GoogleFonts.mukta(
                                                  color: const Color(0xFF121419),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox(
                                          child: Text(
                                            'Validasi Volume Barang',
                                            style: GoogleFonts.mukta(
                                              color: const Color(0xFF121419),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                )),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Color(0xFF42526D),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            'Foto Pengirim',
                            style: GoogleFonts.mukta(
                              color: const Color(0xFF1D2129),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InkWell(
                          onTap: () async {
                            controller.dialogUtils.showLoading();
                            await controller.profilePictureUtils.setImageData(ImageSource.camera).whenComplete(() {
                              // processImage();
                              controller.docFilePengirim.value = File(controller.profilePictureUtils.imageData!.filePath!);
                            });
                            controller.dialogUtils.hideLoading();
                          },
                          child: Obx(
                            () => Container(
                              width: size.width,
                              height: controller.docFilePengirim.value != null ? null : 107,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF5F6F7),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              ),
                              child: Obx(
                                () => controller.docFilePengirim.value == null
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/ic_camera.png',
                                            width: 18,
                                            height: 18,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            'Ambil Foto Pengirim',
                                            style: GoogleFonts.mukta(
                                              color: const Color(0xFF121419),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Image.file(
                                            File(controller.docFilePengirim.value!.path),
                                          ),
                                          Container(
                                            width: size.width,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                            decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Ketuk untuk mengambil ulang foto',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.mukta(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            'Foto Barang',
                            style: GoogleFonts.mukta(
                              color: const Color(0xFF1D2129),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InkWell(
                            onTap: () async {
                              controller.dialogUtils.showLoading();
                              await controller.profilePictureUtils.setImageData(ImageSource.camera).whenComplete(() {
                                // processImage();
                                controller.docFileBarang.value = File(controller.profilePictureUtils.imageData!.filePath!);
                              });
                              controller.dialogUtils.hideLoading();
                            },
                            child: Obx(
                              () => Container(
                                width: size.width,
                                height: controller.docFileBarang.value != null ? null : 107,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF5F6F7),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Obx(
                                  () => controller.docFileBarang.value == null
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/ic_camera.png',
                                              width: 18,
                                              height: 18,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              'Ambil Foto Barang',
                                              style: GoogleFonts.mukta(
                                                color: const Color(0xFF121419),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Image.file(
                                              File(controller.docFileBarang.value!.path),
                                            ),
                                            Container(
                                              width: size.width,
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                              decoration: const BoxDecoration(color: Color(0x7F7F848E)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Ketuk untuk mengambil ulang foto',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.mukta(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
