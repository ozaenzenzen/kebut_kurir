import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/detail_delivery/presentation/detail_delivery_controller.dart';

class DetailBarangLacakPesananWidget extends GetView<DetailDeliveryController> {
  const DetailBarangLacakPesananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      // height: 129,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Detail Barang',
                      style: GoogleFonts.mukta(
                        color: const Color(0xFF1D2129),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pakaian Muslim',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF121419),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Ukuran : Kecil',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF121419),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_scale.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '3.0 Kg',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_box.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '1000cm3',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    'Volume Barang',
                    style: GoogleFonts.mukta(
                      color: const Color(0xFF1D2129),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6F6FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Image.asset(
                            "assets/thumb_up.png",
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            child: Text(
                              'Sudah Sesuai',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF42526D),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Foto Pengirim',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: AppTheme.colors.blackColor2,
                              fontSize: AppTheme.textConfig.size.m,
                              fontWeight: AppTheme.textConfig.weight.regular,
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFFFE6),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Lihat Foto',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: AppTheme.colors.blackColor2,
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.semiBold,
                                height: 1.43,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Foto Barang',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: AppTheme.colors.blackColor2,
                              fontSize: AppTheme.textConfig.size.m,
                              fontWeight: AppTheme.textConfig.weight.regular,
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFFFE6),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Lihat Foto',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: AppTheme.colors.blackColor2,
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.semiBold,
                                height: 1.43,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
