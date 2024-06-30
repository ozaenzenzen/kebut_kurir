import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class NotificationPesanView extends StatefulWidget {
  const NotificationPesanView({super.key});

  @override
  State<NotificationPesanView> createState() => _NotificationPesanViewState();
}

class _NotificationPesanViewState extends State<NotificationPesanView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.h),
          ListView.separated(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  color: AppTheme.colors.whiteColor1,
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 15.h,
                      backgroundColor: AppTheme.colors.whiteColor1,
                      // backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/icon_gift.png',
                        height: 15.h,
                        width: 15.h,
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Promo spesial khusus pengguna aplikasi kebut express',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '23-07-2023 16:00',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.s,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8.h);
            },
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
