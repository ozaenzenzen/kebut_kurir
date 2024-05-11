import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/toast_custom.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_binding.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';
import 'package:kebut_kurir/ui/absen/absen_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenAbsensi extends GetView<HomeController> {
  const HomeScreenAbsensi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            color: Colors.red,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal hari ini:',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF7C7E83),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  child: Text(
                    // 'Senin, 24 Juli 2024\n07:09 PM',
                    '${DateFormat('EEE, dd MMM yyyy').format(DateTime.now())}\n${DateFormat('HH:mm a').format(DateTime.now())}',
                    style: GoogleFonts.mukta(
                      color: const Color(0xFF121419),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: () async {
              // Get.toNamed(Routes.absenScreen);
              // String? result =
              // String? result = await Get.to(
              //   const AbsenScreen(),
              //   binding: AbsenBinding(),
              //   transition: Transition.rightToLeftWithFade,
              // );
              // if (result != null) {
              //   if (result.isNotEmpty) {
              //     if (result == "Already Absen") {
              //       Future.delayed(Duration.zero, () async {
              //         controller.isAlreadyAbsen();
              //       });
              //     }
              //   }
              // }
              if (controller.isAlreadyPresent.value) {
                showToast('Sudah absen');
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
              } else {
                String? result = await Get.to(
                  const AbsenScreen(),
                  binding: AbsenBinding(),
                  transition: Transition.rightToLeftWithFade,
                );
                if (result != null) {
                  if (result.isNotEmpty) {
                    if (result == "Already Absen") {
                      Future.delayed(Duration.zero, () async {
                        controller.isAlreadyAbsen();
                      });
                    }
                  }
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: AppTheme.colors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Center(
                child: Text(
                  'Absensi',
                  style: AppTheme.textStyle.blackTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
