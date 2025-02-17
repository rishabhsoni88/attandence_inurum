import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({super.key});

  @override
  State<LeaveApplication> createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
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
              width: 350, // Set width
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
          fromDateController.text = pickedDate.toIso8601String().toCustomDate();
          fromDate = pickedDate;
        } else {
          toDateController.text = pickedDate.toIso8601String().toCustomDate();
          toDate = pickedDate;
        }
      });
    }
  }

  final List<String> leaveDuration = [
    'Custom Hours',
    'Half Day',
    'Full Day',
  ];
  RxString selectedLeaveDuration = "".obs; // Observable variable

  final List<String> leaveTypes = [
    'Sick Leave',
    'Annual Leave/Vacation Leave',
    'Study/Education Leave',
    'Casual Leave',
    'Maternity Leave',
    'Paternity Leave',
    'Bereavement Leave',
    'Unpaid Leave',
  ];
  RxString selectedLeaveType = "".obs; // Observable variable

  final List<String> leaveApprovalManagers = [
    'Shubham Sir',
    'Dheeraj Sir',
    'Kamlesh Sir',
  ];

  RxString selectedManagerName = "".obs; // Observable variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Text("Leave Application",
              style: mediumTextBold.copyWith(color: appBarTitleTextColor)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.kh,
              Text(
                "Leave Duration Selection",
                textAlign: TextAlign.center,
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
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
                      fontSize: MediaQuery.of(context).size.height / 55,
                      color: boxShadowColor),
                ),
                value: leaveDuration.contains(
                    selectedLeaveDuration.value) // ✅ Check if value exists
                    ? selectedLeaveDuration.value
                    : null,
                // Observed value
                items: leaveDuration.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                        item,
                        style: mediumTextBold.copyWith(
                            color: dullBlackColor.withAlpha(200),
                            fontWeight: FontWeight.w200,
                            fontSize: 15)
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedLeaveDuration.value = newValue;
                  }
                },
                buttonStyleData: ButtonStyleData(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 2.5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: boxShadowColor, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: boxShadowColor,width: 1),
                    color: Colors.white,
                  ),
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  isOverButton: true,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    // gradient: leaveBalance
                  ),
                ),
              )),
              10.kh,
        
              Text(
                "From",
                textAlign: TextAlign.center,
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: dullBlackColor),
              ),
              10.kh,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: scaffoldColor,
                  boxShadow: [
                    BoxShadow(
                      color: boxShadowColor,
                      blurRadius: 5
                    )
                  ]
                ),
                child: TextField(
                  style: mediumTextBold.copyWith(
                    color: themeColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 15),
                  controller: fromDateController,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => _selectDate(context, true),
                          child: Icon(Icons.calendar_month)),
                      hintText: "Enter Date",
                      hintStyle: mediumTextBold.copyWith(
                          color: boxShadowColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height / 55),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: boxShadowColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: themeColor),
                      )),
                ),
              ),
              20.kh,
              Text(
                "To",
                textAlign: TextAlign.center,
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: dullBlackColor),
              ),
              10.kh,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: scaffoldColor,
                    boxShadow: [
                      BoxShadow(
                          color: boxShadowColor,
                          blurRadius: 5
                      )
                    ]
                ),
                child: TextField(
                  controller: toDateController,
                  style: mediumTextBold.copyWith(
                      color: themeColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 15),
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => _selectDate(context, false),
                          child: Icon(Icons.calendar_month)),
                      hintText: "Select Date",
                      hintStyle: mediumTextBold.copyWith(
                          color: boxShadowColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height / 55),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: boxShadowColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: themeColor),
                      )
                  ),
                ),
              ),
              20.kh,
              Text(
                "Leave Type:",
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: MediaQuery.of(context).size.height / 55,
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
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: boxShadowColor),
                    ),
                    value: leaveTypes.contains(
                        selectedLeaveType.value) // ✅ Check if value exists
                        ? selectedLeaveType.value
                        : null,
                    // Observed value
                    items: leaveTypes.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: mediumTextBold.copyWith(
                              color: dullBlackColor.withAlpha(200),
                              fontWeight: FontWeight.w200,
                              fontSize: 15)
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        selectedLeaveType.value = newValue;
                      }
                    },
                    buttonStyleData: ButtonStyleData(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 2.5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: boxShadowColor, blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: boxShadowColor,width: 1),
                        color: Colors.white,
                      ),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      isOverButton: true,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                        // gradient: leaveBalance
                      ),
                    ),
                  )),
              20.kh,
              Text(
                "Reason Of Leave",
                textAlign: TextAlign.center,
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: dullBlackColor),
              ),
              10.kh,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: scaffoldColor,
                    boxShadow: [
                      BoxShadow(
                          color: boxShadowColor,
                          blurRadius: 5
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: boxShadowColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: themeColor),
                      )
                  ),
                ),
              ),
              20.kh,
              Text(
                "Leave Approval Manager",
                textAlign: TextAlign.center,
                style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
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
                      fontSize: MediaQuery.of(context).size.height / 55,
                      color: boxShadowColor),
                ),
                value: leaveApprovalManagers.contains(
                    selectedManagerName.value) // ✅ Check if value exists
                    ? selectedManagerName.value
                    : null,
                // Observed value
                items: leaveApprovalManagers.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                        item,
                        style: mediumTextBold.copyWith(
                            color: dullBlackColor.withAlpha(200),
                            fontWeight: FontWeight.w200,
                            fontSize: 15)
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedManagerName.value = newValue;
                  }
                },
                buttonStyleData: ButtonStyleData(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 2.5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: boxShadowColor, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: boxShadowColor,width: 1),
                    color: Colors.white,
                  ),
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  isOverButton: true,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    // gradient: leaveBalance
                  ),
                ),
              )),

              50.kh,
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: boxShadowColor,
                      blurRadius: 5
                    )
                  ],
                  color: themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Apply",style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: scaffoldColor)),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
