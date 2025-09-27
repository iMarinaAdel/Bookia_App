import 'package:bookia/feature/cart/data/models/response/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CarStates> {
  CartCubit() : super(CartInitail());
  List<CartItem> cartItems = [];

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
    emit(CartLoading());

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
}
