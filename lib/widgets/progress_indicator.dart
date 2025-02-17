import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicator();
}

class _CustomProgressIndicator extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: themeColor,
        strokeWidth: 5,
      ),
    ));
  }
}
