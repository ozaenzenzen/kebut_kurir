import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kebut_kurir/core/theme/app_theme.dart';

class ProfileScreenMenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  const ProfileScreenMenuWidget({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 12),
        height: 47.h,
        decoration: BoxDecoration(
          color: AppTheme.colors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppTheme.colors.secondaryColor,
              size: 22.w,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.secondaryTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.m,
                  fontWeight: AppTheme.textConfig.weight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
