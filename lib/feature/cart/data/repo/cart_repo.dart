import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/cart/data/models/place_order_params.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_response.dart';

class CartRepo {
  static Future<CartResponse?> addToCart({required int productId}) async {
    try {
      log("token ${LocalHelper.getUserData()?.token}");
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.addToCart,
        data: {"product_id": productId},
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart({required int cartItemId}) async {
    try {
      log("$cartItemId -token ${LocalHelper.getUserData()?.token}");
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.removeFromCart,
        data: {"cart_item_id": cartItemId},
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        log(res.data.toString());
        var data = CartResponse.fromJson(res.data);
        // LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> getCart() async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.showCart,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        LocalHelper.setCart(data.data?.cartItems);
        log(res.data.toString());
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      log("$cartItemId -token ${LocalHelper.getUserData()?.token}");

      var res = await DioProvider.post(
        endPoint: ApiEndpoints.updateCart,
        data: {"cart_item_id": cartItemId, "quantity": quantity},
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        log(res.data.toString());
        var data = CartResponse.fromJson(res.data);
        LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        log(res.data.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> checkOut() async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.checkout,
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> placeOrder({
    required PlaceOrderParams placeOrdeParams,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.placeOrder,
        data: placeOrdeParams.toJson(),
        header: {"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
