part of '../app_theme.dart';

class _ThemeTextStyle {
  const _ThemeTextStyle();

  TextStyle get blackTextStyle => GoogleFonts.mukta(
        color: AppTheme.colors.blackColor1,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
      TextStyle get errorTextStyle => GoogleFonts.mukta(
        color: AppTheme.colors.errorColor,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
  TextStyle get greyTextStyle => GoogleFonts.mukta(
        color: AppTheme.colors.greyColor3,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
  TextStyle get whiteTextStyle => GoogleFonts.mukta(
        color: Colors.white,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
  TextStyle get primaryTextStyle => GoogleFonts.mukta(
        color: AppTheme.colors.primaryColor,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
  TextStyle get secondaryTextStyle => GoogleFonts.mukta(
        color: AppTheme.colors.secondaryColor,
        fontWeight: AppTheme.textConfig.weight.regular,
        decoration: TextDecoration.none,
      );
}
