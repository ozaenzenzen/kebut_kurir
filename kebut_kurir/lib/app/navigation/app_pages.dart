import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_binding.dart';
import 'package:kebut_kurir/features/afterpickup_detailpickup_barang/presentation/after_pickup_barang_binding.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_binding.dart';
import 'package:kebut_kurir/features/detail_pickup_barang/presentation/detail_pickup_barang_binding.dart';
import 'package:kebut_kurir/features/edit_profile/presentation/edit_profile_binding.dart';
import 'package:kebut_kurir/features/home/presentation/home_binding.dart';
import 'package:kebut_kurir/features/info_driver/presentation/info_driver_binding.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_binding.dart';
import 'package:kebut_kurir/features/login/presentation/login_binding.dart';
import 'package:kebut_kurir/features/main/presentation/main_screen_binding.dart';
import 'package:kebut_kurir/features/pesan/presentation/pesan_binding.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_binding.dart';
import 'package:kebut_kurir/features/profile/presentation/profile_binding.dart';
import 'package:kebut_kurir/features/register/presentation/register_binding.dart';
import 'package:kebut_kurir/features/scan_qr/presentation/scan_qr_binding.dart';
import 'package:kebut_kurir/features/volume_barang/presentation/volume_barang_binding.dart';
import 'package:kebut_kurir/ui/absen/absen_screen.dart';
import 'package:kebut_kurir/ui/afterpickup_detailpickup_barang/after_pickup_barang_screen.dart';
import 'package:kebut_kurir/ui/chat/chat_screen.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/detail_pickup_barang_screen.dart';
import 'package:kebut_kurir/ui/edit_profile/edit_profile_screen.dart';
import 'package:kebut_kurir/ui/home/home_screen.dart';
import 'package:kebut_kurir/ui/info_driver/info_driver_screen.dart';
import 'package:kebut_kurir/ui/info_pengajuan/info_pengajuan_screen.dart';
import 'package:kebut_kurir/ui/login/login_screen.dart';
import 'package:kebut_kurir/ui/main/main_screen.dart';
import 'package:kebut_kurir/ui/pick_up_barang/pick_up_barang_screen.dart';
import 'package:kebut_kurir/ui/register/register_screen.dart';
import 'package:kebut_kurir/ui/scan_qr/scan_qr_screen.dart';

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
    GetPage<dynamic>(
      name: Routes.detailPickupBarangScreen,
      page: () => const DetailPickupBarangScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DetailPickupBarangBindng(),
    ),
    GetPage<dynamic>(
      name: Routes.absenScreen,
      page: () => const AbsenScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: AbsenBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.afterPickupBarang,
      page: () => const AfterPickupBarangScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: AfterPickupBarangBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.register,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: RegisterBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.scanQRScreen,
      page: () => const ScanQRScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ScanQRBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.volumeBarangScreen,
      page: () => const ScanQRScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: VolumeBarangBinding(),
    ),
  ];
}
