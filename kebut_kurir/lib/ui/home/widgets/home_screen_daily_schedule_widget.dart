import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';
import 'package:kebut_kurir/ui/home/widgets/home_screen_item_daily_schedule_widget.dart';

class HomeScreenDailySchedule extends StatelessWidget {
  final HomeController controller;

  const HomeScreenDailySchedule({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Kerja Harian',
            style: GoogleFonts.mukta(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          HomeScreenItemDailyScheduleWidget(
            title: "Pickup Barang",
            preffixValue: "2",
            imagePath: "",
            onTapItem: () {
              Get.toNamed(Routes.pickupBarangScreen);
            },
          ),
          const SizedBox(height: 12),
          HomeScreenItemDailyScheduleWidget(
            title: "Delivery Barang",
            preffixValue: "0",
            imagePath: "",
            onTapItem: () {},
          ),
        ],
      ),
    );
  }
}
