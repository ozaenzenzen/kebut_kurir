import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widgetV2.dart';
import 'package:kebut_kurir/features/delivery_barang/presentation/delivery_barang_controller.dart';
import 'package:kebut_kurir/ui/delivery_barang/widgets/card_delivery_barang_widget.dart';

class DeliveryBarangScreen extends GetView<DeliveryBarangController> {
  const DeliveryBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidgetV2(
          title: 'Detail Delivery',
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
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage("assets/bg_example_after_pickup.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                Expanded(
                  child: CardDeliveryBarangWidget(
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
