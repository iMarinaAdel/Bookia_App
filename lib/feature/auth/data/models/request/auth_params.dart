class AuthParams {
  AuthParams({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.verifyCode,
  });
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? verifyCode;

  Map<String, dynamic> toJson({bool isReset = false}) {
    final data = <String, dynamic>{};

    if (name != null) data["name"] = name;
    if (email != null) data["email"] = email;
    if (password != null) {
      if (isReset) {
        data["new_password"] = password;
      } else {
        data["password"] = password;
      }
    }
    if (passwordConfirmation != null) {
      if (isReset) {
        data["new_password_confirmation"] = passwordConfirmation;
      } else {
        data["password_confirmation"] = passwordConfirmation;
      }
    }
    if (verifyCode != null) data["verify_code"] = verifyCode;

    return data;
  }
}
