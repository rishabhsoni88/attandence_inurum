import 'package:attandenceapp/modules/login_module/login_page.dart';
import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/utils/myService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xffFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
      getPages: AppPages.pages,
      initialBinding: BindingsBuilder(() {
        Get.put(MyService());
      }),
    );
  }
}