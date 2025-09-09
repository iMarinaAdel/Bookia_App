import 'package:bookia/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSocialButton extends StatelessWidget {
  const AppSocialButton({super.key, required this.AppAssets});
  final String AppAssets;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 90,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColor.borderColor),
      ),
      child: SvgPicture.asset(AppAssets),
    );
  }
}
