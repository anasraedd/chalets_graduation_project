// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(CalendarApp());
// }
//
// class CalendarApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CalendarScreen(),
//     );
//   }
// }
//
// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime selectedDate = DateTime.now();
//
//   Widget _buildCalendarDay(DateTime day) {
//     bool isSelected = day.year == selectedDate.year &&
//         day.month == selectedDate.month &&
//         day.day == selectedDate.day;
//     bool isCurrentMonth = day.month == selectedDate.month;
//
//     return GestureDetector(
//       onTap: isCurrentMonth
//           ? () {
//         setState(() {
//           selectedDate = day;
//         });
//       }
//           : null,
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : (isCurrentMonth ? Colors.transparent : Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           day.day.toString(),
//           style: TextStyle(
//             color: isSelected ? Colors.white : (isCurrentMonth ? Colors.black : Colors.grey),
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildWeekRow(DateTime startOfWeek) {
//     List<Widget> weekRow = [];
//     for (int i = 0; i < 7; i++) {
//       DateTime day = startOfWeek.add(Duration(days: i));
//       weekRow.add(Expanded(child: _buildCalendarDay(day)));
//     }
//     return weekRow;
//   }
//
// // ... (other code remains the same)
//
// // ... (other code remains the same)
//
//   List<Widget> _buildMonthView(DateTime firstDayOfMonth) {
//     List<Widget> calendarRows = [];
//     int currentDay = 1;
//
//     // Calculate the number of days in the displayed month
//     int daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
//
//     // Calculate the weekday of the first day of the displayed month
//     int weekdayOfFirstDay = firstDayOfMonth.weekday;
//
//     // Calculate the number of days in the previous month
//     int daysInPreviousMonth = DateTime(
//       selectedDate.year,
//       selectedDate.month,
//       0,
//     ).day;
//
//     // Add day labels at the top
//     calendarRows.add(Row(
//       children: List.generate(7, (index) {
//         return Expanded(
//           child: Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.symmetric(vertical: 8),
//             child: Text(
//               ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       }),
//     ));
//
//     // Fill in days from the previous month
//     for (int i = daysInPreviousMonth - weekdayOfFirstDay + 1;
//     i <= daysInPreviousMonth;
//     i++) {
//       calendarRows.add(Row(
//         children: _buildWeekRow(
//           firstDayOfMonth.subtract(Duration(days: weekdayOfFirstDay - i)),
//         ),
//       ));
//     }
//
//     while (currentDay <= daysInMonth) {
//       calendarRows.add(Row(
//         children: _buildWeekRow(
//           firstDayOfMonth.add(Duration(days: (currentDay - 1) + weekdayOfFirstDay)),
//         ),
//       ));
//       currentDay += (7 - weekdayOfFirstDay);
//       weekdayOfFirstDay = 0;
//     }
//
//     return calendarRows;
//   }
//
// // ... (rest of the code remains the same)
//
//
// // ... (rest of the code remains the same)
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime firstDayOfMonth =
//     DateTime(selectedDate.year, selectedDate.month, 1);
//     int daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
//     int weekdayOfFirstDay = firstDayOfMonth.weekday;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calendar'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedDate = DateTime(
//                         selectedDate.year, selectedDate.month - 1, 1);
//                   });
//                 },
//                 icon: Icon(Icons.chevron_left),
//               ),
//               Spacer(),
//               Text(
//                 '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Spacer(),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedDate = DateTime(
//                         selectedDate.year, selectedDate.month + 1, 1);
//                   });
//                 },
//                 icon: Icon(Icons.chevron_right),
//               ),
//             ],
//           ),
//           Column(children: _buildMonthView(firstDayOfMonth)),
//         ],
//       ),
//     );
//   }
// }
