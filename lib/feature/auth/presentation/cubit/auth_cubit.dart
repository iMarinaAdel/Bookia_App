import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  var formKey = GlobalKey<FormState>();
  var userNameControllar = TextEditingController();
  var emailControllar = TextEditingController();
  var passwordControllar = TextEditingController();
  var passwordConfirmationControllar = TextEditingController();
  var verifyCodeControllar = TextEditingController();

  // Register
  rigester() async {
    var params = AuthParams(
      name: userNameControllar.text,
      email: emailControllar.text,
      password: passwordControllar.text,
      passwordConfirmation: passwordConfirmationControllar.text,
    );
    emit(AuthLoading());

    var response = await AuthRepo.rigester(params);

    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Registration failed, please try again"));
    }
  }

  // Login
  login() async {
    var params = AuthParams(
      email: emailControllar.text,
      password: passwordControllar.text,
    );
    emit(AuthLoading());

    var response = await AuthRepo.login(params);

    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Login failed, please try again"));
    }
  }

  // Forget Password
  forgetPassword() async {
    emit(AuthLoading());
    var params = AuthParams(email: emailControllar.text);

    var response = await AuthRepo.forgetPassword(params);

    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Failed, please try again"));
    }
  }

  checkForgetCode() async {
    emit(AuthLoading());
    var params = AuthParams(
      email: emailControllar.text,
      verifyCode: verifyCodeControllar.text,
    );

    var response = await AuthRepo.oTpVerification(params);

    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Failed, please try again"));
    }
  }

  resetPassword() async {
    emit(AuthLoading());
    var params = AuthParams(
      email: emailControllar.text,
      verifyCode: verifyCodeControllar.text,
      password: passwordControllar.text,
      passwordConfirmation: passwordConfirmationControllar.text,
    );

    var response = await AuthRepo.resetPassword(params);

    if (response != null) {
      emit(AuthResetPasswordSuccess());
    } else {
      emit(AuthError("Failed, please try again"));
    }
  }

  resendVerifyCode() async {
    emit(AuthLoading());
    var params = AuthParams(email: emailControllar.text);

    var response = await AuthRepo.resendVerifyCode(params);

    if (response != null) {
      emit(AuthResendCodeSuccess());
    } else {
      emit(AuthError("Failed, please try again"));
    }
  }
}
