import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:lottie/lottie.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.donej, width: 300, height: 300),
              Text(
                "Password Changed!",
                style: TextStyles.getText30(color: AppColor.darkColor),
              ),
              Gap(10),
              Text(
                "Your password has been changed successfully.",
                style: TextStyles.getText18(color: AppColor.darkGrayColor),
                textAlign: TextAlign.center,
              ),
              Gap(40),
              AppMainBottom(
                onPressed: () {
                  AppNavigation.pushAndRemoveUntilTo(context, LoginScreen());
                },
                text: "Back to Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
