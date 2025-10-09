import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/app_navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      var token = LocalHelper.getToken();

      if (token != null) {
        pushReplacementTo(context, Routes.main);
      } else {
        pushReplacementTo(context, Routes.welcome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logoSvg),
            Gap(20),
            Text(
              "Order Your Book Now!",
              style: TextStyles.getText24(color: AppColor.darkColor),
            ),
          ],
        ),
      ),
    );
  }
}
