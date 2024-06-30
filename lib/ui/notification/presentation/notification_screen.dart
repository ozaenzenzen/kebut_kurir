import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/ui/notification/presentation/notification_controller.dart';
import 'package:kebut_kurir/ui/notification/presentation/widget/notification_card.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.whiteColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Inbox',
          style: GoogleFonts.mukta(
            color: AppTheme.colors.newTextBlack2,
            fontSize: AppTheme.textConfig.size.nl,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppTheme.colors.blackColor1,
          ),
        ),
        bottom: TabBar(
          controller: controller.tabController,
          labelColor: AppTheme.colors.blackColor1,
          labelStyle: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.n,
            fontWeight: AppTheme.textConfig.weight.semiBold,
            color: AppTheme.colors.blackColor1,
          ),
          unselectedLabelStyle: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.n,
            fontWeight: AppTheme.textConfig.weight.semiBold,
            color: const Color(0xff7C7E83),
          ),
          unselectedLabelColor: const Color(0xff7C7E83),
          indicatorColor: AppTheme.colors.softPrimaryColorExt3,
          tabs: const <Widget>[
            Tab(
              // icon: Icon(Icons.home),
              text: 'Notifikasi',
            ),
            Tab(
              // icon: Icon(Icons.favorite),
              text: 'Pesan',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                NotificationCard(isActive: true),
                NotificationCard(isActive: false),
              ],
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
