import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class EmptyProfile extends StatelessWidget {
  const EmptyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.colors.greyColor7,
      ),
      child: Center(
        child: Icon(
          Icons.person,
          color: AppTheme.colors.greyColor6,
          size: 20.w,
        ),
      ),
    );
  }
}
