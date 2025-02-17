import 'package:attandenceapp/bottomNavigation.dart';
import 'package:attandenceapp/modules/dashboard_module/dashboard_bindings.dart';
import 'package:attandenceapp/modules/dashboard_module/dashboard_page.dart';
import 'package:attandenceapp/modules/forget_module/forget_bindings.dart';
import 'package:attandenceapp/modules/forget_module/forget_page.dart';
import 'package:attandenceapp/modules/holiday_module/holiday_bindings.dart';
import 'package:attandenceapp/modules/holiday_module/holiday_page.dart';
import 'package:attandenceapp/modules/leave_module/leave_bindings.dart';
import 'package:attandenceapp/modules/leave_module/leave_page.dart';
import 'package:attandenceapp/modules/login_module/login_bindings.dart';
import 'package:attandenceapp/modules/login_module/login_page.dart';
import 'package:attandenceapp/modules/profile_module/profile_bindings.dart';
import 'package:attandenceapp/modules/profile_module/profile_page.dart';
import 'package:get/get.dart';

part './appRoutes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DASHBOARDPAGE,
      page: () => DashBoardScreen(),
      binding: DashBoardBindings(),
    ),
    GetPage(
      name: Routes.HOLIDAYPAGE,
      page: () => HolidayPage(),
      binding: HolidayBindings(),
    ),
    GetPage(
      name: Routes.LEAVEPAGE,
      page: () => LeavePage(),
      binding: LeaveBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.FORGET,
      page: () => ForgetPage(),
      binding: ForgetBindings(),
    ),
    GetPage(
      name: Routes.BOTTOMNAVIGATION,
      page: () => BottomNavigation(),
    ),
    GetPage(
      name: Routes.PROFILEPAGE,
      page: () => ProfilePage(),
      binding: ProfileBindings(),
    ),
  ];
}
