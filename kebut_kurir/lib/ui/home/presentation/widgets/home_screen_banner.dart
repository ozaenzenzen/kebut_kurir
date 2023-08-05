import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeScreenBanner extends StatelessWidget {
  final HomeController controller;
  const HomeScreenBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: controller.onBannerChanged,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        'assets/cargo1.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
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
                      width: controller.activeIndex.value == index ? 32 : 8,
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