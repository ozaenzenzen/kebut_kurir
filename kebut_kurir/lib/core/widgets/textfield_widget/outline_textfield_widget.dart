import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class OutlineTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final Function(String)? onChanged;
  final bool isObstruct;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? onAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List? validation;
  const OutlineTextFieldWidget({
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
    this.initialValue,
    this.inputFormatters,
    this.validation,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObstruct,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: (String? value) {
        String? error;
        validation!.forEach((element) {
          RegExp regExp = new RegExp(element.regex);
          if (!regExp.hasMatch(value!)) {
            error = element.errorMesssage;
          }
        });
        return error;
      },
      keyboardType: keyboardType,
      maxLines: maxLength,
      textInputAction: onAction,
      style: AppTheme.textStyle.blackTextStyle.copyWith(
        fontSize: 17.sp,
        fontWeight: AppTheme.textConfig.weight.semiBold,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: AppTheme.textStyle.blackTextStyle.copyWith(
          fontSize: 17.sp,
          color: AppTheme.colors.greyColor2,
        ),
        counterText: '',
        suffixIcon: suffixIcon,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: AppTheme.colors.greyColor2,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: AppTheme.colors.greyColor2,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: AppTheme.colors.greyColor2,
            width: 1,
          ),
        ),
      ),
    );
  }
}
