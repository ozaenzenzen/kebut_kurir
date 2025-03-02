import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';
import 'package:kebut_kurir/ui/home/widgets/home_screen_banner.dart';
import 'package:kebut_kurir/ui/home/widgets/home_screen_daily_schedule_widget.dart';
import 'package:kebut_kurir/ui/home/widgets/home_screen_header.dart';
import 'package:kebut_kurir/ui/home/widgets/home_screen_absensi.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80.w,
        leading: Container(
          height: 40.h,
          width: 60.w,
          child: Center(
            child: AssetImageWidget(
              assets: 'assets/ic_kurir.png',
              height: 40.h,
              width: 60.w,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              children: <Widget>[
                InkWell(
                  // onTap: () => Get.toNamed(Routes.formKomplainScreen),
                  onTap: () {},
                  child: Icon(
                    Icons.notifications,
                    color: AppTheme.colors.blackColor2,
                    size: 20.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Future.wait([
            controller.fetchTotalDelivertDaily(),
            controller.fetchTotalPickupDaily(),
          ]);
        },
        child: ListView(
          children: [
            const HomeScreenHeader(),
            HomeScreenBanner(controller: controller),
            SizedBox(height: 17.h),
            const HomeScreenAbsensi(),
            SizedBox(height: 17.h),
            HomeScreenDailySchedule(controller: controller),
            SizedBox(height: 17.h),
          ],
        ),
      ),
    );
  }
}
