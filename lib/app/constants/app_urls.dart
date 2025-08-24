class AppUrl {
  // Base URLs (Switch easily between environments)
  static const String baseUrl = "https://api.example.com/"; // Production
  static const String devBaseUrl = "https://dev.api.example.com"; // Development

  // Auth Endpoints
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String logout = "auth/logout";

  // User Endpoints
  static const String getUserProfile = "user/profile";
  static const String updateUserProfile = "user/update";
  
  // Product Endpoints
  static const String getProducts = "products";
  static const String getProductDetails = "products/details";
  
  // Orders Endpoints
  static const String createOrder = "orders/create";
  static const String getOrderHistory = "orders/history";

  // Other endpoints can be added as needed
}
