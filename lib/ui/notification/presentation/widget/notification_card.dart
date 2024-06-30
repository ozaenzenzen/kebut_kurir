import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class NotificationCard extends StatelessWidget {
  final bool isActive;
  const NotificationCard({super.key,  this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 9.h),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.colors.softPrimaryColorExt2 : Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        // border: isActive
        //     ? Border.all(
        //         color: AppTheme.colors.primaryColor,
        //         width: 1,
        //       )
        //     : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.r),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications,
              size: 14.w,
              color: AppTheme.colors.neutral500,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pesanan diserahkan ke driver',
                style: GoogleFonts.mukta(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.h),
              RichText(
                text: TextSpan(
                  text: 'pesanan',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.ml,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' KBT12234844 ',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                        color: AppTheme.colors.accentColor2,
                      ),
                    ),
                    TextSpan(
                      text: 'telah diterima.',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                '23-07-2023 16:00',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
