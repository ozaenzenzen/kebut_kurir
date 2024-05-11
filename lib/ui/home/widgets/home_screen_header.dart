import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Selamat Datang',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 12.w),
              // resultUserData
              GetBuilder<HomeController>(
                builder: (HomeController controller) {
                  return Text(
                    'Hello Driver!',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: 17.sp,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  );
                },
              ),
              // Text(
              //   'Hello, Agung!',
              //   style: AppTheme.textStyle.blackTextStyle.copyWith(
              //     fontSize: 17.sp,
              //     fontWeight: AppTheme.textConfig.weight.semiBold,
              //   ),
              // ),
            ],
          ),
          GetBuilder<HomeController>(
            builder: (HomeController controller) {
              return FutureBuilder<String?>(
                future: controller.getImageProfile(),
                builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.hasError) {
                    return Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 40.w,
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data != '') {
                        return CircleAvatar(
                          radius: 25.h, // Image radius
                          backgroundImage: NetworkImage(
                            snapshot.data!,
                          ),
                        );
                        // return CircleAvatar(
                        //   radius: 25.h, // Image radius
                        //   backgroundImage: MemoryImage(
                        //     base64Decode(snapshot.data!),
                        //   ),
                        // );
                      } else {
                        return Icon(
                          Icons.account_circle,
                          color: Colors.grey,
                          size: 40.w,
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
