class WishlistStates {}

class WishlistInitail extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistSuccess extends WishlistStates {}

class AddToCartSuccess extends WishlistStates {
  final String? message;
  AddToCartSuccess({this.message});
}

class WishlistError extends WishlistStates {
  final String message;
  WishlistError({required this.message});
}
