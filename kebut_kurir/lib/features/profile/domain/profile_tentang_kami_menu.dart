import 'package:kebut_kurir/features/profile/data/profile_menu_item_model.dart';

class ProfileTentangKamiMenu {
  static List<ProfileMenuItemModels> menu = <ProfileMenuItemModels>[
    ProfileMenuItemModels(
      title: 'Kebijakan Privasi',
      menuIcon: 'assets/icon_verified_user.png',
      onTap: () {
        //
      },
    ),
    ProfileMenuItemModels(
      title: 'Syarat dan Ketentuan',
      menuIcon: 'assets/icon_description.png',
      onTap: () {
        //
      },
    ),
    ProfileMenuItemModels(
      title: 'Berikan Kami Rating',
      menuIcon: 'assets/icon_star.png',
      onTap: () {},
    ),
    ProfileMenuItemModels(
      title: 'Hubungi Kami',
      menuIcon: 'assets/icon_headphones.png',
      onTap: () async {},
    ),
  ];
}
