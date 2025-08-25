import 'package:box_cricket/app/controllers/user_info_controller.dart';
import 'package:get/get.dart';

class UserInfoBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=> UserInfoController());
  }
}