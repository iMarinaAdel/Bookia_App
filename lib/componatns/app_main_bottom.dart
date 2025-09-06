import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class AppMainBottom extends StatelessWidget {
  const AppMainBottom({
    super.key,
    required this.onPressed,
    this.textColor,
    required this.text,
    this.borderColor,
    this.bottomColor,
    this.bottomWidth,
    this.bottomHight,
  });
  final VoidCallback onPressed;
  final Color? textColor;
  final String text;
  final Color? borderColor;
  final Color? bottomColor;
  final double? bottomWidth;
  final double? bottomHight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bottomWidth ?? 350,
      height: bottomHight ?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bottomColor ?? AppColor.primaryColor,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.getText18(color: textColor)),
      ),
    );
  }
}
