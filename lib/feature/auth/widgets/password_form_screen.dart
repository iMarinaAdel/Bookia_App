import 'package:bookia/componatns/app_main_bottom.dart';
import 'package:bookia/componatns/app_text_form_field.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/models/auth_type.dart';
import 'package:bookia/feature/auth/models/password_screen_type.dart';
import 'package:bookia/feature/auth/pages/oTP_verification.dart';
import 'package:bookia/feature/auth/pages/password_changed.dart';
import 'package:bookia/feature/auth/widgets/auth_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class PasswordFormScreen extends StatelessWidget {
  const PasswordFormScreen({super.key, required this.type});
  final PasswordScreenType type;
  @override
  Widget build(BuildContext context) {
    bool isForgetPassword = type == PasswordScreenType.forgetPassword;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isForgetPassword ? "Forgot Password?" : "Create new password",
          style: TextStyles.getText26(color: AppColor.darkColor),
        ),
        Gap(15),
        Text(
          isForgetPassword
              ? "Don't worry! It occurs. Please enter the email address linked with your account."
              : "Your new password must be unique from those previously used.",
          style: TextStyles.getText16(color: AppColor.darkGrayColor),
        ),
        if (isForgetPassword) ...{
          Gap(30),
          Text("Email", style: TextStyles.getText16(color: AppColor.darkColor)),
          Gap(10),
          AppTextFormField(hintText: "Enter Your Email"),
        },
        if (!isForgetPassword) ...{
          Gap(30),
          Text(
            "New Password",
            style: TextStyles.getText16(color: AppColor.darkColor),
          ),
          Gap(10),
          AppTextFormField(hintText: "Enter New Password"),
          Gap(15),
          Text(
            "Confirm Password",
            style: TextStyles.getText16(color: AppColor.darkColor),
          ),
          Gap(10),
          AppTextFormField(hintText: "Enter Confirm Password"),
        },
        Gap(40),
        Center(
          child: AppMainBottom(
            onPressed: () {
              AppNavigation.pushTo(
                context,
                isForgetPassword ? OtpVerification() : PasswordChanged(),
              );
            },
            text: isForgetPassword ? "Send Code" : "Reset Password",
          ),
        ),
        if (isForgetPassword) ...{
          Gap(30),
          AuthSwitcher(type: AuthType.forgetPassword),
        },
      ],
    );
  }
}
