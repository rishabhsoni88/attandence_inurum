import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
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
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: themeColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: scaffoldColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
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
