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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: scaffoldColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: boxShadowColor, blurRadius: 5)
                          ]),
                      child: Column(
                        spacing: MediaQuery.of(context).size.height / 95,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing:
                                    MediaQuery.of(context).size.height / 75,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size:
                                        MediaQuery.of(context).size.height / 35,
                                    color: cardDescriptionTextColor,
                                  ),
                                  Text(controller.holidayList[index].date.toCustomDate(),
                                      style: smallTextRegular.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              55,
                                          color: cardDescriptionTextColor)),
                                ],
                              ),
                              Text("Thursday",
                                  style: smallTextRegular.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: boxShadowColor)),
                            ],
                          ),
                          Text(controller.holidayList[index].holidayName ??
                              notAvailable,style: largeTextBold.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context)
                                  .size
                                  .height /
                                  45,
                              color: cardDescriptionTextColor)),
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
