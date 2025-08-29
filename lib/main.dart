import 'package:box_cricket/app/themes/app_theme.dart';
import 'package:box_cricket/app/themes/dark_theme.dart';
import 'package:box_cricket/app/themes/light_theme.dart';
import 'package:box_cricket/app/utils/network_checker.dart';
import 'package:box_cricket/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(ThemeController());
  Get.put(NetworkChecker());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter GetX MVC",
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,

          // ✅ Theme settings
          theme: LightTheme.theme,
          darkTheme: DarkTheme.theme,
          themeMode: themeController.theme, 
        ));
  }
}
