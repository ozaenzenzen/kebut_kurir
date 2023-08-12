import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widgetV2.dart';
import 'package:kebut_kurir/features/afterpickup_detailpickup_barang/presentation/after_pickup_barang_controller.dart';
import 'package:kebut_kurir/ui/afterpickup_detailpickup_barang/widgets/card_after_pickup_barang_widget.dart';

class AfterPickupBarangScreen extends GetView<AfterPickupBarangController> {
  const AfterPickupBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: AppBarWidgetV2(
            title: 'Detail Pickup',
            onBack: () {
              if (controller.fromDetailScreen.value) {
                Get.back();
                Get.back();
                Get.back(
                  result: true,
                );
              } else {
                Get.back();
              }
            },
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
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
                    height: size.height / 3.5,
                  ),
                  // Expanded(
                  //   child: Container(
                  //     color: Colors.blue,
                  //   ),
                  // )
                  Expanded(
                    child: CardAfterPickupWidget(
                      size: size,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onWillPop: () async {
        if (controller.fromDetailScreen.value) {
          Get.back();
          Get.back();
          Get.back(
            result: true,
          );
          return false;
        } else {
          return true;
        }
      },
    );
  }
}
