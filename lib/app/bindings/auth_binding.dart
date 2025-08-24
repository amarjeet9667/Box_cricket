import 'package:get/get.dart';
import '../services/api_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService(), fenix: true); 
  }
}
