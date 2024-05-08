import 'dart:async';

// import 'package:app_links/app_links.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freerasp/utils/hash_converter.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_pages.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/app/security/freerasp_config.dart';
import 'package:kebut_kurir/core/theme/theme_custom/theme_data_custom.dart';

class AppMain extends StatefulWidget {
  final String initialRoute;
  const AppMain({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  String base64Hash = hashConverter.fromSha256toBase64('9A:01:47:41:E6:BB:FD:B3:84:23:AE:DB:D0:D4:F0:5C:0F:75:9C:AF:37:17:33:64:B1:D9:32:25:94:48:99:EE');
  Future<void> initSecurityState() async {
    FreeraspConfig().initSecurity(
      expectedPackageName: 'com.example.kebut_kurir',
      expectedSigningCertificateHash: base64Hash,
      supportedAlternativeStores: <String>['com.sec.android.app.samsungapps'],
      watcherMail: 'yerikhosutandi0@gmail.com',
      iosAppBundleId: 'com.example.kebut_kurir',
      iosAppTeamId: 'Q3F7R3QAGK',
    );
  }

  Future<void> initDinamycLinks() async {
    debugPrint("start dynamic links");
    dynamicLinks.onLink.listen((dynamicLinkData) async {
      debugPrint('DYNAMIC LINK DATA ${dynamicLinkData.link.toString()}');
      Get.toNamed(
        Routes.newPasswordScreen,
      );
    }).onError((error) {
      debugPrint('DYNAMIC LINK ERROR $error');
    });
  }

  // final _navigatorKey = GlobalKey<NavigatorState>();
  // late AppLinks _appLinks;
  // StreamSubscription<Uri>? _linkSubscription;

  // @override
  // void dispose() {
  //   _linkSubscription?.cancel();

  //   super.dispose();
  // }

  // Future<void> initDeepLinks() async {
  //   debugPrint('initDeepLinks');
  //   _appLinks = AppLinks();

  //   // Check initial link if app was in cold state (terminated)
  //   final appLink = await _appLinks.getInitialAppLink();
  //   if (appLink != null) {
  //     print('getInitialAppLink: $appLink');
  //     openAppLink(appLink);
  //   }

  //   // Handle link when app is in warm state (front or background)
  //   _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
  //     print('onAppLink: $uri');
  //     openAppLink(uri);
  //   });
  // }

  // void openAppLink(Uri uri) {
  //   // _navigatorKey.currentState?.pushNamed(uri.fragment);
  //   // debugPrint('DYNAMIC LINK DATA ${dynamicLinkData.link.toString()}');
  //     Get.toNamed(
  //       Routes.newPasswordScreen,
  //     );
  // }

  @override
  void initState() {
    // initDeepLinks();
    initDinamycLinks();
    initSecurityState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Kebut',
          debugShowCheckedModeBanner: false,
          theme: ThemeDataCustom.light,
          darkTheme: ThemeDataCustom.dark,
          themeMode: ThemeMode.light,
          initialRoute: widget.initialRoute,
          getPages: AppPages.routes,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
