abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthResendCodeSuccess extends AuthStates {}

class AuthResetPasswordSuccess extends AuthStates {
  final String message;
  AuthResetPasswordSuccess({this.message = "Password reset successfully"});
}

class AuthSuccess extends AuthStates {
  final String message;
  AuthSuccess({this.message = "Success"});
}

class AuthError extends AuthStates {
  AuthError(this.error);
  final String error;
}
