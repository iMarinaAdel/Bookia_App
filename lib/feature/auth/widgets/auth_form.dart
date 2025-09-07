import 'package:bookia/componatns/app_text_form_field.dart';
import 'package:bookia/const/app_assets.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/models/auth_type.dart';
import 'package:bookia/feature/auth/pages/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, required this.type});
  final AuthType type;

  @override
  Widget build(BuildContext context) {
    final isLogin = type == AuthType.login;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isLogin
              ? "Welcome back! Glad \n to see you, Again!"
              : "Hello! Register to get \n started",
          style: TextStyles.getText26(color: AppColor.darkColor),
        ),
        if (!isLogin) ...{
          Gap(20),
          AppTextFormField(
            labelText: 'Username',
            hintText: "Enter Your Username",
          ),
        },
        Gap(20),
        AppTextFormField(labelText: 'Email', hintText: "Enter Your Email"),
        Gap(15),
        AppTextFormField(
          labelText: 'Password',
          hintText: "Enter Your Password",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AppAssets.eyeSvg, width: 25, height: 25),
          ),
        ),
        if (!isLogin) ...{
          Gap(15),
          AppTextFormField(
            labelText: 'Confirm password',
            hintText: "Enter Confirm password",
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppAssets.eyeSvg, width: 25, height: 25),
            ),
          ),
        },

        if (isLogin)
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primaryColor,
              ),
              onPressed: () {
                AppNavigation.pushTo(context, ForgetPasswordScreen());
              },
              child: Text(
                textAlign: TextAlign.end,
                "Forgot Password?",
                style: TextStyles.getText16(color: AppColor.darkGrayColor),
              ),
            ),
          ),
      ],
    );
  }
}
