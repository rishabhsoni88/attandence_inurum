import 'package:attandenceapp/modules/dashboard_module/dashboard_page.dart';
import 'package:attandenceapp/modules/holiday_module/holiday_page.dart';
import 'package:attandenceapp/modules/leave_module/leave_page.dart';
import 'package:attandenceapp/modules/profile_module/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentIndex = 0.obs;
  final List<Widget> _screens = [
    DashBoardScreen(),
    LeavePage(),
    HolidayPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return _screens[_currentIndex.value];
        }),
        bottomNavigationBar: Obx((){
          return BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white, // Color for selected item
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.blue,
            currentIndex: _currentIndex.value,
            onTap: (index){
              _currentIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: "Leaves",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.beach_access),
                label: "Holiday",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Profile",
              ),
            ],
          );
        })
    );
  }
}
