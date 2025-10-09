import 'dart:developer';

import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/cart/data/models/place_order_params.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CarStates> {
  CartCubit() : super(CartInitail());
  List<CartItem> cartItems = [];
  CartResponse? cartResponse;
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var governoratecontroller = TextEditingController();
  int selectedGovernorateId = -1;

  initData() {
    var userData = LocalHelper.getUserData();
    namecontroller.text = userData?.name ?? "";
    emailcontroller.text = userData?.email ?? "";
    phonecontroller.text = userData?.phone ?? "";
    addresscontroller.text = userData?.address ?? "";
    governoratecontroller.text = "";
  }

  getCart() {
    emit(CartLoading());

    CartRepo.getCart().then((value) {
      if (value != null) {
        cartItems = value.data?.cartItems ?? [];
        emit(CartSuccess());
      } else {
        emit(CartError(message: 'Something went wrong'));
      }
    });
  }

  removeFromCart(int cartItemId) {
    log(cartItemId.toString());
    emit(CartLoading());

    CartRepo.removeFromCart(cartItemId: cartItemId).then((value) {
      if (value != null) {
        cartItems = value.data?.cartItems ?? [];
        emit(CartSuccess());
      } else {
        emit(CartError(message: 'Something went wrong'));
      }
    });
  }

  updateCart(int cartItemId, int quantity) {
    final index = cartItems.indexWhere((item) => item.itemId == cartItemId);
    if (index != -1) {
      cartItems[index].itemQuantity = quantity;
      emit(CartSuccess());
    }

    CartRepo.updateCart(cartItemId: cartItemId, quantity: quantity).then((
      value,
    ) {
      if (value != null) {
        cartItems = value.data?.cartItems ?? [];
        emit(CartSuccess());
      } else {
        emit(CartError(message: 'Something went wrong'));
      }
    });
  }

  checkout() {
    emit(CartLoading());
    CartRepo.checkOut().then((value) {
      if (value) {
        emit(CartSuccess());
      } else {
        emit(CartError(message: 'Something went wrong'));
      }
    });
  }

  palceOrder() {
    emit(CartLoading());
    var params = PlaceOrderParams(
      name: namecontroller.text,
      phone: phonecontroller.text,
      email: emailcontroller.text,
      address: addresscontroller.text,
    );
    CartRepo.placeOrder(placeOrdeParams: params).then((value) {
      if (value) {
        emit(CartSuccess());
      } else {
        emit(CartError(message: 'Something went wrong'));
      }
    });
  }
}
