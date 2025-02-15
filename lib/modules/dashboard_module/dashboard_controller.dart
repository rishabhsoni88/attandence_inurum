import 'package:attandenceapp/data/attendance_response.dart';
import 'package:attandenceapp/data/user_data_response.dart';
import 'package:attandenceapp/networking/api_client.dart';
import 'package:attandenceapp/utils/shared_preference_helper.dart';
import 'package:attandenceapp/widgets/mySnackbar.dart';
import 'package:attandenceapp/widgets/sessionExpiryDialogue.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashBoardController extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  var showLoader = false.obs;
  Rx<AttendanceResponse> attendanceDetails = AttendanceResponse().obs;
  Rx<UserDataResponse> userDetails = UserDataResponse().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("DashBoard Controller Init Called");
    await getAttendenceData();
    //await getUserDetails();
    print("checking on controller ${attendanceDetails.value}");
  }

  Future<void> getAttendenceData() async {
    showLoader.value = true;
    var apiClient = ApiClient();
    await apiClient.attandenceData().then((value) {
      if (value.status == true) {
        print("Attendance Data: ${value.data}");
        attendanceDetails.value = value;
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
