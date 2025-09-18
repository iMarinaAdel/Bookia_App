import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcome,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 30,
            right: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.logoSvg),
                Text(
                  "Order Your Book Now!",
                  style: TextStyles.getText24(color: AppColor.darkColor),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 100,
            child: Column(
              children: [
                AppMainBottom(
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                  text: 'Login',
                ),
                Gap(15),
                AppMainBottom(
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                  text: "Register",
                  bottomColor: AppColor.whiteColor,
                  textColor: AppColor.darkColor,
                  borderColor: AppColor.darkColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
