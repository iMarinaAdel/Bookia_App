import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/wishlist/data/models/response/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<WishlistResponse?> addToWishList({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.addToWishlist,
        data: {"product_id": productId},
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishlistResponse?> removeFromWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.removeFromWishlist,
        data: {"product_id": productId},
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishlistResponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.wishlist,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
