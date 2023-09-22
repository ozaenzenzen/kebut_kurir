import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Detail Pickup',
        ),
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
                    child: DetailPengirimanLacakPesananWidget(
                      recipientAddress: controller.detailPickup.value!.recipientDetails!.address!,
                      recipientName: controller.detailPickup.value!.recipientDetails!.nameRecipient!,
                      recipientPhone: controller.detailPickup.value!.recipientDetails!.phone!,
                      senderAddress: controller.detailPickup.value!.senderDetails!.address!,
                      senderName: controller.detailPickup.value!.senderDetails!.nameSender!,
                      senderPhone: controller.detailPickup.value!.senderDetails!.phone!,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: const DetailBarangLacakPesananWidget(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.afterPickupBarang.value
                ? controller.fromScanQR.value
                    ? InkWell(
                        onTap: () {
                          controller.dialogUtils.showToastMessage("Barang berhasil di pickup");
                        },
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          margin: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: AppTheme.colors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pickup Barang',
                                textAlign: TextAlign.center,
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  color: AppTheme.colors.blackColor2,
                                  fontSize: AppTheme.textConfig.size.n,
                                  fontWeight: AppTheme.textConfig.weight.semiBold,
                                ),
                                // style: GoogleFonts.mukta(
                                //   color: Colors.white,
                                //   fontSize: 16,
                                //   fontWeight: FontWeight.w600,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container()
                : ButtonPickupBarangWidget(
                    onCancelledTap: () {},
                    onTakeTap: () {
                      controller.dialogUtils.showCustomDialog(
                        title: 'Pickup Barang',
                        context: context,
                        asset: "assets/icon_popup_konfirmasi.png",
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
                          await controller.sendPickup(
                              uuidDeliveryOrders: controller.detailPickup.value!.uuidDeliveryOrders!,
                              onSuccess: () {
                                controller.dialogUtils.hideLoading();
                                controller.afterPickupBarang.value = true;
                                Get.toNamed(
                                  Routes.afterPickupBarang,
                                  arguments: true,
                                );
                              },
                              onFailed: (value) {
                                controller.dialogUtils.hideLoading();
                                controller.dialogUtils.showError(value);
                              });
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
