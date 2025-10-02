class ApiEndpoints {
  static const String baseUrl = "https://codingarabic.online/api";
  // auth
  static const String register = "/register";
  static const String login = "/login";
  static const String forgetPass = "/forget-password";
  static const String checkForgetCode = "/check-forget-password";
  static const String resetPassword = "/reset-password";
  static const String resendverifyCode = "/resend-verify-code";

  //home
  static const String slider = "/sliders";
  static const String bsetSeller = "/products-bestseller";
  static const String newArrivals = "/products-new-arrivals";
  static const String allProducts = "/products";

  // search
  static const String search = "/products-search?name=aqaaaq";
  // wishlist
  static const String wishlist = "/wishlist";
  static const String addToWishlist = "/add-to-wishlist";
  static const String removeFromWishlist = "/remove-from-wishlist";

  // cart
  static const String showCart = "/cart";
  static const String addToCart = "/add-to-cart";
  static const String removeFromCart = "/remove-from-cart";
  static const String updateCart = "/update-cart";

  //checkOut
  static const String checkout = "/checkout";
  static const String placeOrder = "/place-order";

  //profile
  static const String profile = "/profile";
  static const String updateProfile = "/update-profile";
  static const String updatePassword = "/update-password";
}
