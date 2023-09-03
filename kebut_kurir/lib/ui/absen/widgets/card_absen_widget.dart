import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_controller.dart';

class CardAbsenWidget extends GetView<AbsenController> {
  final Size size;
  const CardAbsenWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              child: Text(
                'Absensi',
                textAlign: TextAlign.center,
                style: GoogleFonts.mukta(
                  color: const Color(0xFF121419),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/ic_date.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        // '24 Juli 2024 | 07:09 PM',
                        '${DateFormat('dd MMMM yyyy').format(DateTime.now())} | ${DateFormat('hh:mm a').format(DateTime.now())} ',
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF121419),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/ic_location.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                        child: Obx(
                      () => Text(
                        // 'Jl. Kalibata tengah no 100, RT.10/RW.07, Kalibata, Kec. Pancoran, Kota Jakarta Selatan, DKI Jakarta, 12820',
                       '${controller.userLocation.value}',
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF121419),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                controller.dialogUtils.showSuccessDialog(title: 'Presensi Berhasil', context: context);
              },
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: ShapeDecoration(
                  color: AppTheme.colors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Presensi',
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyle.blackTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
