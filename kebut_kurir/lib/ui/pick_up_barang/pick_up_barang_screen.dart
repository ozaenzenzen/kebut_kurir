import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_controller.dart';
import 'package:kebut_kurir/ui/pick_up_barang/widgets/empty_state_widget.dart';
import 'package:kebut_kurir/ui/pick_up_barang/widgets/list_pick_up_barang_widget.dart';

class PickupBarangScreen extends GetView<PickupBarangController> {
  const PickupBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Daftar Pickup',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => controller.pickupData.value == null ? const EmptyStatePickupBarangWidget() : const ListPickupBarangWidget(),
      ),
      // body: const EmptyStatePickupBarangWidget(),
    );
  }
}
