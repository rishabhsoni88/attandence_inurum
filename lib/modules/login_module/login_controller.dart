import 'package:attandenceapp/networking/api_client.dart';
import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/utils/myService.dart';
import 'package:attandenceapp/widgets/mySnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var showLoader = false.obs;
  var showPassword = false.obs;
  //final myService = Get.find<MyService>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> verifyAndLogin() async {
    if (userIdController.text.isEmpty) {
      showSnackbar("Email Required", "Field Cant be empty");
    } else if (passwordController.text.isEmpty) {
      showSnackbar("Password Required", "Field Cant be empty");
    } else if (passwordController.text.length < 8) {
      showSnackbar("Invalid password", "Minimum password length 8 characters");
    } else {
      login(userIdController.text, passwordController.text);
    }
  }

  Future<void> login(userId, password) async {
    showLoader.value = true;
    var apiClient = ApiClient();
    Map<String, dynamic> requestBody = {
      "email": userId,   // Use the correct key expected by the API
      "password": password,
    };
    await apiClient.userLogin(requestBody).then((value) async {
      if (value.success == true) {
        print("Login Successful : ${value.message}");
        showLoader.value = false;
        Get.toNamed(Routes.DASHBOARDPAGE);
      }
      else{
        showLoader.value = false;
        showSnackbar("OOPS", value.message ?? "");
        print("Login Inside Else : ${value.message}");
      }
    }).onError((error, stackTrace) {
      showLoader.value = false;
      showSnackbar("OOPS", error.toString() ?? "");
      print("INSIDE ERROR : ${error.toString()}");
    });
  }

  void changeShowPasswordStatus(){
    showPassword.value = !showPassword.value;
  }
}

// myService.userName.value =
//     (value.data?.firstName != null || value.data?.lastName != null)
//         ? "${value.data?.firstName ?? ""} ${value.data?.lastName ?? ""}"
//             .trim()
//         : "Not Available";
// myService.userEmail.value = value.data?.email ?? "Not Available";
