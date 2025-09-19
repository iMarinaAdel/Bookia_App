import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/models/response/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> rigester(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        // success
        // data as json
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        // success
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.forgetPass,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        // success
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> oTpVerification(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.checkForgetCode,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        // success
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> resetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.resetPassword,
        data: params.toJson(isReset: true),
      );
      if (res.statusCode == 200) {
        // success
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> resendVerifyCode(AuthParams params) async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.resendverifyCode,
        params: params.toJson(),
      );
      if (res.statusCode == 200) {
        // success
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
