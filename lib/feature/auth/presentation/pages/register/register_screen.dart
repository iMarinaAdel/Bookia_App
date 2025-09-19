import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/extentions/dailogs.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_form.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is AuthLoading) {
            Dialogs.showLoadingDialog(context, "Please wait...");
          } else if (state is AuthSuccess) {
            Dialogs.hideLoadingDialog(context);
            Dialogs.showSuccessDialog(context, "Register Successfully!");
            Future.delayed(const Duration(seconds: 2), () {
              pushAndRemoveUntilTo(context, Routes.main);
            });
          } else if (state is AuthError) {
            Dialogs.hideLoadingDialog(context);
            Dialogs.showErrorDialog(context, state.error);
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthForm(type: AuthType.register),
                Gap(40),
                Center(
                  child: AppMainBottom(
                    onPressed: () {
                      if (cubit.formKey.currentState?.validate() ?? false) {
                        // successe
                        cubit.rigester();
                      }
                    },
                    text: "Register",
                  ),
                ),
                Gap(40),
                AuthSwitcher(type: AuthType.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
