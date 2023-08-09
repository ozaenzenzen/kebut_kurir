import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_controller.dart';

class InfoPengajuanPendingWidget extends GetView<InfoPengajuanController> {
  const InfoPengajuanPendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 50,
              color: Colors.red,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Belum ada pengajuan yang pending',
              textAlign: TextAlign.center,
              style: GoogleFonts.mukta(
                color: const Color(0xFF43474D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
