import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
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
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: cardBodyTextColor)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 97,
                  ),
                  Text("Apr 15, 2023 - Apr 18, 2023",
                      style: smallTextRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height / 55,
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Divider(
            color: boxShadowColor,
            thickness: 0.5,
            height: 0.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apply Days",style: mediumTextBold.copyWith(
                      fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height / 55,
              color: dullBlackColor)),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/99,
                  ),
                  Text("3 Days",style: smallTextRegular.copyWith(
                      fontSize: MediaQuery.of(context).size.height / 65,
                      color: cardDescriptionTextColor)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/20,
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
                  fontSize: MediaQuery.of(context).size.height / 55,
                  color: cardBodyTextColor)),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/99,
                  ),
                  Text("16",style: smallTextRegular.copyWith(
                      fontSize: MediaQuery.of(context).size.height / 65,
                      color: cardDescriptionTextColor)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/20,
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
                  fontSize: MediaQuery.of(context).size.height / 55,
                  color: cardBodyTextColor)),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/99,
                  ),
                  Text("Martine Deo",style: smallTextRegular.copyWith(
                      fontSize: MediaQuery.of(context).size.height / 65,
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
