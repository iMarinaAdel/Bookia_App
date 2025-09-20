import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/extentions/dailogs.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart'
    show AuthCubit;
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_form.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/feature/auth/presentation/widgets/login_divider.dart';
import 'package:bookia/feature/auth/presentation/widgets/login_with_social.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: SingleChildScrollView(
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (BuildContext context, state) {
            if (state is AuthLoading) {
              Dialogs.showLoadingDialog(context, "Please wait...");
            } else if (state is AuthSuccess) {
              Dialogs.hideLoadingDialog(context);
              Dialogs.showSuccessDialog(context, "Login Successfully!");
              Future.delayed(const Duration(seconds: 2), () {
                pushAndRemoveUntilTo(context, Routes.main);
              });
            } else if (state is AuthError) {
              Dialogs.hideLoadingDialog(context);
              Dialogs.showErrorDialog(context, state.error);
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthForm(type: AuthType.login),
                  Gap(30),
                  Center(
                    child: AppMainBottom(
                      onPressed: () {
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          // successe
                          cubit.login();
                        }
                      },
                      text: "Login",
                    ),
                  ),
                  Gap(30),
                  LoginDivider(),
                  Gap(20),
                  LoginWithSocial(),
                  Gap(30),
                  AuthSwitcher(type: AuthType.login),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
