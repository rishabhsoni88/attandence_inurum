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
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: themeColor,
            colorScheme: ColorScheme.light(primary: themeColor),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: themeColor),
            ),
            textTheme: TextTheme(
              headlineLarge: largeTextBold,
              titleLarge: largeTextBold,
              labelSmall: largeTextBold,
              bodySmall: smallTextRegular,
              titleMedium: largeTextBold,
            ),
          ),
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            child: Container(
              width: 300,  // Set width
              height: 500, // Set height
              child: child, // DatePicker widget
            ),
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  final List<String> items = [
    'Sick Leave',
    'Annual Leave/Vacation Leave',
    'Study/Education Leave',
    'Casual Leave',
    'Maternity Leave',
    'Paternity Leave',
    'Bereavement Leave',
    'Unpaid Leave',
  ];
  RxString selectedValue = "".obs; // Observable variable

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
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    content: Builder(builder: (context) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: scaffoldColor,
                            boxShadow: [
                              BoxShadow(
                                color: boxShadowColor,
                                blurRadius: 5,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add New Leave Request",
                                style: mediumTextBold.copyWith(
                                    color: appBarTitleTextColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                              Divider(
                                color: boxShadowColor,
                              ),
                              Text(
                                fromDate == null || toDate == null
                                    ? "Select leave duration"
                                    : "Selected Range:\n ${fromDate!.toLocal()} ➡ ${toDate!.toLocal()}",
                                textAlign: TextAlign.center,
                                style: mediumTextBold.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 55,
                                    color: dullBlackColor),
                              ),
                              15.kh,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 7),
                                          backgroundColor: themeColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () =>
                                          _selectDate(context, true),
                                      child: Text(
                                        fromDate == null
                                            ? "Select From Date"
                                            : "From: ${fromDate!.toLocal()}"
                                                .split(' ')[0],
                                        style: mediumTextBold.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                70),
                                      ),
                                    ),
                                  ),
                                  10.kw,
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 7),
                                          backgroundColor: themeColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () =>
                                          _selectDate(context, false),
                                      child: Text(
                                        toDate == null
                                            ? "Select To Date"
                                            : "To: ${toDate!.toLocal()}"
                                                .split(' ')[0],
                                        style: mediumTextBold.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                70),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              10.kh,
                              Text(
                                "Leave Type:",
                                style: mediumTextBold.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 55,
                                    color: dullBlackColor),
                              ),
                             10.kh,
                              Obx(() => DropdownButton2<String>(
                                    underline: SizedBox(),
                                    // autofocus: false,
                                    isExpanded: true,
                                    hint: Text(
                                      "Select",
                                      style: mediumTextBold.copyWith(
                                          fontWeight: FontWeight.w200,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              55,
                                          color: dullBlackColor),
                                    ),
                                    value: items.contains(selectedValue
                                            .value) // ✅ Check if value exists
                                        ? selectedValue.value
                                        : null,
                                    // Observed value
                                    items: items.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: mediumTextBold.copyWith(
                                              fontWeight: FontWeight.w100,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55,
                                              color: dullBlackColor),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        selectedValue.value = newValue;
                                        print(
                                            "Selected: $newValue"); // Debugging
                                      }
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      elevation: 0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      decoration: BoxDecoration(
                                        // border: Border.all(color: boxShadowColor),
                                        boxShadow: [
                                          BoxShadow(
                                              color: boxShadowColor,
                                              blurRadius: 5)
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Colors.white,
                                      ),
                                    ),
                                    dropdownStyleData: const DropdownStyleData(
                                      maxHeight: 200,
                                      isOverButton: true,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Colors.white,
                                        // gradient: leaveBalance
                                      ),
                                    ),
                                  )),
                              10.kh,
                              TextField(
                                decoration: InputDecoration(
                                  label: Text(
                                    "Reason of leave:",
                                    style: mediumTextBold.copyWith(
                                        fontWeight: FontWeight.w200,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                55,
                                        color: dullBlackColor),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: scaffoldColor,
          ),
        ),
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
