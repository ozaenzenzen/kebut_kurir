import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
class ThemeDataCustom {
  ThemeDataCustom();

  static ThemeData dark = ThemeData(
    focusColor: AppTheme.colors.blackColor1,
    cardColor: AppTheme.colors.blackColor1,
    dividerColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    shadowColor: AppTheme.colors.whiteColor,
    brightness: Brightness.dark,
    canvasColor: AppTheme.colors.whiteColor,
    backgroundColor: AppTheme.colors.blackColor1,
    primaryColor: AppTheme.colors.primaryColor,
    selectedRowColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppTheme.colors.primaryColor,
      selectionColor: AppTheme.colors.primaryColor,
      selectionHandleColor: AppTheme.colors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppTheme.colors.blackColor1,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
      headlineSmall: TextStyle(
        color: AppTheme.colors.whiteColor,
        fontWeight: FontWeight.normal,
        fontSize: 30.0,
      ),
      titleLarge: AppTheme.textStyle.blackTextStyle,
      bodyLarge: AppTheme.textStyle.whiteTextStyle,
      bodyMedium: AppTheme.textStyle.whiteTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(AppTheme.colors.blackColor1),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppTheme.colors.blackColor1),
        elevation: MaterialStateProperty.all<double>(0.0),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppTheme.colors.whiteColor),
          ),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppTheme.colors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppTheme.colors.blackColor1,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      hintStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      labelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      contentPadding: const EdgeInsets.all(10),
      isDense: true,
    ),
  );
  static ThemeData light = ThemeData(
    focusColor: AppTheme.colors.whiteColor,
    cardColor: AppTheme.colors.whiteColor,
    dividerColor: AppTheme.colors.blackColor1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.colors.whiteColor,
    ),
    shadowColor: AppTheme.colors.blackColor1.withOpacity(0.5),
    brightness: Brightness.light,
    canvasColor: AppTheme.colors.whiteColor,
    backgroundColor: AppTheme.colors.whiteColor2,
    primaryColor: AppTheme.colors.primaryColor,
    selectedRowColor: Colors.black26,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppTheme.colors.blackColor1,
      selectionColor: AppTheme.colors.blackColor1,
      selectionHandleColor: AppTheme.colors.blackColor1,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: AppTheme.colors.blackColor1,
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
      headline5: TextStyle(
        color: AppTheme.colors.blackColor1,
        fontWeight: FontWeight.normal,
        fontSize: 30.0,
      ),
      headline6: AppTheme.textStyle.whiteTextStyle,
      bodyText1: AppTheme.textStyle.blackTextStyle,
      bodyText2: AppTheme.textStyle.blackTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(0.0),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      contentPadding: EdgeInsets.all(10),
      isDense: true,
    ),
  );
}
