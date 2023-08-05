import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:pinput/pinput.dart';

class PinField extends StatelessWidget {
  const PinField({
    Key? key,
  }) : super(key: key);

  PinTheme get _defaultTheme => PinTheme(
        width: 30,
        height: 40,
        textStyle: AppTheme.textStyle.blackTextStyle.copyWith(
          fontSize: AppTheme.textConfig.size.m,
        ),
      );

  PinTheme get _focusTheme => _defaultTheme.copyWith(
        textStyle: _defaultTheme.textStyle?.copyWith(
          color: AppTheme.colors.primaryColor,
        ),
      );

  PinTheme get _errorTheme => _defaultTheme.copyWith(
        textStyle: _defaultTheme.textStyle?.copyWith(
          color: AppTheme.colors.errorColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      animationCurve: Curves.ease,
      defaultPinTheme: _defaultTheme,
      focusedPinTheme: _focusTheme,
      mainAxisAlignment: MainAxisAlignment.center,
      errorPinTheme: _errorTheme,
      closeKeyboardWhenCompleted: true,
      autofocus: false,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      preFilledWidget: Container(
        width: 22,
        height: 12,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
