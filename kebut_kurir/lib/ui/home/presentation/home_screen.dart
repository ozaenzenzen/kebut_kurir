import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';
import 'package:kebut_kurir/ui/home/presentation/widgets/home_screen_banner.dart';
import 'package:kebut_kurir/ui/home/presentation/widgets/home_screen_header.dart';
import 'package:kebut_kurir/ui/home/presentation/widgets/home_screen_menu.dart';
import 'package:kebut_kurir/ui/home/presentation/widgets/home_screen_promo.dart';
import 'package:kebut_kurir/ui/home/presentation/widgets/home_screen_saldo.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.primaryColor,
        leadingWidth: 80.w,
        leading: Container(
          height: 40.h,
          width: 60.w,
          child: Center(
            child: AssetImageWidget(
              assets: 'assets/logo_white.png',
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
                  onTap: () => Get.toNamed(Routes.formKomplainScreen),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20.w,
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.notif);
                    // Get.to(() => const ChatHelpCenterScreen());
                  },
                  child: Icon(
                    Icons.chat,
                    color: Colors.white,
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
          // await controller.getUserDataRemote(
          //   onSuccess: (GetUserDataResponseModel data) {
          //     controller.update();
          //   },
          //   onFailed: (String errorMessage) {},
          // );
        },
        child: ListView(
          children: [
            const HomeScreenHeader(),
            HomeScreenBanner(controller: controller),
            SizedBox(height: 17.h),
            const HomeScreenSaldo(),
            SizedBox(height: 17.h),
            HomeScreenMenu(controller: controller),
            SizedBox(height: 14.h),
            HomeScreenPromo(controller: controller),
            SizedBox(height: 17.h),
          ],
        ),
      ),
    );
  }
}
