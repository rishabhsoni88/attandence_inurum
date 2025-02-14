import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:flutter/material.dart';

class LeaveCards extends StatefulWidget {
  final IconData cardIcon;
  final String cardTitle;
  final String cardBody;
  final LinearGradient headerColor;
  final Color headerTextColor;

  const LeaveCards(
      {super.key,
      required this.cardIcon,
      required this.cardTitle,
      required this.cardBody,
      required this.headerColor,
      required this.headerTextColor});

  @override
  State<LeaveCards> createState() => _SquareCardsState();
}

class _SquareCardsState extends State<LeaveCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/9,
      width: MediaQuery.of(context).size.width/2.25,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        ),],
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.black12, width: 1),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: widget.headerColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width/80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Icon(
                    widget.cardIcon,
                    color: iconColor,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.cardTitle,
                  style: mediumTextBold.copyWith(fontSize: MediaQuery.of(context).size.height/60,color: widget.headerTextColor),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cardBody,
                  style: mediumTextBold.copyWith(color: cardBodyTextColor)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
