import 'package:bookia/const/app_fonts.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.dMSerifDisplay,
    scaffoldBackgroundColor: AppColor.whiteColor,
    textTheme: const TextTheme(bodyLarge: TextStyle(color: AppColor.darkColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.whiteColor,
        backgroundColor: AppColor.primaryColor,
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColor.whiteColor),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getText18(color: AppColor.grayColor),
      labelStyle: TextStyle(color: AppColor.grayColor),
      floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
      filled: true,
      fillColor: AppColor.textFormColor,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColor.borderColor),
      ),
    ),
  );
}
