import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';

class HomeScreenMenuWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String asset;
  final double assetWidth;
  final double assetHeight;
  const HomeScreenMenuWidget(
      {super.key, this.onTap, required this.title, required this.asset, required this.assetWidth, required this.assetHeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: AssetImageWidget(assets: asset, height: assetHeight, width: assetWidth, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 9.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTheme.textStyle.blackTextStyle.copyWith(
                fontSize: AppTheme.textConfig.size.m,
                fontWeight: AppTheme.textConfig.weight.medium,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
