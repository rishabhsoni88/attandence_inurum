import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message, {Icon? icon}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: themeColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: scaffoldColor,
    duration: const Duration(seconds: 10),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
