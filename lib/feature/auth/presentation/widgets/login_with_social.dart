import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/feature/auth/presentation/widgets/app_social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSocialButton(AppAssets: AppAssets.facebookSvg),
        Gap(10),
        AppSocialButton(AppAssets: AppAssets.googleSvg),
        Gap(10),
        AppSocialButton(AppAssets: AppAssets.appleSvg),
      ],
    );
  }
}
