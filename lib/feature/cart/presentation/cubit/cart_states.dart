class CarStates {}

class CartInitail extends CarStates {}

class CartLoading extends CarStates {}

class CartSuccess extends CarStates {}

class CartError extends CarStates {
  final String message;
  CartError({required this.message});
}
