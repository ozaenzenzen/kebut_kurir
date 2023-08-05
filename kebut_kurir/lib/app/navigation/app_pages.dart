import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/features/home/presentation/home_binding.dart';
import 'package:kebut_kurir/features/login/presentation/login_binding.dart';
import 'package:kebut_kurir/features/register/presentation/register_binding.dart';
import 'package:kebut_kurir/ui/login/login_screen.dart';
import 'package:kebut_kurir/ui/register/register_screen.dart';

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
    // GetPage<dynamic>(
    //   name: Routes.helpCenter,
    //   page: () => const HelpCenterScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: HelpCenterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.rekamJejakScreen,
    //   page: () => const RekamJejakScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.mapScreen,
    //   page: () => const MapScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.riwayatPemesananScreen,
    //   page: () => const RiwayatPemesananScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.detailPesananScreen,
    //   page: () => const DetailPesananScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.suratJalanScreen,
    //   page: () => const SuratJalanScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.promoScreen,
    //   page: () => const PromoScreen(),
    //   binding: PromoBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.promoDetailScreen,
    //   page: () => const PromoDetailScreen(),
    //   binding: DetailPromoBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.voucherDetailScreen,
    //   page: () => const VoucherDetailScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.voucherScreen,
    //   page: () => const VoucherScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.fotoResiScreen,
    //   page: () => const FotoResiScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.chat,
    //   page: () => const ChatScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.selectChat,
    //   page: () => const ChatSelectScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.walletScreen,
    //   page: () => const WalletScreen(),
    //   binding: WalletBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.detailOrderScreen,
    //   page: () => const OrderDetaiScreen(),
    //   binding: WalletBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.myOrder,
    //   page: () => const OrderScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.myOrder,
    //   page: () => const MyOrderScreen(),
    //   binding: MainScreenBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.notif,
    //   page: () => const NotificationScreen(),
    //   binding: NotificationBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.activeOrder,
    //   page: () => const ActiveOrderScreenn(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.static,
    //   page: () => const StaticPage(),
    //   binding: StaticPageBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kartuPegawai,
    //   page: () => const KartuPegawaioOcr(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KartuPegawaiBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kartuPegawaiResult,
    //   page: () => const KartuPegawaioOcrResult(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KartuPegawaiBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kartuPegawaiConfirm,
    //   page: () => const KartuPegawaiConfirm(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KartuPegawaiBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kurirPaketScreen,
    //   page: () => const KurirPaketScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.ukuranPaketScreen,
    //   page: () => const UkuranPaketScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.batalkanPengirimanScreen,
    //   page: () => const BatalkanPengirimanScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: LacakPengirimanBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kurirPaketPaymentCompletedScreen,
    //   page: () => const KurirPaketPaymentCompletedScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.lacakPengirimanScreen,
    //   page: () => const LacakPengirimanScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: LacakPengirimanBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kurirPaketPembayaranScreen,
    //   page: () => const KurirPaketPembayaranScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.callScreen,
    //   page: () => const CallScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.kurirPaketPaymentMethod,
    //   page: () => const KurirPaketPaymentMehod(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.pengirimanPaketScreen,
    //   page: () => const PengirimanPaketScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KurirPaketBinding(),
    // ),
    // GetPage<dynamic>(name: Routes.hubungiKami, page: () => const HubungiKamiScreen(), transition: Transition.rightToLeftWithFade, binding: HubungiKamiBinding()),
    // GetPage<dynamic>(
    //   name: Routes.antarBarangScreen,
    //   page: () => const AntarBarangScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.carterScreen,
    //   page: () => const CarterScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),

    // GetPage<dynamic>(
    //   name: Routes.carterDetailPengiriman,
    //   page: () => const CarterDetailPengiriman(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.cargoScreen,
    //   page: () => const CargoScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.carterDetailPemesanan,
    //   page: () => const CarterDetailPemesanan(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.carterPembayaranScreen,
    //   page: () => const CarterPembayaranScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.carterPesananScreen,
    //   page: () => const CarterPesananScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: CarterBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.profile,
    //   page: () => const ProfileScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: ProfileBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.service,
    //   page: () => const ServiceScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: ProfileBinding(),
    // ),
    GetPage<dynamic>(
      name: Routes.register,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: RegisterBinding(),
    ),
    // GetPage<dynamic>(
    //   name: Routes.ktpGuide,
    //   page: () => const KtpGuideScreen(),
    //   binding: KtpGuideBinding(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.ocrKtp,
    //   page: () => const KtpOcrScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.ocrKtpResult,
    //   page: () => const KtpOcrResultScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KtpOcrBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.ocrKtpConfirm,
    //   page: () => const KtpConfirmDataScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KtpConfirmBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.livenessScreen,
    //   page: () => const KtpLivenessScreen(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage<dynamic>(
    //   name: Routes.livenessResult,
    //   page: () => const KtpLivenessResultScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: KtpLivenessBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.forgotPassword,
    //   page: () => const ForgotPasswordScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: ForgotPasswordBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.changePassword,
    //   page: () => const ChangePasswordScreen(),
    //   transition: Transition.rightToLeftWithFade,
    //   binding: ForgotPasswordBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.lacakPesananScreen,
    //   page: () => const LacakPesananScreen(),
    //   binding: LacakPesananBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.formKomplainScreen,
    //   page: () => const FormKomplainScreen(),
    //   binding: FormKomplainBinding(),
    // ),
    // GetPage<dynamic>(
    //   name: Routes.paymentMyOrderScreen,
    //   page: () => const PaymentMyOrderScreen(),
    //   binding: PaymentMyOrderBinding(),
    // ),

    // GetPage<dynamic>(
    //   name: Routes.newPasswordScreen,
    //   page: () => const NewPasswordScreen(),
    //   binding: ForgotPasswordBinding(),
    // ),
  ];
}
