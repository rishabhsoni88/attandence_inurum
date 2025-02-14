import 'package:attandenceapp/modules/holiday_module/holiday_controller.dart';
import 'package:get/get.dart';

class HolidayBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HolidayController>(()=>HolidayController(),fenix: true);
  }
}