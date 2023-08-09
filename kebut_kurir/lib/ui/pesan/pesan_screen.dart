import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/pesan/presentation/pesan_controller.dart';
import 'package:kebut_kurir/ui/pesan/widgets/pesan_item_widget.dart';

class PesanScreen extends GetView<PesanController> {
  const PesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Admin',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PesanItemWidget(
              onTapItem: () {
                Get.toNamed(Routes.chat);
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            PesanItemWidget(
              onTapItem: () {
                Get.toNamed(Routes.chat);
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            PesanItemWidget(
              onTapItem: () {
                Get.toNamed(Routes.chat);
              },
            ),
          ],
        ),
      ),
    );
  }
}
