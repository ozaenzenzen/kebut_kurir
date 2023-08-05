import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';


class HomeScreenSaldo extends StatelessWidget {
  const HomeScreenSaldo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Saldo',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.visibility,
                    color: AppTheme.colors.primaryColor,
                    size: 16.w,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                'Rp *******',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.walletScreen),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: AppTheme.colors.primaryColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16.w,
                  ),
                  Text(
                    'Top Up',
                    style: AppTheme.textStyle.whiteTextStyle.copyWith(
                      fontSize: 15.sp,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
