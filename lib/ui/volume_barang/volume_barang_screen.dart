import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/volume_barang/presentation/volume_barang_controller.dart';

class VolumeBarangScreen extends GetView<VolumeBarangController> {
  const VolumeBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Scan QR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: Text(
                        'Volume Barang',
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF121419),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.09,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Text(
                        'Masukkan volume barang yang telah di ukur',
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF43474D),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Text(
                              'Panjang (cm)',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF1D2129),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          UnderlineTextFieldWidget(
                            withBorder: false,
                            radius: 5,
                            filled: true,
                            onChanged: (val) {},
                            isDense: true,
                            hintText: '',
                            controller: controller.controllerPanjang,
                            hintTextStyle: GoogleFonts.mukta(
                              color: const Color(0xFF7C7E83),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Text(
                              'Lebar (cm)',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF1D2129),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          UnderlineTextFieldWidget(
                            withBorder: false,
                            radius: 5,
                            filled: true,
                            onChanged: (val) {},
                            isDense: true,
                            hintText: '',
                            controller: controller.controllerLebar,
                            hintTextStyle: GoogleFonts.mukta(
                              color: const Color(0xFF7C7E83),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Text(
                              'Tinggi (cm)',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF1D2129),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          UnderlineTextFieldWidget(
                            withBorder: false,
                            radius: 5,
                            filled: true,
                            onChanged: (val) {},
                            isDense: true,
                            hintText: '',
                            controller: controller.controllerTinggi,
                            hintTextStyle: GoogleFonts.mukta(
                              color: const Color(0xFF7C7E83),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Text(
                              'Volume (m3)',
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF1D2129),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          UnderlineTextFieldWidget(
                            withBorder: false,
                            radius: 5,
                            filled: true,
                            onChanged: (val) {},
                            isDense: true,
                            hintText: '',
                            readOnly: true,
                            controller: controller.controllerVolume,
                            hintTextStyle: GoogleFonts.mukta(
                              color: const Color(0xFF7C7E83),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Color(0xFFEDEDED)),
                top: BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
                right: BorderSide(color: Color(0xFFEDEDED)),
                bottom: BorderSide(color: Color(0xFFEDEDED)),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      controller.dialogUtils.showLoading();
                      await Future<void>.delayed(const Duration(seconds: 3));
                      controller.dialogUtils.hideLoading();
                      Get.back(result: 'Sudah sesuai');
                    },
                    child: Container(
                      height: 48,
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
                            'Submit',
                            textAlign: TextAlign.center,
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: AppTheme.colors.blackColor2,
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.semiBold,
                              height: 1.50,
                            ),
                            // style: GoogleFonts.mukta(
                            //   color: Colors.white,
                            //   fontSize: 16,
                            //   fontWeight: FontWeight.w600,
                            //   height: 1.50,
                            // ),
                          ),
                        ],
                      ),
                    ),
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
