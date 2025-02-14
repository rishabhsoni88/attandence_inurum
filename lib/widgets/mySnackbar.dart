import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message, {Icon? icon}) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(Icons.person),
    snackPosition: SnackPosition.BOTTOM,
    // backgroundColor: customerNameBlackColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    // colorText: whiteColor,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    // dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
