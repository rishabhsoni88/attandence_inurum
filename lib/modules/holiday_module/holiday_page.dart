import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/modules/holiday_module/holiday_controller.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:attandenceapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HolidayPage extends GetView<HolidayController> {
  HolidayPage({super.key});

  final HolidayController controller = Get.put(HolidayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldColor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text("Holidays",
                style: mediumTextBold.copyWith(color: appBarTitleTextColor)),
          ),
        ),
        body: Obx(() => controller.showLoader.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: themeColor,
                  strokeWidth: 5,
                ),
              )
            : ListView.builder(
                itemCount: controller.holidayList.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: scaffoldColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: boxShadowColor, blurRadius: 5)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                gradient: holidayCard,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing:
                                      MediaQuery.of(context).size.height / 75,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: scaffoldColor,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Image.asset(
                                        "assets/images/calenderIcon.png",
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    Text(
                                        controller.holidayList[index].date
                                            .toCustomDate(),
                                        style: smallTextRegular.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: scaffoldColor)),
                                  ],
                                ),
                                Text("Thursday",
                                    style: smallTextRegular.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: boxShadowColor)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                controller.holidayList[index].holidayName ??
                                    notAvailable,
                                style: largeTextBold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                          // Text(controller.holidayList[index].date ??
                          //     notAvailable),
                        ],
                      ),
                    ),
                  );
                },
              )));
  }
}
