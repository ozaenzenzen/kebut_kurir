import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_controller.dart';
import 'package:kebut_kurir/ui/absen/widgets/card_absen_widget.dart';
import 'package:kebut_kurir/ui/absen/widgets/map_widget.dart';

class AbsenScreen extends GetView<AbsenController> {
  const AbsenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Absen',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => controller.userPosition.value != null
                        ? MapSample(
                            lat: controller.userPosition.value!.latitude,
                            long: controller.userPosition.value!.longitude,
                          )
                        : Container(),
                  ),
                ),
                SizedBox(
                  height: size.height / 3.3,
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 1.76,
                ),
                Expanded(
                  child: CardAbsenWidget(
                    size: size,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
