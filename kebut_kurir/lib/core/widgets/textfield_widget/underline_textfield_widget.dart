import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';


class UnderlineTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextStyle? textFieldStyle;
  final bool isObstruct;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool readOnly;
  final bool withBorder;
  final String? label;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isDense;
  final bool filled;
  final int? maxLines;
  final double? radius;
  final BoxConstraints? suffixIconConstraints;
  final bool? alignLabelWithHint;

  const UnderlineTextFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isObstruct = false,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.hintTextStyle,
    this.withBorder = false,
    this.isDense = true,
    this.filled = false,
    this.onEditingComplete,
    this.textFieldStyle,
    this.label,
    this.onTap,
    this.maxLines,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.alignLabelWithHint = true,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObstruct,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + AppTheme.textConfig.size.m * 4),
      textAlign: TextAlign.start,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      maxLength: maxLength,
      maxLines: (isObstruct) ? 1 : maxLines,
      style: textFieldStyle ??
          AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.n,
            // fontWeight: AppTheme.textConfig.weight.bold,
          ),
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint,
        filled: filled,
        labelText: label,
        isCollapsed: true,
        fillColor: filled ? AppTheme.colors.whiteColor4 : Colors.transparent,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.n,
            ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints ?? BoxConstraints(minHeight: 24.h, minWidth: 48.h),
        prefixIcon: prefixIcon,
        isDense: isDense,
        focusedBorder: withBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.colors.blackColor1,
                  width: 1,
                ),
              )
            : radius == null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
        enabledBorder: withBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              )
            // : InputBorder.none,
            : radius == null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
        border: withBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              )
            : radius == null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
      ),
    );
  }
}
