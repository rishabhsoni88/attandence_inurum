import 'package:attandenceapp/data/user_data_response.dart';
import 'package:attandenceapp/networking/api_client.dart';
import 'package:attandenceapp/utils/shared_preference_helper.dart';
import 'package:attandenceapp/widgets/mySnackbar.dart';
import 'package:attandenceapp/widgets/sessionExpiryDialogue.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  Rx<UserDataResponse> userDetails = UserDataResponse().obs;
  var showLoader = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("Profile Controller Init Called");
    await getUserDetails();
    print("checking on controller ${userDetails.value}");
  }

  Future<void> getUserDetails() async {
    showLoader.value = true;
    var apiClient = ApiClient();
    int? userId = await SharedPrefsHelper.getUserId();
    await apiClient.userData(userId).then((value) {
      if (value.status == true) {
        print("User Details : ${value.data}");
        userDetails.value = value;
        showLoader.value = false;
      } else {
        print("Api Response Error: $value");
        showLoader.value = false;
        showSnackbar('OOPS', value.message ?? '');
      }
    }).onError((error, stackTrace) {
      showLoader.value = false;
      print("Api Error: $error");
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          SessionExpiredDialog.show(Get.context!);
        } else {
          showSnackbar("OOPS", error.toString());
        }
      } else {
        showSnackbar("OOPS", error.toString());
      }
    });
  }
}
