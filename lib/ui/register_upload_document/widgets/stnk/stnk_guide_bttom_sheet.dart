import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';

class STNKGuideBottomSheet extends StatelessWidget {
  final Function() nextStep;
  const STNKGuideBottomSheet({
    super.key,
    required this.nextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bagaimana cara ambil foto yang benar?',
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.nl,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Gunakan STNK asli, bukan fotocopy',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Pastikan seluruh bagian STNK terlihat jelas',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Pastikan hasil foto tidak buram dan terbaca jelas',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'assets/img_stnk1.png',
              width: 162.w,
              height: 108.w,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/img_stnk2.png',
              width: 162.w,
              height: 108.w,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonCustom(
            text: 'Oke, Mengerti',
            textColor: AppTheme.colors.blackColor2,
            textSize: 18,
            onTap: nextStep,
            // onTap: () => Get.toNamed(Routes.ocrKtp),
            borderRadius: 6.r,
            paddingVer: 13,
          ),
        ),
      ],
    );
  }
}
