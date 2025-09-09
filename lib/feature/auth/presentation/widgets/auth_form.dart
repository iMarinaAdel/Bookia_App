import 'package:bookia/components/app_text_form_field.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

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
            isPassword: false,
          ),
        },
        Gap(20),
        AppTextFormField(
          labelText: 'Email',
          hintText: "Enter Your Email",
          isPassword: false,
        ),
        Gap(15),
        AppTextFormField(
          labelText: 'Password',
          hintText: "Enter Your Password",
          isPassword: true,
        ),
        if (!isLogin) ...{
          Gap(15),
          AppTextFormField(
            labelText: 'Confirm password',
            hintText: "Enter Confirm password",
            isPassword: true,
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
                pushTo(context, Routes.forgetPassword);
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
