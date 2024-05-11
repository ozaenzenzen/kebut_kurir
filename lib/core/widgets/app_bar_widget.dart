import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final PreferredSize? bottom;
  final bool automaticallyImplyLeading;

  const AppBarWidget({
    super.key,
    required this.title,
    this.bottom,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(
        title,
        style: AppTheme.textStyle.blackTextStyle.copyWith(
          fontSize: AppTheme.textConfig.size.nl,
          fontWeight: AppTheme.textConfig.weight.semiBold,
        ),
      ),
      bottom: bottom,
    );
  }
}
