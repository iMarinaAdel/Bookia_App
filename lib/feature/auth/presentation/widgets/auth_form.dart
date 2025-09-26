import 'package:bookia/core/components/inputs/app_text_form_field.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/auth_types/auth_type.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, required this.type});
  final AuthType type;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    final isLogin = type == AuthType.login;
    return Form(
      key: cubit.formKey,
      child: Column(
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
              controller: cubit.userNameControllar,
              labelText: 'Username',
              hintText: "Enter Your Username",
              isPassword: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username is required";
                }
                if (value.length < 3) {
                  return "Username must be at least 3 chars";
                }
                return null;
              },
            ),
          },
          Gap(20),
          AppTextFormField(
            controller: cubit.emailControllar,
            labelText: 'Email',
            hintText: "Enter Your Email",
            isPassword: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              if (!RegExp(
                r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
              ).hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
          Gap(15),
          AppTextFormField(
            controller: cubit.passwordControllar,
            labelText: 'Password',
            hintText: "Enter Your Password",
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              }
              if (value.length < 6) {
                return "Password must be at least 6 chars";
              }
              return null;
            },
          ),
          if (!isLogin) ...{
            Gap(15),
            AppTextFormField(
              controller: cubit.passwordConfirmationControllar,
              labelText: 'Confirm password',
              hintText: "Enter Confirm password",
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm password is required";
                }
                if (value != cubit.passwordControllar.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
          },

          if (isLogin)
            Align(
              alignment: Alignment.centerRight,
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
      ),
    );
  }
}
