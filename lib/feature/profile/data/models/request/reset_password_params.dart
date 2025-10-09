import 'package:dio/dio.dart';

class ResetPasswordParams {
  String? currentPassword;
  String? newPassword;
  String? confirmPassword;

  ResetPasswordParams({
    this.currentPassword,
    this.confirmPassword,
    this.newPassword,
  });

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      ResetPasswordParams(
        currentPassword: json['currentPassword'] as String?,
        newPassword: json['newPassword'] as String?,
        confirmPassword: json['confirmPassword'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,
  };

  FormData toFormData() {
    var formData = FormData.fromMap({
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    });
    return formData;
  }
}
