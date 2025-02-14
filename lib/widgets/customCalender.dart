import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatelessWidget {
  final Rx<DateTime> selectedDay;
  final Rx<DateTime> focusedDay;

  CustomCalender(
      {super.key, required this.selectedDay, required this.focusedDay});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar(
        headerVisible: false,
        firstDay: DateTime.utc(2020, 01, 01),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: focusedDay.value,
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!selectedDay.isAfter(DateTime.now())) {
            this.selectedDay.value = selectedDay;
            this.focusedDay.value = focusedDay; // Update the focused day
          }
        },
        onPageChanged: (focusedDay) {
          this.focusedDay.value = focusedDay;
        },
        availableCalendarFormats: const {
          CalendarFormat.week: 'Week', // Only show the Week format
        },
        calendarFormat: CalendarFormat.week,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle, // Ensure it's always a circle
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle, // Keep it consistent
          ),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
          formatButtonVisible:
              false, // Hide the format button (month, year, etc.)
        ),
      ),
    );
  }
}
