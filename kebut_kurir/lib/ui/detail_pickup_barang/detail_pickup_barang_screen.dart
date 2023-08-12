import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/features/detail_pickup_barang/presentation/detail_pickup_barang_controller.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/widgets/button_pickup_barang_widget.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/widgets/detail_barang_lacak_widget.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/widgets/detail_pengiriman_widget.dart';

class DetailPickupBarangScreen extends GetView<DetailPickupBarangController> {
  const DetailPickupBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Detail Pickup',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const DetailPengirimanLacakPesananWidget(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: const DetailBarangLacakPesananWidget(),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.afterPickupBarang.value
                ? Container()
                : ButtonPickupBarangWidget(
                    onCancelledTap: () {},
                    onTakeTap: () {
                      controller.dialogUtils.showCustomDialog(
                        title: 'Pickup Barang',
                        context: context,
                        subTitle: 'Apakah anda yakin ini pickup barang ini?',
                        primaryButtonText: 'Ya, Ambil',
                        secondaryButtonText: 'Batal',
                        isBarrierDismissible: false,
                        reverseButton: true,
                        secondaryButton: (data) {
                          Get.back();
                        },
                        buttonDirection: ButtonDirection.HORIZONTAL,
                        primaryButton: () async {
                          controller.afterPickupBarang.value = true;
                          Get.toNamed(
                            Routes.afterPickupBarang,
                            arguments: true,
                          );
                        },
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
