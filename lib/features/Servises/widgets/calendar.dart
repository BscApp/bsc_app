// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//  final startDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//                                                           selectedDayPredicate:
//                                                               (day) {
//                                                             return isSameDay(
//                                                                 startDate, day);
//                                                           },
//                                                           calendarStyle:
//                                                               const CalendarStyle(
//                                                                   todayDecoration: BoxDecoration(
//                                                                       color: Colors
//                                                                           .blueGrey,
//                                                                       shape: BoxShape
//                                                                           .circle),
//                                                                   selectedDecoration:
//                                                                       BoxDecoration(
//                                                                     color: Appcolors
//                                                                         .brandColor,
//                                                                     shape: BoxShape
//                                                                         .circle,
//                                                                   )),
//                                                           daysOfWeekStyle: const DaysOfWeekStyle(
//                                                               weekdayStyle: TextStyle(
//                                                                   color: Appcolors
//                                                                       .textColor,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500),
//                                                               weekendStyle: TextStyle(
//                                                                   color: Appcolors
//                                                                       .brandColor,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500)),
//                                                           weekendDays: const [
//                                                             DateTime.friday,
//                                                             DateTime.saturday
//                                                           ],
//                                                           headerStyle:
//                                                               const HeaderStyle(
//                                                                   leftChevronIcon:
//                                                                       Icon(
//                                                                     Icons
//                                                                         .arrow_left_sharp,
//                                                                     color: Appcolors
//                                                                         .brandColor,
//                                                                     size: 40,
//                                                                   ),
//                                                                   rightChevronIcon:
//                                                                       Icon(
//                                                                     Icons
//                                                                         .arrow_right_sharp,
//                                                                     color: Appcolors
//                                                                         .brandColor,
//                                                                     size: 40,
//                                                                   ),
//                                                                   formatButtonVisible:
//                                                                       false,
//                                                                   titleCentered:
//                                                                       true,
//                                                                   titleTextStyle: TextStyle(
//                                                                       color: Appcolors
//                                                                           .brandColor,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w600)),
//                                                           focusedDay: startDate,
//                                                           firstDay:
//                                                               DateTime.utc(
//                                                                   2010, 01, 01),
//                                                           lastDay: DateTime.utc(
//                                                               2030, 12, 12),
//                                                           onDaySelected:
//                                                               (selectedDay,
//                                                                   focusDay) {
//                                                             setState(() {
//                                                               startDate =
//                                                                   selectedDay;
//                                                               focusDay =
//                                                                   selectedDay;
//                                                             });
//   }
// }

