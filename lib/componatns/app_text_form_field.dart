import 'package:bookia/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.labelText,
    this.suffixIcon,
    this.hintText,
  });
  final String? labelText;
  final Widget? suffixIcon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
