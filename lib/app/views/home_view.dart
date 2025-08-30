
import 'package:de_ghuma_ke/app/constants/app_sizes.dart';
import 'package:de_ghuma_ke/app/themes/app_theme.dart';
import 'package:de_ghuma_ke/app/views/home_view_mob.dart';
import 'package:de_ghuma_ke/app/views/home_view_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ThemeController themeController = Get.find<ThemeController>();

  HomeView({super.key}); 

  @override
  Widget build(BuildContext context) {
    
    if(context.width > screenWidth){
    return WebHomeView(controller: controller);
    }else{
      return MobHomeView(controller: controller);
    }
  }
}
