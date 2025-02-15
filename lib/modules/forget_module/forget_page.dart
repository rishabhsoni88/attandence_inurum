import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/modules/forget_module/forget_controller.dart';
import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPage extends GetView<ForgetController> {
  ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Get.toNamed(Routes.LOGIN);
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 200.0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reset\nPasswords",
                    style: mediumTextBold.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textFieldTextColor,
                      fontSize: 25,
                    ),
                  ),
                  10.kh,
                  Text(
                    "Please enter your email address\nto request a password reset.",
                    style: smallTextRegular.copyWith(
                      height: 1,
                      fontWeight: FontWeight.w200,
                      color: textFieldTextColor,
                      fontSize: 17,
                    ),
                  ),
                  50.kh,
                  Text(
                    "Email",
                    style: mediumTextBold.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textFieldTextColor,
                      fontSize: 17,
                    ),
                  ),
                  10.kh,
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: boxShadowColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: controller.emailError == null &&
                                  controller.isValidEmail(
                                      controller.emailController.text)
                              ? Colors.green
                              : boxShadowColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: controller.emailError == null &&
                                  controller.isValidEmail(
                                      controller.emailController.text)
                              ? Colors.green
                              : themeColor,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      errorText: controller
                          .emailError, // Display error message if exists
                    ),
                  ),
                  50.kh,
                  InkWell(
                    onTap: () {
                      controller.verifyEmail(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: themeColor,
                        boxShadow: [
                          BoxShadow(
                            color: boxShadowColor,
                            blurRadius: 3.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Obx(
                        () => controller.showLoader.value
                            ? Center(
                                // Ensure it doesn't stretch
                                child: SizedBox(
                                  height: 20, // Set a fixed size
                                  width: 20, // Set a fixed size
                                  child: CircularProgressIndicator(
                                    color: scaffoldColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Send Reset Password",
                                  style: mediumTextBold.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: scaffoldColor,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
