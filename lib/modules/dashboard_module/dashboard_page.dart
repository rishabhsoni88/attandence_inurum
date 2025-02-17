import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/modules/dashboard_module/dashboard_controller.dart';
import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:attandenceapp/widgets/activityChip.dart';
import 'package:attandenceapp/widgets/customCalender.dart';
import 'package:attandenceapp/widgets/progress_indicator.dart';
import 'package:attandenceapp/widgets/squareCards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class DashBoardScreen extends GetView<DashBoardController> {
  DashBoardScreen({super.key});

  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Get.toNamed(Routes.LOGIN);
          return false;
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: themeColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/images/profileImage.jpg",
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 8,
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Michael Mitc",
                          style: mediumTextBold,
                        ),
                        Text(
                          "App Developer",
                          style: smallTextRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomCalender(
                selectedDay: controller.selectedDay,
                focusedDay: controller.focusedDay,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today Attendance",
                      style: mediumTextBold.copyWith(color: cardBodyTextColor),
                    ),
                    10.kh,
                    Obx(
                      () => controller.showLoader.value
                          ? Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 5,
                                color: themeColor,
                              ),
                          )
                          : GridView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Two items per row
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio:
                                    1.90, // Adjust this based on your UI
                              ),
                              children: [
                                Obx(
                                  () => SquareCards(
                                    cardIcon: Icons.arrow_forward,
                                    cardTitle: "Check In",
                                    cardBody: (controller.attendanceDetails
                                                .value.data?.checkInTime !=
                                            null)
                                        ? controller.attendanceDetails.value
                                            .data!.checkInTime
                                            .toFormattedDateTime()
                                            .toString()
                                        : "N/A",
                                    cardDescription: "On Time",
                                  ),
                                ),
                                Obx(() => SquareCards(
                                      cardIcon: Icons.arrow_back,
                                      cardTitle: "Check Out",
                                      cardBody: (controller.attendanceDetails
                                                  .value.data?.checkOutTime !=
                                              null)
                                          ? controller.attendanceDetails.value
                                              .data!.checkOutTime
                                              .toFormattedDateTime()
                                              .toString()
                                          : "N/A",
                                      cardDescription: "Go Home",
                                    )),
                                Obx(
                                  () => SquareCards(
                                    cardIcon: Icons.coffee,
                                    cardTitle: "Break Time",
                                    cardBody: (controller.attendanceDetails
                                                .value.data?.breakTime !=
                                            null)
                                        ? "${controller.attendanceDetails.value.data!.breakTime} min"
                                        : "N/A",
                                    cardDescription: "Avg Time 30 min",
                                  ),
                                ),
                                Obx(
                                  () => SquareCards(
                                    cardIcon: Icons.watch_later,
                                    cardTitle: "Working Hours",
                                    cardBody: (controller
                                                .attendanceDetails
                                                .value
                                                .data
                                                ?.totalWorkingHours !=
                                            null)
                                        ? "${(controller.attendanceDetails.value.data!.totalWorkingHours! / 60).toInt()} Hours"
                                        : "N/A",
                                    cardDescription: "Working Hours",
                                  ),
                                ),
                              ],
                            ),
                    ),
                    20.kh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Activity",
                          style:
                              mediumTextBold.copyWith(color: cardBodyTextColor),
                        ),
                        Text(
                          "View All",
                          style: mediumTextBold.copyWith(color: themeColor),
                        )
                      ],
                    ),
                    10.kh,
                    ActivityChip(),
                    10.kh,
                    ActivityChip(),
                    10.kh,
                    ActivityChip(),
                    10.kh,
                    ActivityChip(),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
