import 'package:flutter/material.dart';

class SessionExpiredDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,  // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Session Expired"),
          content: Text("Your session has expired. Please log in again."),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  // Future.delayed(const Duration(milliseconds: 100),() async => await UserPref()
                  //     .deleteUserDetails(),);
                 // Get.offAllNamed(Routes.WELCOME);
                },
                child: Text(
                  "Go to Login",
                  //style: textFieldSearchTextStyle.copyWith(color: whiteColor),
                )),
          ],
        );
      },
    );
  }
}