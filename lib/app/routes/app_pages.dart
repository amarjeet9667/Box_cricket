
import 'package:box_cricket/app/views/splash_view.dart';
import 'package:get/get.dart';
import '../views/home_view.dart';
import '../bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash, 
      page: () => SplashView()), // Splash
    
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
