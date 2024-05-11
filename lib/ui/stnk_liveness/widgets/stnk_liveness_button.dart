import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kebut_kurir/core/theme/app_theme.dart';

class STNKLivenessButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const STNKLivenessButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 58.w,
        height: 58.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.colors.whiteColor, width: 6),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
