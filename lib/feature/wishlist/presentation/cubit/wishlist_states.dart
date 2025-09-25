class WishlistStates {}

class WishlistInitail extends WishlistStates {}

class WishlistLoading extends WishlistStates {}

class WishlistSuccess extends WishlistStates {}

class WishlistError extends WishlistStates {
final  String message;
  WishlistError({required this.message});
}
