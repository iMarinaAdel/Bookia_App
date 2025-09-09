import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_form.dart';
import 'package:bookia/feature/auth/presentation/widgets/auth_switcher.dart';
import 'package:bookia/feature/auth/presentation/widgets/login_divider.dart';
import 'package:bookia/feature/auth/presentation/widgets/login_with_social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthForm(type: AuthType.login),
                Gap(30),
                Center(
                  child: AppMainBottom(onPressed: () {}, text: "Login"),
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
    );
  }
}
