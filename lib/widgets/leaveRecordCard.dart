import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:flutter/material.dart';

class LeaveRecordCard extends StatefulWidget {
  const LeaveRecordCard({super.key});

  @override
  State<LeaveRecordCard> createState() => _LeaveRecordCardState();
}

class _LeaveRecordCardState extends State<LeaveRecordCard> {
  @override
  Widget build(BuildContext context) {
    var horizontalPadding = MediaQuery.of(context).size.width / 50;
    var verticalPadding = MediaQuery.of(context).size.height / 50;
    return Container(
      decoration: BoxDecoration(
          color: scaffoldColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: boxShadowColor, blurRadius: 5)]),
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date",
                      style: mediumTextBold.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: cardBodyTextColor)),
                  3.kh,
                  Text("Apr 15, 2023 - Apr 18, 2023",
                      style: smallTextRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: cardDescriptionTextColor)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff32de84),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: boxShadowColor, blurRadius: 5)
                    ]),
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding - 11,
                    horizontal: horizontalPadding - 2),
                child: Text(
                  "Approved",
                  style: smallTextRegular.copyWith(
                      color: scaffoldColor, fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
          10.kh,
          Divider(
            color: boxShadowColor,
            thickness: 0.5,
            height: 0.5,
          ),
          10.kh,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apply Days",style: mediumTextBold.copyWith(
                      fontWeight: FontWeight.w500,
              fontSize: 13,
              color: dullBlackColor)),
                  5.kh,
                  Text("3 Days",style: smallTextRegular.copyWith(
                      fontSize: 13,
                      color: cardDescriptionTextColor)),
                ],
              ),
              SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: boxShadowColor,
                  thickness: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Leave Balance",style: mediumTextBold.copyWith(
                      fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: cardBodyTextColor)),
                  5.kh,
                  Text("16",style: smallTextRegular.copyWith(
                      fontSize: 13,
                      color: cardDescriptionTextColor)),
                ],
              ),
              SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: boxShadowColor,
                  thickness: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Approved By",style: mediumTextBold.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: cardBodyTextColor)),
                  5.kh,
                  Text("Martine Deo",style: smallTextRegular.copyWith(
                      fontSize: 13,
                      color: cardDescriptionTextColor)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
