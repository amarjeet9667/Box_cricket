
import 'package:box_cricket/app/bindings/user_info_binding.dart';
import 'package:box_cricket/app/views/splash_view.dart';
import 'package:box_cricket/app/views/user_info_view.dart';
import 'package:get/get.dart';
import '../views/home_view.dart';
import '../bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    // Splash
    GetPage(
      name: AppRoutes.splash, 
      page: () => SplashView()), 
    
    // Home
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    // UserInfo
    GetPage(
      name: AppRoutes.userInfo,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
  ];
}
