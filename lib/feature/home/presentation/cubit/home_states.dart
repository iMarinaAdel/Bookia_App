class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class CartWishListSuccess extends HomeState {
  String? message;
  CartWishListSuccess({this.message});
}

class HomeErrorState extends HomeState {
  final String? message;
  HomeErrorState(this.message);
}
