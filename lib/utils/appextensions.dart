import 'package:intl/intl.dart';

extension DateTimeExtension on String? {
  String toCustomDate() {
    if (this == null || this!.isEmpty) {
      return "";
    }

    try {
      DateTime date = DateTime.parse(this!);
      String formattedDate = DateFormat("dd-MMM-yy").format(date);
      return formattedDate;
    } catch (e) {
      return ""; // Return empty string if parsing fails
    }
  }
}
extension TimestampExtension on int? {
  String toFormattedDateTime({String format = "hh:mm a"}) {
    if (this == null || this! <= 0) {
      return "";
    }

    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat(format).format(dateTime);
    } catch (e) {
      return ""; // Return empty string if conversion fails
    }
  }
}
