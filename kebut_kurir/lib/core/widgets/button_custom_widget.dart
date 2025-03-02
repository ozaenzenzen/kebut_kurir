import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class ButtonCustom extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final double paddingVer;
  final double paddingHor;
  final bool isActive;
  final void Function()? onTap;
  final double? height;
  final double width;
  final double borderRadius;
  final bool withBorder;
  final Color? textColor;
  final double textSize;
  final Widget? child;
  const ButtonCustom({
    super.key,
    this.text,
    this.buttonColor,
    this.paddingVer = 12,
    this.onTap,
    this.height,
    this.textColor,
    this.borderRadius = 5,
    this.width = 219,
    this.textSize = 17,
    this.withBorder = false,
    this.child,
    this.paddingHor = 0,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onTap : null,
      child: Container(
        width: width.w,
        height: height != null ? 48.w : null,
        padding: EdgeInsets.symmetric(vertical: paddingVer.sp, horizontal: paddingHor.w),
        decoration: BoxDecoration(
            color: withBorder
                ? null
                : isActive
                    ? buttonColor ?? AppTheme.colors.primaryColor
                    : AppTheme.colors.greyColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
            border: withBorder
                ? Border.all(
                    color: textColor ?? Colors.white,
                    width: 1,
                  )
                : null),
        child: child ??
            Center(
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.whiteTextStyle.copyWith(
                  fontSize: textSize.sp,
                  fontWeight: AppTheme.textConfig.weight.bold,
                  color: isActive ? AppTheme.colors.blackColor2 : textColor ?? AppTheme.colors.whiteColor,
                ),
              ),
            ),
      ),
    );
  }
}
