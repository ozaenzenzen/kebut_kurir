import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyStatePickupBarangWidget extends StatelessWidget {
  const EmptyStatePickupBarangWidget({super.key});

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
              'Kamu belum ada barang yang di jemput',
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
