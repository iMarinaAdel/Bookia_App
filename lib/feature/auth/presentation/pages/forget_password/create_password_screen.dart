import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/auth_types/password_screen_type.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/auth/presentation/widgets/password_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ArrowBack()),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: PasswordFormScreen(type: PasswordScreenType.createNewPassword),
        ),
      ),
    );
  }
}
