import 'package:attandenceapp/modules/leave_module/leave_controller.dart';
import 'package:get/get.dart';

class LeaveBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LeaveController>(()=>LeaveController());
  }
}