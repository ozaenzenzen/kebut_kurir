import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeScreenBanner extends StatelessWidget {
  final HomeController controller;
  const HomeScreenBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: PageView.builder(
            itemCount: 3,
            onPageChanged: controller.onBannerChanged,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // width: 343,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment(-1.00, 0.00),
                    end: Alignment(1, 0),
                    colors: [Color(0xFF00B050), Color(0xFF009745)],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Informasi HRD atau management Perusahaan',
                    style: GoogleFonts.mukta(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(3, (int index) {
            return Obx(
              () => Container(
                width: controller.activeIndex.value == index ? 8 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: controller.activeIndex.value == index ? AppTheme.colors.primaryColor : AppTheme.colors.greyColor8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
