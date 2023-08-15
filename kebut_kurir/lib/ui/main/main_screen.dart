import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/main/presentation/main_controller.dart';
import 'package:kebut_kurir/ui/home/home_screen.dart';
import 'package:kebut_kurir/ui/main/widget/navbar_item.dart';
import 'package:kebut_kurir/ui/main/widget/navbar_widget.dart';
import 'package:kebut_kurir/ui/pesan/pesan_screen.dart';
import 'package:kebut_kurir/ui/profile/profile_screenV2.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.tabController,
        children: const <Widget>[
          HomeScreen(),
          PesanScreen(),
          ProfileScreenV2(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.colors.greyColor.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Obx(
              () => TabBar(
                indicatorColor: Colors.transparent,
                controller: controller.tabController,
                tabs: [
                  NavbarWidget(
                    item: NavBarItem(
                      iconData: Icons.home,
                      size: 25,
                      selectedColor: controller.tabIndex.value == 0 ? AppTheme.colors.blackColor2 : AppTheme.colors.greyColor,
                      text: 'Beranda',
                    ),
                  ),
                  NavbarWidget(
                    item: NavBarItem(
                      iconData: Icons.chat_outlined,
                      size: 25,
                      selectedColor: controller.tabIndex.value == 1 ? AppTheme.colors.blackColor2 : AppTheme.colors.greyColor,
                      text: 'Pesan',
                    ),
                  ),
                  NavbarWidget(
                    item: NavBarItem(
                      iconData: Icons.account_circle,
                      size: 25,
                      selectedColor: controller.tabIndex.value == 2 ? AppTheme.colors.blackColor2 : AppTheme.colors.greyColor,
                      text: 'Akun',
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


// Obx(
//         () => NavigationActionBar(
//           items: [
//             NavBarItem(
//               text: 'Beranda',
//               iconData: 'assets/home_ic.svg',
//               size: 32,
//               selectedColor: controller.tabIndex.value == 0 ? AppTheme.colors.secondaryColor : Colors.white,
//             ),
//             NavBarItem(
//               text: 'Akun',
//               iconData: 'assets/user.svg',
//               size: 32,
//               selectedColor: controller.tabIndex.value == 2 ? AppTheme.colors.secondaryColor : Colors.white,
//             ),
//           ],
//           mainIndex: 1,
//           subItems: [],
//           mainItems: NavBarItem(
//             text: 'Lainnya',
//             iconData: 'assets/lainnya.svg',
//             size: 32,
//             selectedColor: controller.tabIndex.value == 1 ? AppTheme.colors.secondaryColor : Colors.white,
//           ),
//           context: context,
//           onMainTap: () {
//             controller.tabController.index = 1;
//           },
//           onTap: (value) {
//             print('ISI VALUE $value');
//             if (value == 1) {
//               controller.tabController.index = 2;
//             } else if (value == 0) {
//               controller.tabController.index = 0;
//             }
//           },
//           backgroundColor: AppTheme.colors.primaryColor,
//           scaffoldColor: Colors.white,
//         ),
//       ),