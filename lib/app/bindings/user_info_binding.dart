
import 'package:de_ghuma_ke/app/controllers/user_info_controller.dart';
import 'package:get/get.dart';

class UserInfoBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=> UserInfoController());
  }
}