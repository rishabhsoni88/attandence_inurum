import 'package:attandenceapp/networking/api_client.dart';
import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/widgets/mySnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  String? emailError;
  var showLoader = false.obs;

  // Regular expression for email validation
  final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  // Method to validate email
  bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  Future<void> verifyEmail(BuildContext context) async {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      emailError = 'Email cannot be empty';
    } else if (!isValidEmail(email)) {
      emailError = 'Please enter a valid email address';
    } else {
      emailError = null;
      await forgetUserPassword(email);
    }
    // Trigger a rebuild to show error message (if any)
    (context as Element).markNeedsBuild();
  }

  Future<void> forgetUserPassword(String email) async {
    showLoader.value = true;
    print("forget password method called");
    var apiClient = ApiClient();
    Map<String, dynamic> requestBody = {
      "email": email,
    };
    await apiClient.forgetPassword(requestBody).then((value) async {
      if (value.status = true) {
        showSnackbar('Success', 'Reset password link sent to $email');
        print("Password Reset Link Send Successfully : ${value.message}");
        showLoader.value = false;
        Get.toNamed(Routes.LOGIN);
      } else {
        showLoader.value = false;
        showSnackbar("OOPS", value.message ?? "");
        print("forgetPassword Inside Else : ${value.message}");
      }
    }).onError((error, stackTrace) {
      showLoader.value = false;
      showSnackbar("OOPS", error.toString() ?? "");
      print("INSIDE ERROR : ${error.toString()}");
    });
  }
}
