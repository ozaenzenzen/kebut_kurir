import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/absen/presentation/absen_binding.dart';
import 'package:kebut_kurir/features/afterpickup_detailpickup_barang/presentation/after_pickup_barang_binding.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_binding.dart';
import 'package:kebut_kurir/features/delivery_barang/presentation/delivery_barang_binding.dart';
import 'package:kebut_kurir/features/detail_delivery/presentation/detail_delivery_binding.dart';
import 'package:kebut_kurir/features/detail_pickup_barang/presentation/detail_pickup_barang_binding.dart';
import 'package:kebut_kurir/features/edit_profile/presentation/edit_profile_binding.dart';
import 'package:kebut_kurir/features/home/presentation/home_binding.dart';
import 'package:kebut_kurir/features/info_driver/presentation/info_driver_binding.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_binding.dart';
import 'package:kebut_kurir/features/ktp_liveness/presentation/ktp_liveness_binding.dart';
import 'package:kebut_kurir/features/ktp_liveness_result/presentation/ktp_liveness_result_binding.dart';
import 'package:kebut_kurir/features/ktp_ocr_confirm/presentation/ktp_ocr_confirm_binding.dart';
import 'package:kebut_kurir/features/ktp_ocr_result/presentation/ktp_ocr_result_binding.dart';
import 'package:kebut_kurir/features/login/presentation/login_binding.dart';
import 'package:kebut_kurir/features/main/presentation/main_screen_binding.dart';
import 'package:kebut_kurir/features/pesan/presentation/pesan_binding.dart';
import 'package:kebut_kurir/features/pick_up_barang/presentation/pick_up_barang_binding.dart';
import 'package:kebut_kurir/features/profile/presentation/profile_binding.dart';
import 'package:kebut_kurir/features/register/presentation/register_binding.dart';
import 'package:kebut_kurir/features/register_upload_document/presentation/register_upload_document_binding.dart';
import 'package:kebut_kurir/features/scan_qr/presentation/scan_qr_binding.dart';
import 'package:kebut_kurir/features/sim_liveness_result/sim_liveness_result_binding.dart';
import 'package:kebut_kurir/features/static_page/presentation/static_page_binding.dart';
import 'package:kebut_kurir/features/stnk_kendaraan_liveness_result/presentation/stnk_kendaraan_liveness_result_binding.dart';
import 'package:kebut_kurir/features/stnk_liveness/presentation/stnk_liveness_binding.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/presentation/stnk_liveness_confirm_binding.dart';
import 'package:kebut_kurir/features/stnk_liveness_result/presentation/stnk_liveness_result_binding.dart';
import 'package:kebut_kurir/features/volume_barang/presentation/volume_barang_binding.dart';
import 'package:kebut_kurir/ui/absen/absen_screen.dart';
import 'package:kebut_kurir/ui/afterpickup_detailpickup_barang/after_pickup_barang_screen.dart';
import 'package:kebut_kurir/ui/chat/chat_screen.dart';
import 'package:kebut_kurir/ui/delivery_barang/delivery_barang_screen.dart';
import 'package:kebut_kurir/ui/detail_delivery_barang/detail_delivery_barang_screen.dart';
import 'package:kebut_kurir/ui/detail_pickup_barang/detail_pickup_barang_screen.dart';
import 'package:kebut_kurir/ui/edit_profile/edit_profile_screen.dart';
import 'package:kebut_kurir/ui/home/home_screen.dart';
import 'package:kebut_kurir/ui/info_driver/info_driver_screen.dart';
import 'package:kebut_kurir/ui/info_pengajuan/info_pengajuan_screen.dart';
import 'package:kebut_kurir/ui/ktp_liveness/ktp_liveness_screen.dart';
import 'package:kebut_kurir/ui/ktp_liveness_result/ktp_liveness_result_screen.dart';
import 'package:kebut_kurir/ui/ktp_ocr_confirm/ktp_ocr_confirm_screen.dart';
import 'package:kebut_kurir/ui/ktp_ocr_result/ktp_ocr_result_screen.dart';
import 'package:kebut_kurir/ui/login/login_screen.dart';
import 'package:kebut_kurir/ui/main/main_screen.dart';
import 'package:kebut_kurir/ui/pick_up_barang/pick_up_barang_screen.dart';
import 'package:kebut_kurir/ui/register/register_screen.dart';
import 'package:kebut_kurir/ui/register_upload_document/register_upload_document_screen.dart';
import 'package:kebut_kurir/ui/scan_qr/scan_qr_screen.dart';
import 'package:kebut_kurir/ui/sim_liveness/sim_liveness_result_screen.dart';
import 'package:kebut_kurir/ui/sim_liveness/sim_liveness_screen.dart';
import 'package:kebut_kurir/ui/static_page/static_page_screen.dart';
import 'package:kebut_kurir/ui/stnk_kendaraan_liveness_result/stnk_kendaraan_liveness_result_screen.dart';
import 'package:kebut_kurir/ui/stnk_liveness/stnk_liveness_screen.dart';
import 'package:kebut_kurir/ui/stnk_liveness_confirm/stnk_liveness_confirm_screen.dart';
import 'package:kebut_kurir/ui/stnk_liveness_result/stnk_liveness_result_screen.dart';

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
    GetPage<dynamic>(
      name: Routes.deliveryBarangScreen,
      page: () => const DeliveryBarangScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DeliveryBarangBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.detailDeliveryBarangScreen,
      page: () => const DetailDeliveryBarangScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DetailDeliveryBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.registerUploadDocumentScreen,
      page: () => const RegisterUploadDocumentScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: RegisterUploadDocumentBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.ocrKtpResult,
      page: () => const KTPOcrResultScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: KTPOcrResultBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.ocrKtpConfirm,
      page: () => const KTPOcrConfirmScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: KTPOcrConfirmBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.livenessScreen,
      page: () => const KTPLivenessScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: KTPLivenessBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.livenessResult,
      page: () => const KTPLivenessResultScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: KTPLivenessResultBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.simLivenessResult,
      page: () => const SIMLivenessResultScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: SIMLivenessResultBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.stnkLivenessScreen,
      page: () => const STNKLivenessScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: STNKLivenessBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.stnkLivenessResultScreen,
      page: () => const STNKLivenessResultScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: STNKLivenessResultBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.stnkLivenessConfirmScreen,
      page: () => const STNKLivenessConfirmScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: STNKLivenessConfirmBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.stnkKendaraanLivenessResultScreen,
      page: () => const STNKKendaraanLivenessResultScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: STNKKendaraanLivenessResultBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.static,
      page: () => const StaticPageScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: StaticPageBinding(),
    ),
  ];
}
