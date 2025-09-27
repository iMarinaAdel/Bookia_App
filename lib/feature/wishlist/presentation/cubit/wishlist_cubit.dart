import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitail());
  List<Product> products = [];

  getWishList() async {
    emit(WishlistLoadingState());
    await WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        products = value.data?.data ?? [];
        emit(WishlistSuccess());
      } else {
        emit(WishlistError(message: 'Something went wrong'));
      }
    });
  }

  removeWishList(int productId) {
    emit(WishlistLoadingState());

    WishlistRepo.removeFromWishlist(productId: productId).then((value) {
      if (value != null) {
        products = value.data?.data ?? [];
        emit(WishlistSuccess());
      } else {
        emit(WishlistError(message: 'Something went wrong'));
      }
    });
  }

  addToCart(int productId) async {
    var data = await CartRepo.addToCart(productId: productId);
    if (data != null) {
      var res = await WishlistRepo.removeFromWishlist(productId: productId);
      if (res != null) {
        products = res.data?.data ?? [];
      }
      emit(AddToCartSuccess(message: "Added to cart successfully"));
    } else {
      emit(WishlistError(message: 'Something went wrong'));
    }
  }
}
