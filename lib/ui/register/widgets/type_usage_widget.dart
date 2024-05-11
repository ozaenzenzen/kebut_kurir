import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class TypeUsageWidget extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  const TypeUsageWidget({super.key, required this.value, required this.groupValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(value),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: groupValue == value ? AppTheme.colors.primaryColor : AppTheme.colors.greyColor5,
            width: 1,
          ),
        ),
        child: Row(
          children: <Widget>[
            Radio<String>(
              value: value,
              groupValue: groupValue,
              activeColor: AppTheme.colors.primaryColor,
              onChanged: onChanged,
            ),
            Text(
              value,
              style: AppTheme.textStyle.blackTextStyle.copyWith(
                fontSize: AppTheme.textConfig.size.n,
                fontWeight: AppTheme.textConfig.weight.medium,
                color: groupValue == value ? AppTheme.colors.primaryColor : AppTheme.colors.greyColor5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
