import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class AppBarWidgetV2 extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Function()? onBack;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const AppBarWidgetV2({
    super.key,
    required this.title,
    this.actions,
    this.onBack,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.colors.whiteColor1,
      elevation: 10,
      shadowColor: const Color(0xff1018280D),
      centerTitle: true,
      leading: InkWell(
        onTap: onBack ??
            () {
              Get.back();
            },
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xff121419),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.mukta(
          color: const Color(0xff121419),
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
