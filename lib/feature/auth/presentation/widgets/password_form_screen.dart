import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/components/app_text_form_field.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/extentions/dailogs.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/models/password_screen_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class PasswordFormScreen extends StatelessWidget {
  const PasswordFormScreen({super.key, required this.type});
  final PasswordScreenType type;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    bool isForgetPassword = type == PasswordScreenType.forgetPassword;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {
        if (state is AuthLoading) {
          Dialogs.showLoadingDialog(context);
        } else if (state is AuthSuccess) {
          Dialogs.hideLoadingDialog(context);
          pushTo(
            context,
            isForgetPassword ? Routes.otpVerification : Routes.passwordChanged,
          );
        } else if (state is AuthResetPasswordSuccess) {
          Dialogs.hideLoadingDialog(context);
          pushReplacementTo(context, Routes.passwordChanged);
        } else if (state is AuthError) {
          Dialogs.hideLoadingDialog(context);
          Dialogs.showErrorDialog(context, state.error);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
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
                Text(
                  "Email",
                  style: TextStyles.getText16(color: AppColor.darkColor),
                ),
                Gap(10),
                AppTextFormField(
                  hintText: "Enter Your Email",
                  isPassword: false,
                  controller: cubit.emailControllar,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains("@")) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
              },

              if (!isForgetPassword) ...{
                Gap(30),
                Text(
                  "New Password",
                  style: TextStyles.getText16(color: AppColor.darkColor),
                ),
                Gap(10),
                AppTextFormField(
                  hintText: "Enter New Password",
                  isPassword: true,
                  controller: cubit.passwordControllar,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                Gap(15),
                Text(
                  "Confirm Password",
                  style: TextStyles.getText16(color: AppColor.darkColor),
                ),
                Gap(10),
                AppTextFormField(
                  hintText: "Enter Confirm Password",
                  isPassword: true,
                  controller: cubit.passwordConfirmationControllar,
                  validator: (value) {
                    if (value != cubit.passwordControllar.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
              },

              Gap(40),
              Center(
                child: AppMainBottom(
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      if (isForgetPassword) {
                        cubit.forgetPassword();
                      } else {
                        cubit.resetPassword();
                      }
                    }
                  },
                  text: isForgetPassword ? "Send Code" : "Reset Password",
                ),
              ),

              if (isForgetPassword) ...{
                Gap(30),
                AuthSwitcher(type: AuthType.forgetPassword),
              },
            ],
          ),
        ),
      ),
    );
  }
}
