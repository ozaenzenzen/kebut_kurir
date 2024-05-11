import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomExpansionPanelWidget extends StatefulWidget {
  final String title;
  final Function(bool isEpxanded)? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const CustomExpansionPanelWidget({
    super.key,
    required this.title,
    this.onTap,
    this.child,
    this.padding,
  });

  @override
  State<CustomExpansionPanelWidget> createState() => _CustomExpansionPanelWidgetState();
}

class _CustomExpansionPanelWidgetState extends State<CustomExpansionPanelWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isExpanded == false) {
            isExpanded = true;
          } else {
            isExpanded = false;
          }
        });
        widget.onTap?.call(isExpanded);
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.all(12.h),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '${widget.title}',
                    style: GoogleFonts.mukta(
                      color: const Color(0xff121419),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Icon(
                  (isExpanded) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24.h,
                  color: const Color(0xff00B050),
                ),
              ],
            ),
            widget.child == null
                ? const SizedBox()
                : (isExpanded)
                    ? widget.child!
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
