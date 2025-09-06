import 'package:bookia/const/app_fonts.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle getText30({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 30,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle getText26({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 26,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle getText24({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle getText22({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 22,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle getText18({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle getText16({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle getText14({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.dMSerifDisplay,
      color: color ?? AppColor.whiteColor,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}
