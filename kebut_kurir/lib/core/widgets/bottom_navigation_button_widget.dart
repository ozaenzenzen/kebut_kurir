import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

enum BottomNavigationButtonTheme { dark, light }

class BottomNavigationButtonWidget extends StatefulWidget {
  final BottomNavigationButtonTheme bottomNavigationButtonTheme;
  final String title;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;

  const BottomNavigationButtonWidget({
    super.key,
    required this.bottomNavigationButtonTheme,
    required this.title,
    this.onTap,
    this.buttonColor,
    this.textColor,
  });

  @override
  State<BottomNavigationButtonWidget> createState() => _BottomNavigationButtonWidgetState();
}

class _BottomNavigationButtonWidgetState extends State<BottomNavigationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.h,
        right: 16.h,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: AppTheme.colors.whiteColor1,
        border: Border(
          top: BorderSide(
            color: const Color(0xffEDEDED),
            width: 1.h,
          ),
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 48.h,
          decoration: BoxDecoration(
            color: widget.buttonColor != null
                ? widget.buttonColor
                : widget.bottomNavigationButtonTheme == BottomNavigationButtonTheme.dark
                    ? const Color(0xff00B050)
                    : const Color(0xffE6F7EE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.mukta(
              color: widget.textColor != null
                  ? widget.textColor
                  : (widget.bottomNavigationButtonTheme == BottomNavigationButtonTheme.dark)
                      ? const Color(0xffFFFFFF)
                      : const Color(0xff00B050),
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
