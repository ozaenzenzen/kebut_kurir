import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_controller.dart';

class EmptyStateInfoPengajuanWidget extends GetView<InfoPengajuanController> {
  final String title;
  const EmptyStateInfoPengajuanWidget({
    super.key,
    required this.title,
  });

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
            Image.asset(
              'assets/ic_info_pengajuan.png',
              width: 161,
              height: 118,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              title,
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
