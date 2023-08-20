import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';


class ConfirmDataFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObscure;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  const ConfirmDataFieldWidget(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.isObscure = false,
      this.inputType,
      this.prefixIcon,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.n,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: UnderlineTextFieldWidget(
            keyboardType: inputType,
            isObstruct: isObscure,
            prefixIcon: prefixIcon,
            withBorder: false,
            readOnly: readOnly,
            onTap: onTap,
            suffixIcon: suffixIcon,
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
