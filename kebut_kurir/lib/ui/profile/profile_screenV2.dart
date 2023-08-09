import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/features/profile/domain/profile_pengaturan_profile_menu.dart';
import 'package:kebut_kurir/features/profile/domain/profile_tentang_kami_menu.dart';
import 'package:kebut_kurir/features/profile/presentation/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletons/skeletons.dart';

// class ProfileScreenV2 extends GetView<ProfileController> {
//   const ProfileScreenV2({super.key});

class ProfileScreenV2 extends StatefulWidget {
  final Function()? callbackState;

  const ProfileScreenV2({
    super.key,
    this.callbackState,
  });

  @override
  State<ProfileScreenV2> createState() => _ProfileScreenV2State();
}

class _ProfileScreenV2State extends State<ProfileScreenV2> {
  ProfileController profileController = Get.put<ProfileController>(ProfileController());
  // StaticPageController staticPageController = Get.put<StaticPageController>(StaticPageController());

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff009E48),
        // backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Akun',
          style: AppTheme.textStyle.whiteTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.nl,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              // height: 190.h,
              color: const Color(0xff009E48),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 15.h,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GetBuilder<ProfileController>(
                        builder: (ProfileController controller) {
                          return FutureBuilder<String?>(
                            future: profileController.getImageProfile(),
                            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                              if (snapshot.hasError) {
                                return CircleAvatar(
                                  radius: 32.h, // Image radius
                                  backgroundImage: const NetworkImage(
                                    'https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png',
                                  ),
                                );
                              } else {
                                if (snapshot.hasData) {
                                  if (snapshot.data != '') {
                                    // debugPrint('datanya ${snapshot.data}');
                                    // return const SizedBox();
                                    return CircleAvatar(
                                      radius: 32.h, // Image radius
                                      backgroundImage: NetworkImage(
                                        snapshot.data!,
                                      ),
                                    );
                                  } else {
                                    return CircleAvatar(
                                      radius: 32.h, // Image radius
                                      backgroundImage: const NetworkImage(
                                        'https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png',
                                      ),
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
                      SizedBox(width: 12.h),
                      GetBuilder<ProfileController>(builder: (ProfileController controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // controller.resultUserData?.shortname == null
                            //     ? SkeletonLine(
                            //         style: SkeletonLineStyle(
                            //           height: 14.h,
                            //           width: 100.w,
                            //           borderRadius: BorderRadius.circular(8.h),
                            //         ),
                            //       )
                            //     : Text(
                            //         // 'Agung Azhari',
                            //         '${controller.resultUserData?.shortname}',
                            //         style: AppTheme.textStyle.whiteTextStyle.copyWith(
                            //           fontSize: AppTheme.textConfig.size.n,
                            //           fontWeight: AppTheme.textConfig.weight.semiBold,
                            //         ),
                            //       ),
                            Text(
                              'Agung Azhari',
                              // '${controller.resultUserData?.shortname}',
                              style: AppTheme.textStyle.whiteTextStyle.copyWith(
                                fontSize: AppTheme.textConfig.size.n,
                                fontWeight: AppTheme.textConfig.weight.semiBold,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            // controller.resultUserData?.email == null
                            //     ? SkeletonLine(
                            //         style: SkeletonLineStyle(
                            //           height: 14.h,
                            //           width: 100.w,
                            //           borderRadius: BorderRadius.circular(8.h),
                            //         ),
                            //       )
                            //     : Text(
                            //         // 'agungazharii@gmail.com',
                            //         '${controller.resultUserData?.email}',
                            //         style: AppTheme.textStyle.whiteTextStyle.copyWith(
                            //           fontSize: AppTheme.textConfig.size.m,
                            //         ),
                            //       ),
                            Text(
                              'agungazharii@gmail.com',
                              // '${controller.resultUserData?.email}',
                              style: AppTheme.textStyle.whiteTextStyle.copyWith(
                                fontSize: AppTheme.textConfig.size.m,
                              ),
                            ),
                          ],
                        );
                      }),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.editProfileScreen);
                        },
                        child: Icon(
                          Icons.edit,
                          size: 24.h,
                          color: AppTheme.colors.whiteColor1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Informasi',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.n,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfilePengaturanProfileMenu.menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          ProfilePengaturanProfileMenu.menu[index].onTap.call();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            // horizontal: 12.w,
                          ),
                          child: Row(
                            children: <Widget>[
                              AssetImageWidget(
                                assets: ProfilePengaturanProfileMenu.menu[index].menuIcon,
                                height: 20.h,
                                width: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                ProfilePengaturanProfileMenu.menu[index].title,
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  fontSize: AppTheme.textConfig.size.n,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppTheme.colors.blackColor1,
                                size: 16.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        color: const Color(0xffEDEDED),
                        height: 1.h,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tentang Kami',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.n,
                      fontWeight: AppTheme.textConfig.weight.semiBold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfileTentangKamiMenu.menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          // if (ProfileTentangKamiMenu.menu[index].title == 'Kebijakan Privasi') {
                          //   debugPrint('1');
                          //   await staticPageController.getStaticData('policy');
                          //   Get.toNamed(Routes.static);
                          // } else if (ProfileTentangKamiMenu.menu[index].title == 'Syarat dan Ketentuan') {
                          //   debugPrint('2');
                          //   await staticPageController.getStaticData('term');
                          //   Get.toNamed(Routes.static);
                          // } else {
                          //   ProfileTentangKamiMenu.menu[index].onTap.call();
                          // }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            // horizontal: 12.w,
                          ),
                          child: Row(
                            children: <Widget>[
                              AssetImageWidget(
                                assets: ProfileTentangKamiMenu.menu[index].menuIcon,
                                height: 20.h,
                                width: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                ProfileTentangKamiMenu.menu[index].title,
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  fontSize: AppTheme.textConfig.size.n,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppTheme.colors.blackColor1,
                                size: 16.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        color: const Color(0xffEDEDED),
                        height: 1.h,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: InkWell(
                onTap: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Get.offNamed(Routes.login);
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFEAEA),
                    border: Border.all(
                      color: const Color(0xffF3CDCD),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        size: 24.h,
                        color: const Color(0xffF22E2E),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Exit',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          color: const Color(0xffF22E2E),
                          fontSize: AppTheme.textConfig.size.n,
                          fontWeight: AppTheme.textConfig.weight.semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 21.h),
          ],
        ),
      ),
    );
  }
}
