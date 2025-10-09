import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';
import 'package:bookia/feature/profile/data/models/request/reset_password_params.dart';
import 'package:bookia/feature/profile/data/models/request/update.profile.params.dart';

class ProfileRepo {
  static Future<bool> updateProfile(UpdateProfileParams params) async {
    try {
      var res = await DioProvider.post(
        data: params.toFormData(),
        endPoint: ApiEndpoints.updateProfile,
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        LocalHelper.setUserData(data.data);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> changePassword(ResetPasswordParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.updatePassword,
        data: params.toFormData(),
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        LocalHelper.setUserData(data.data);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
