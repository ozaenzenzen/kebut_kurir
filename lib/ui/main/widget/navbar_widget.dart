import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/ui/main/widget/navbar_item.dart';

class NavbarWidget extends StatelessWidget {
  final NavBarItem item;
  const NavbarWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          item.iconData,
          size: item.size,
          color: item.selectedColor,
        ),
        Text(
          item.text,
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: 14.sp,
            color: item.selectedColor,
          ),
        ),
      ],
    );
  }
}
