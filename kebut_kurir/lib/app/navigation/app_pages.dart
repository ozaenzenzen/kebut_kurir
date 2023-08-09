import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_binding.dart';
import 'package:kebut_kurir/features/edit_profile/presentation/edit_profile_binding.dart';
import 'package:kebut_kurir/features/home/presentation/home_binding.dart';
import 'package:kebut_kurir/features/info_driver/presentation/info_driver_binding.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_binding.dart';
import 'package:kebut_kurir/features/login/presentation/login_binding.dart';
import 'package:kebut_kurir/features/main/presentation/main_screen_binding.dart';
import 'package:kebut_kurir/features/pesan/presentation/pesan_binding.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_binding.dart';
import 'package:kebut_kurir/features/profile/presentation/profile_binding.dart';
import 'package:kebut_kurir/ui/chat/chat_screen.dart';
import 'package:kebut_kurir/ui/edit_profile/edit_profile_screen.dart';
import 'package:kebut_kurir/ui/home/home_screen.dart';
import 'package:kebut_kurir/ui/info_driver/info_driver_screen.dart';
import 'package:kebut_kurir/ui/info_pengajuan/info_pengajuan_screen.dart';
import 'package:kebut_kurir/ui/login/login_screen.dart';
import 'package:kebut_kurir/ui/main/main_screen.dart';
import 'package:kebut_kurir/ui/pick_up_barang/pick_up_barang_screen.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.main,
      page: () => const MainScreen(),
      transition: Transition.rightToLeftWithFade,
      bindings: [
        MainScreenBinding(),
        ProfileBinding(),
        HomeBinding(),
        PesanBinding(),
      ],
    ),
    GetPage<dynamic>(
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: LoginBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.chat,
      page: () => const ChatScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ChatBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.editProfileScreen,
      page: () => const EditProfileScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: EditProfileBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.infoPengajuanScreen,
      page: () => const InfoPengajuanScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: InfoPengajuanBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.infoDriverScreen,
      page: () => const InfoDriverScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: InfoDriverBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.pickupBarangScreen,
      page: () => const PickupBarangScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: PickupBarangBinding(),
    ),
  ];
}
