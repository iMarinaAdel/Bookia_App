import 'package:bookia/feature/auth/presentation/models/password_screen_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/password_form_screen.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: PasswordFormScreen(type: PasswordScreenType.createNewPassword),
      ),
    );
  }
}
