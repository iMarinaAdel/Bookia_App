class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class AddRemoveToWishListSuccess extends HomeState {
  String? message;
  AddRemoveToWishListSuccess({this.message});
}

class HomeErrorState extends HomeState {
  final String? message;
  HomeErrorState(this.message);
}
