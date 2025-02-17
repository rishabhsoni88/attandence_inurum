import 'package:attandenceapp/routes/appPages.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:attandenceapp/widgets/leaveRecordCard.dart';
import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/widgets/leaveCards.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldColor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text("All Leaves",
                style: mediumTextBold.copyWith(color: appBarTitleTextColor)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: themeColor,
            child: Icon(
              Icons.add,
              color: scaffoldColor,
            ),
            onPressed: () {
              Get.toNamed(Routes.LEAVEAPPLICATIONPAGE, arguments: "");
            }),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LeaveCards(
                          headerColor: leaveBalance,
                          headerTextColor: headerTextColor,
                          cardIcon: Icons.event_available,
                          cardTitle: "Leave Balance",
                          cardBody: "20"),
                    ),
                    5.kw,
                    Expanded(
                      child: LeaveCards(
                          headerColor: leaveApproved,
                          headerTextColor: headerTextColor,
                          cardIcon: Icons.event_available,
                          cardTitle: "Leave Approved",
                          cardBody: "2"),
                    ),
                  ],
                ),
                10.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LeaveCards(
                          headerColor: leavePending,
                          headerTextColor: headerTextColor,
                          cardIcon: Icons.event_available,
                          cardTitle: "Leave Pending",
                          cardBody: "4"),
                    ),
                    5.kw,
                    Expanded(
                      child: LeaveCards(
                          headerColor: leaveCancelled,
                          headerTextColor: headerTextColor,
                          cardIcon: Icons.event_available,
                          cardTitle: "Leave Cancelled",
                          cardBody: "10"),
                    )
                  ],
                ),
                25.kh,
                Text(
                  "Leave Record",
                  style: mediumTextBold.copyWith(color: cardBodyTextColor),
                ),
                10.kh,
                LeaveRecordCard(),
                10.kh,
                LeaveRecordCard(),
                10.kh,
                LeaveRecordCard(),
              ],
            ),
          ),
        ));
  }
}
