import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kebut_kurir/core/theme/app_theme.dart';

class KtpOcrButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const KtpOcrButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.colors.whiteColor, width: 6),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
