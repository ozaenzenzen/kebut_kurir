import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/detail_pickup_barang/presentation/detail_pickup_barang_binding.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_controller.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/detail_pickup_barang_screen.dart';
import 'package:kebut_kurir/ui/pick_up_barang/widgets/item_pick_up_barang_widget.dart';

class ListPickupBarangWidget extends GetView<PickupBarangController> {
  const ListPickupBarangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Column(
                children: controller.pickupData.value!.result!.data!.map((e) {
                  return Column(
                    children: [
                      e.detailPickup.value == null
                          ? Container()
                          : ItemPickupBarangWidget(
                              // name: "Pelanggan 1",
                              type: e.type!,
                              name: e.detailPickup.value!.senderDetails!.nameSender!,
                              noPhone: e.detailPickup.value!.senderDetails!.phone!,
                              addresss: e.detailPickup.value!.senderDetails!.address!,
                              onTapItem: () async {
                                if (!controller.pickupBarang.value) {
                                  // bool? pickupBarang = await Get.toNamed(Routes.detailPickupBarangScreen);
                                  bool? pickupBarang = await Get.to(
                                    () => const DetailPickupBarangScreen(),
                                    binding: DetailPickupBarangBindng(),
                                    arguments: e.detailPickup.value,
                                    transition: Transition.rightToLeftWithFade,
                                  );
                                  if (pickupBarang != null) {
                                    controller.pickupBarang.value = pickupBarang;
                                  }
                                } else {
                                  Get.toNamed(Routes.afterPickupBarang);
                                }
                              },
                            ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
