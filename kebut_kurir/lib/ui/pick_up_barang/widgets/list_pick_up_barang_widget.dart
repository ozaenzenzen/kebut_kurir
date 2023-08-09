import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/ui/pick_up_barang/widgets/item_pick_up_barang_widget.dart';

class ListPickupBarangWidget extends StatelessWidget {
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
            Column(
              children: [
                ItemPickupBarangWidget(
                  name: "Pelanggan 1",
                  noPhone: "62811223344",
                  addresss: "Jl. Kalibata tengah no 100, RT.10/RW.07, Kalibata, Kec. Pancoran, Kota Jakarta Selatan, DKI Jakarta, 12820",
                  onTapItem: () {
                    Get.toNamed(Routes.detailPickupBarangScreen);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                ItemPickupBarangWidget(
                  name: "Pelanggan 2",
                  noPhone: "62811223344",
                  addresss: "Jl. Kalibata tengah no 100, RT.10/RW.07, Kalibata, Kec. Pancoran, Kota Jakarta Selatan, DKI Jakarta, 12820",
                  onTapItem: () {
                    Get.toNamed(Routes.detailPickupBarangScreen);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
