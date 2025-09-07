import 'package:bookia/componatns/app_main_bottom.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/models/auth_type.dart';
import 'package:bookia/feature/auth/pages/create_password_screen.dart';
import 'package:bookia/feature/auth/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/widgets/auth_switcher.dart';
import 'package:bookia/feature/auth/widgets/otp_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "OTP Verification",
              style: TextStyles.getText26(color: AppColor.darkColor),
            ),
            Gap(15),
            Text(
              "Enter the verification code we just sent on your email address.",
              style: TextStyles.getText16(color: AppColor.darkGrayColor),
            ),
            Gap(30),
            OtpInputFields(),
            Gap(30),
            AppMainBottom(
              onPressed: () {
                AppNavigation.pushReplacementTo(
                  context,
                  CreatePasswordScreen(),
                );
              },
              text: "Verify",
            ),
            Gap(30),
            AuthSwitcher(type: AuthType.oTPVerification),
          ],
        ),
      ),
    );
  }
}
