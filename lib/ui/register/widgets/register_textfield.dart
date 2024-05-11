import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';

class RegisterTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObscure;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  const RegisterTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isObscure = false,
    this.controller,
    this.inputType,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != ''
            ? Text(
                label,
                textAlign: TextAlign.start,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ssm,
                  color: AppTheme.colors.greyColor2,
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(height: 6.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: UnderlineTextFieldWidget(
            onChanged: onChanged,
            keyboardType: inputType,
            isObstruct: isObscure,
            prefixIcon: prefixIcon,
            withBorder: false,
            filled: true,
            controller: controller,
            isDense: true,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
