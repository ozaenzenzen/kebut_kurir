import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/delivery_barang/presentation/delivery_barang_controller.dart';

class CardDeliveryBarangWidget extends GetView<DeliveryBarangController> {
  final Size size;
  const CardDeliveryBarangWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            child: Center(
              child: Container(
                width: 56,
                height: 4,
                decoration: ShapeDecoration(
                  color: const Color(0xFFC9CDD4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Delivery Barang',
                                    style: GoogleFonts.mukta(
                                      color: Color(0xFF404040),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Menuju Lokasi Penerima',
                                    style: GoogleFonts.mukta(
                                      color: AppTheme.colors.secondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.33,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 49,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFE6F7EE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Image.asset(
                                        "assets/near_me(1).png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      // child: Container(
                                      //   width: 24,
                                      //   height: 24,
                                      //   decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Arahkan',
                                style: GoogleFonts.mukta(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Color(0xFFE2E2E2),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Detail Pengirim
                  Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        child: Text(
                          'Detail Penerima',
                          style: GoogleFonts.mukta(
                            color: Color(0xFF9B9B9C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Text(
                          'Izmi Istiqamah',
                          style: GoogleFonts.mukta(
                            color: const Color(0xFF121419),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Text(
                          '62811223344',
                          style: GoogleFonts.mukta(
                            color: const Color(0xFF121419),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Text(
                          'Jl. Kalibata tengah no 100, RT.10/RW.07, Kalibata, Kec. Pancoran, Kota Jakarta Selatan, DKI Jakarta, 12820',
                          style: GoogleFonts.mukta(
                            color: const Color(0xFF7C7E83),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // See Detail
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.detailDeliveryBarangScreen,
                        arguments: true,
                      );
                    },
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Lihat Detail',
                            style: GoogleFonts.mukta(
                              color: AppTheme.colors.blackColor2,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Gridview
                  SizedBox(
                    width: size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE6F7EE),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Image.asset(
                                          "assets/sms.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Chat\nPenerima',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.mukta(
                                      color: const Color(0xFF008D40),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE6F7EE),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Image.asset(
                                          "assets/ic_call.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Telepon Penerima',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.mukta(
                                      color: const Color(0xFF008D40),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(
                    color: Color(0xFFE2E2E2),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
                            fontWeight: AppTheme.textConfig.weight.semiBold,
                            height: 1.50,
                            fontSize: AppTheme.textConfig.size.n,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
