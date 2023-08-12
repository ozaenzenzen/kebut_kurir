import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/profile/data/profile_menu_item_model.dart';

class ProfilePengaturanProfileMenu {
  static List<ProfileMenuItemModels> menu = <ProfileMenuItemModels>[
    ProfileMenuItemModels(
      title: 'Info Driver',
      menuIcon: 'assets/icon_bookmarks.png',
      onTap: () {
        Get.toNamed(Routes.infoDriverScreen);
      },
    ),
    ProfileMenuItemModels(
      title: 'Info Pengajuan',
      menuIcon: 'assets/icon_credit_card.png',
      onTap: () {
        Get.toNamed(Routes.infoPengajuanScreen);
        // Get.to(
        //   () => const RekeningBankScreen(),
        //   binding: RekeningBankBinding(),
        //   transition: Transition.rightToLeftWithFade,
        // );
      },
    ),
  ];
}
