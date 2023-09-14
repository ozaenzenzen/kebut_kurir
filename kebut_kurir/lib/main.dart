import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kebut_kurir/app/app.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLogin = prefs.getBool('isLogin') ?? true;
  // isLogin;
  // if (isLogin != null){
  //   isLogin;
  // }
  // print(isLogin);
  await initializeDateFormatting('id_ID', null);
  // await Firebase.initializeApp();

  Get.put(DialogsUtils(), permanent: true);
  Get.put(BottomSheetUtils(), permanent: true);
  bool isLogin = await Prefs.isLogin;
  print("isLogin $isLogin");

  await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  await FlutterStatusbarcolor.setNavigationBarColor(Colors.black);

  runApp(
    AppMain(
      initialRoute: isLogin ? Routes.main : Routes.login,
    ),
  );
  FlutterNativeSplash.remove();
}
