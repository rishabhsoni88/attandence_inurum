import 'package:attandenceapp/modules/login_module/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LoginController>(()=>LoginController());
  }
}