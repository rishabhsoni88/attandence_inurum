import 'package:attandenceapp/data/holiday_response.dart';
import 'package:attandenceapp/networking/api_client.dart';
import 'package:attandenceapp/widgets/mySnackbar.dart';
import 'package:attandenceapp/widgets/sessionExpiryDialogue.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HolidayController extends GetxController {
  var showLoader = false.obs;
  RxList<HolidaysList> holidayList = <HolidaysList>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("Holiday Controller Init Called");
    await getHolidayList();
  }

  Future<void> getHolidayList() async {
    showLoader.value = true;
    var apiClient = ApiClient();
    await apiClient.holidayList().then((value) {
      if (value.status == true) {
        holidayList.value = value.data ?? [];
        showLoader.value = false;
      } else {
        showLoader.value = false;
        showSnackbar('OOPS', value.message ?? '');
      }
    }).onError((error, stackTrace) {
      showLoader.value = false;
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          SessionExpiredDialog.show(Get.context!);
        } else {
          showSnackbar("OOPS", error.toString() ?? "");
        }
      } else {
        showSnackbar("OOPS", error.toString() ?? "");
      }
    });
  }
}
