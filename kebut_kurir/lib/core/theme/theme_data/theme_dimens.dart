part of '../app_theme.dart';

class _ThemeDimens {
  const _ThemeDimens();

  _DimensText get size => const _DimensText();
  _DimensRadius get radius => const _DimensRadius();
  _fontWeight get weight => const _fontWeight();
}

class _DimensText {
  const _DimensText();

  double get xxxxl => 36.sp;

  double get xxxl => 32.sp;

  double get xxl => 28.sp;

  double get xll => 25.sp;

  double get xl => 24.sp;

  double get ll => 22.sp;

  double get l => 20.sp;

  double get nl => 18.sp;

  double get n => 16.sp;

  double get ml => 15.sp;

  double get m => 14.sp;

  double get sm => 13.sp;

  double get ssm => 12.sp;

  double get s => 10.sp;

  double get xs => 8.sp;

  double get xxs => 5.sp;

  double get xxxs => 4.sp;
}

class _fontWeight {
  const _fontWeight();
  FontWeight get verryLight => FontWeight.w100;
  FontWeight get light => FontWeight.w200;
  FontWeight get regular => FontWeight.w400;
  FontWeight get medium => FontWeight.w500;
  FontWeight get semiBold => FontWeight.w600;
  FontWeight get bold => FontWeight.w700;
  FontWeight get verryBold => FontWeight.w800;
  FontWeight get superBold => FontWeight.w900;
}

class _DimensRadius {
  const _DimensRadius();

  double get xxxxl => 36.r;

  double get xxxl => 32.r;

  double get xxl => 28.r;

  double get xll => 25.r;

  double get xl => 24.r;

  double get ll => 21.r;

  double get l => 20.r;

  double get nl => 18.r;

  double get n => 16.r;

  double get ml => 15.r;

  double get m => 14.r;

  double get sm => 13.sp;

  double get ssm => 12.sp;

  double get s => 10.r;

  double get xs => 8.r;

  double get xxs => 5.r;

  double get xxxs => 4.r;
}
