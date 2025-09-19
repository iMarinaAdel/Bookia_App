import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/extentions/dailogs.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/feature/auth/presentation/widgets/otp_input_fields.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is AuthSuccess) {
            pushReplacementTo(context, Routes.createPassword);
          } else if (state is AuthResendCodeSuccess) {
            Dialogs.showSuccessDialog(context, "Code resent successfully!");
          } else if (state is AuthError) {
            Dialogs.showErrorDialog(context, state.error);
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
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
                  OtpInputFields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the code";
                      }
                      if (value.length < 6) {
                        return "Code must be 6 digits";
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  AppMainBottom(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.checkForgetCode();
                      }
                    },
                    text: "Verify",
                  ),
                  Gap(30),
                  AuthSwitcher(
                    type: AuthType.oTPVerification,
                    onTapResent: () {
                      cubit.resendVerifyCode();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
