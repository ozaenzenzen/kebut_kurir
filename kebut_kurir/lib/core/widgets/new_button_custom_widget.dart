import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewButtonCustomWidgetTheme { dark, light }

class NewButtonCustomWidget extends StatefulWidget {
  final NewButtonCustomWidgetTheme newButtonCustomWidgetTheme;
  final Widget? child;
  final String? title;
  final Function()? onTap;
  final double? height;

  const NewButtonCustomWidget({
    super.key,
    required this.newButtonCustomWidgetTheme,
    this.child,
    this.onTap,
    this.height,
  }) : title = null;

  const NewButtonCustomWidget.text({
    super.key,
    required this.newButtonCustomWidgetTheme,
    this.title,
    this.onTap,
    this.height,
  }) : child = null;

  @override
  State<NewButtonCustomWidget> createState() => _NewButtonCustomWidgetState();
}

class _NewButtonCustomWidgetState extends State<NewButtonCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height ?? 48.h,
        decoration: BoxDecoration(
          color: widget.newButtonCustomWidgetTheme == NewButtonCustomWidgetTheme.dark ? const Color(0xff00B050) : const Color(0xffE6F7EE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: widget.title != null
            ? Text(
                widget.title ?? '',
                style: GoogleFonts.mukta(
                  color: widget.newButtonCustomWidgetTheme == NewButtonCustomWidgetTheme.dark ? const Color(0xffFFFFFF) : const Color(0xff00B050),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              )
            : widget.child,
      ),
    );
  }
}
