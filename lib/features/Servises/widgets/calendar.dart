 
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Define Appcolors for the theme
class Appcolors {
  static const Color brandColor = Color(0xFF140C47); // Example color
  static const Color textColor = Color(0xFF000000);  // Example color
}

class CalendarAlert extends StatefulWidget {

  final DateTime startDate;
final void Function(DateTime,DateTime)onDaySelected;
  const CalendarAlert({super.key, required this.startDate, required this.onDaySelected});

  @override
  State<CalendarAlert> createState() => _CalendarAlertState();
}

class _CalendarAlertState extends State<CalendarAlert> {

  @override
  Widget build(BuildContext context) {
    return  TableCalendar(
        selectedDayPredicate: (day) {
          return isSameDay(widget.startDate, day);
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Appcolors.brandColor,
            shape: BoxShape.circle,
          ),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Appcolors.textColor,
            fontWeight: FontWeight.w500,
          ),
          weekendStyle: TextStyle(
            color: Appcolors.brandColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        weekendDays: const [DateTime.friday, DateTime.saturday],
        headerStyle: const HeaderStyle(
          leftChevronIcon: Icon(
            Icons.arrow_left_sharp,
            color: Appcolors.brandColor,
            size: 40,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_right_sharp,
            color: Appcolors.brandColor,
            size: 40,
          ),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Appcolors.brandColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        focusedDay: widget.startDate,
        firstDay: DateTime.utc(2010, 01, 01),
        lastDay: DateTime.utc(2030, 12, 12),
        onDaySelected:widget.onDaySelected       );
  }
}

