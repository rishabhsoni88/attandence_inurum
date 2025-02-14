import 'package:attandenceapp/modules/dashboard_module/dashboard_controller.dart';
import 'package:attandenceapp/modules/holiday_module/holiday_controller.dart';
import 'package:get/get.dart';

class DashBoardBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<DashBoardController>(()=>DashBoardController(),fenix: true);
  }
}