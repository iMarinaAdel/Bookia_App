class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSucces extends AuthStates {}

class AuthError extends AuthStates {
  AuthError(this.erroe);
  final String erroe;
}
