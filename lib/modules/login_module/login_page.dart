import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/modules/login_module/login_controller.dart';
import 'package:attandenceapp/widgets/gredientText.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appTheme/appColors.dart';
import '../../routes/appPages.dart';

class Login extends GetView<LoginController> {
  Login({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    // var horizontalPadding = MediaQuery.of(context).size.width / 15;
    // var verticalPadding = MediaQuery.of(context).size.height / 50;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 50, horizontal: double.infinity),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("App Logo"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text("Login",
                    style: largeTextBold.copyWith(
                        color: themeColor,
                        fontSize: MediaQuery.of(context).size.height / 30)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey, width: 1)),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextField(
                    controller: controller.userIdController,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 20, maxWidth: 50),
                      suffixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey, width: 1)),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextField(
                    controller: controller.passwordController,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 20, maxWidth: 50),
                      suffixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async{
                        await controller.verifyAndLogin();
                        // Get.toNamed(Routes.BOTTOMNAVIGATION, arguments: "");
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                            ),
                          ],
                          color: themeColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Obx(
                          () => controller.showLoader.value
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                        color: scaffoldColor, strokeWidth: 5),
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Login",
                                        textAlign: TextAlign.center,
                                        style: mediumTextBold.copyWith(
                                            color: mainButtonTextColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.login,
                                      color: mainButtonTextColor,
                                      size: MediaQuery.of(context).size.height /
                                          40,
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text("Forget Password",
                          style: smallTextRegular.copyWith(
                              color: themeColor,
                              fontSize: MediaQuery.of(context).size.height / 55,
                              fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodySmall,
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Don\'t have an account? ',
                            ),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Sign up button clicked");
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => sign_up()),
                                    // );
                                  },
                                text: 'Sign Up',
                                style: smallTextRegular.copyWith(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    fontWeight: FontWeight.w700))
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
