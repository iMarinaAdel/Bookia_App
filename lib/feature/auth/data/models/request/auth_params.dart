class AuthParams {
  AuthParams({this.name, this.email, this.password, this.passwordConfirmation});

  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
  }
}
