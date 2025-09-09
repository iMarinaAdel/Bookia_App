import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/feature/auth/presentation/widgets/otp_input_fields.dart';
import 'package:bookia/routes/routes.dart';
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
        child: SingleChildScrollView(
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
                  pushReplacementTo(context, Routes.createPassword);
                },
                text: "Verify",
              ),
              Gap(30),
              AuthSwitcher(type: AuthType.oTPVerification),
            ],
          ),
        ),
      ),
    );
  }
}
