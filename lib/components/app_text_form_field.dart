import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.labelText,
    this.suffixIcon,
    this.hintText,
    required this.isPassword,
  });
  final String? labelText;
  final Widget? suffixIcon;
  final String? hintText;
  final bool isPassword;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText && widget.isPassword,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? SvgPicture.asset(
                          AppAssets.eyeSvg,
                          width: 25,
                          height: 25,
                        )
                      : Icon(Icons.visibility_off_outlined),
                ),
              )
            : null,
        hintText: widget.hintText,
      ),
    );
  }
}
