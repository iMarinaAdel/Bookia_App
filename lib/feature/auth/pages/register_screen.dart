import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/feature/auth/models/auth_type.dart';
import 'package:bookia/feature/auth/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/widgets/auth_form.dart';
import 'package:bookia/feature/auth/widgets/auth_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            AuthForm(type: AuthType.register),
            Gap(40),
            Center(
              child: AppMainBottom(onPressed: () {}, text: "Register"),
            ),
            Gap(40),
            AuthSwitcher(type: AuthType.register),
          ],
        ),
      ),
    );
  }
}
