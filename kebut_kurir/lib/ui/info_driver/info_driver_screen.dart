import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/info_driver/presentation/info_driver_controller.dart';
import 'package:kebut_kurir/ui/info_driver/widgets/item_info_driver_widget.dart';

class InfoDriverScreen extends GetView<InfoDriverController> {
  const InfoDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Info Driver',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ItemInfoDriverWidget(
                title: "Jumlah Cuti",
                imagePath: "",
                preffixValue: "2",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ItemInfoDriverWidget(
                title: "Jumlah Keterlambatan",
                imagePath: "",
                preffixValue: "0",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ItemInfoDriverWidget(
                title: "Jumlah Overtime / Bulan",
                imagePath: "",
                preffixValue: "0",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
