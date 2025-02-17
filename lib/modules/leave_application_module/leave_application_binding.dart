import 'package:attandenceapp/modules/leave_application_module/leave_application_controller.dart';
import 'package:attandenceapp/modules/leave_module/leave_controller.dart';
import 'package:get/get.dart';

class LeaveApplicationBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LeaveApplicationController>(()=>LeaveApplicationController());
  }
}