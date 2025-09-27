import 'dart:developer';

import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/book_list_respose.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/data/models/response/slider_response/slider.dart';
import 'package:bookia/feature/home/data/models/response/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Product> bestSeller = [];
  List<Product> allProduct = [];
  List<Product> newArrvils = [];
  List<SliderModel> sliders = [];

  Future<void> getHomeData() async {
    try {
      emit(HomeLoadingState());
      // call api
      var res = await Future.wait([
        HomeRepo.getSlider(),
        HomeRepo.getAllProduct(),
        HomeRepo.getBestSeller(),
        HomeRepo.getNewArrivals(),
      ]);
      sliders = (res[0] as SliderResponse).data?.sliders ?? [];
      allProduct = (res[1] as BookListRespose).data?.products ?? [];
      bestSeller = (res[2] as BookListRespose).data?.products ?? [];
      newArrvils = (res[3] as BookListRespose).data?.products ?? [];

      emit(HomeLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState(e.toString()));
    }
  }

  addRemoveToWishlist(int productId) async {
    emit(HomeLoadingState());

    if (isWishlist(productId)) {
      var data = await WishlistRepo.removeFromWishlist(productId: productId);
      if (data != null) {
        emit(CartWishListSuccess(message: 'Removed from wishlist'));
      } else {
        emit(HomeErrorState("Something went wrong"));
      }
    } else {
      var data = await WishlistRepo.addToWishList(productId: productId);
      if (data != null) {
        emit(CartWishListSuccess(message: 'Added to wishlist'));
      } else {
        emit(HomeErrorState("Something went wrong"));
      }
    }
  }

  addToCart(int productId) async {
    var data = await CartRepo.addToCart(productId: productId);
    if (data != null) {
      emit(CartWishListSuccess(message: "Added to cart successfully"));
    } else {
      emit(HomeErrorState('Something went wrong'));
    }
  }

  bool isWishlist(int productId) {
    var wishlist = LocalHelper.getWishlist();
    if (wishlist != null) {
      return wishlist.any((element) => element.id == productId);
    } else {
      return false;
    }
  }
}
