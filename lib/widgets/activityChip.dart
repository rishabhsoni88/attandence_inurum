import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:attandenceapp/utils/appextensions.dart';
import 'package:flutter/material.dart';

class ActivityChip extends StatelessWidget {
  const ActivityChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: scaffoldColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/right_arrow.png",height: 50,width: 50,),
                5.kw,
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text("Check In",
                        style: mediumTextBold.copyWith(
                            color: card2BodyTextColor,
                            fontSize: MediaQuery.of(context)
                                .size
                                .height /
                                50)),
                    Text("April 17, 2025",
                        style: mediumTextBold.copyWith(
                            color: cardDescriptionTextColor,
                            fontSize: MediaQuery.of(context)
                                .size
                                .height /
                                70)),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("10:20 am",
                    style: mediumTextBold.copyWith(
                        color: card2BodyTextColor,
                        fontSize: MediaQuery.of(context)
                            .size
                            .height /
                            55)),
                Text("On Time",
                    style: mediumTextBold.copyWith(
                        color: cardDescriptionTextColor,
                        fontSize: MediaQuery.of(context)
                            .size
                            .height /
                            70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
