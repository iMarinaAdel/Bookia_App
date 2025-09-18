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

  rigester() async {
    var params = AuthParams(
      name: userNameControllar.text,
      email: emailControllar.text,
      password: passwordControllar.text,
      passwordConfirmation: passwordConfirmationControllar.text,
    );
    emit(AuthLoading());
    // call api
    var response = await AuthRepo.rigester(params);
    if (response != null) {
      return emit(AuthSucces());
    } else {
      emit(AuthError("Registration failed"));
    }
  }

  login() async {
    var params = AuthParams(
      email: emailControllar.text,
      password: passwordControllar.text,
    );
    emit(AuthLoading());

    var response = await AuthRepo.login(params);

    if (response != null) {
      if (response.status == 200) {
        emit(AuthSucces());
      } else {
        emit(AuthError(response.message ?? "Login failed"));
      }
    } else {
      emit(AuthError("Login failed, please try again"));
    }
  }
}
