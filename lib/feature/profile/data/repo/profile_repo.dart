import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';

class ProfileRepo {
  Future<ProfileResponse?> showProfile() async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.profile,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<ProfileResponse?> updateProfile() async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.updateProfile,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<ProfileResponse?> changePassword() async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.updatePassword,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
