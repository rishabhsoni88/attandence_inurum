import 'package:attandenceapp/modules/forget_module/forget_controller.dart';
import 'package:get/get.dart';

class ForgetBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ForgetController>(()=>ForgetController());
  }
}