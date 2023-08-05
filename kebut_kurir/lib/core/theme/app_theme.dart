import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'theme_data/theme_colors.dart';

part 'theme_data/theme_dimens.dart';

part 'theme_data/theme_text_style.dart';

class AppTheme {
  AppTheme._();

  static const _ThemeColors colors = _ThemeColors();
  static const _ThemeDimens textConfig = _ThemeDimens();
  static const _ThemeTextStyle textStyle = _ThemeTextStyle();
}
