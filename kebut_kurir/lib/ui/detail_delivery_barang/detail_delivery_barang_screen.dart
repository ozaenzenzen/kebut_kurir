import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/detail_delivery/presentation/detail_delivery_controller.dart';
import 'package:kebut_kurir/ui/detail_delivery_barang/widgets/detail_barang_lacak_widget.dart';
import 'package:kebut_kurir/ui/detail_delivery_barang/widgets/detail_pengiriman_widget.dart';

class DetailDeliveryBarangScreen extends GetView<DetailDeliveryController> {
  const DetailDeliveryBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Detail Delivery',
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
                    child: const DetailPengirimanLacakPesananWidget(),
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
          Container(
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
                  'Pengiriman Selesai',
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    color: AppTheme.colors.blackColor2,
                    fontSize: AppTheme.textConfig.size.m,
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
          )
        ],
      ),
    );
  }
}
