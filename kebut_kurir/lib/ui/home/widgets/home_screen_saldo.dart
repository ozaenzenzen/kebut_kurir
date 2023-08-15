import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class HomeScreenAbsensi extends StatelessWidget {
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
                    'Senin, 24 Juli 2024\n07:09 PM',
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
            onTap: () {
              Get.toNamed(Routes.absenScreen);
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
