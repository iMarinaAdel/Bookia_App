import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitail());
  List<Product> products = [];
  getWishList() {
    emit(WishlistLoading());

    WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        products = value.data?.data ?? [];
        emit(WishlistSuccess());
      } else {
        emit(WishlistError(message: 'Something went wrong'));
      }
    });
  }
}
