import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarChaletScreen extends StatefulWidget {
  @override
  _CalendarChaletScreenState createState() => _CalendarChaletScreenState();
}

class _CalendarChaletScreenState extends State<CalendarChaletScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<DateTime> arr = [
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 2)),
  ];

  int isExist(DateTime _dateTime) => arr
      .where((element) =>
          element.day == _dateTime.day &&
          element.month == _dateTime.month &&
          element.year == _dateTime.year)
      .length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TableCalendar(
            calendarFormat: _calendarFormat,
            //selectedDay: _selectedDay,

            focusedDay: _focusedDay,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },

            calendarStyle: CalendarStyle(
              cellAlignment: Alignment.bottomCenter,

              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
            ),
            headerStyle:
                HeaderStyle(headerPadding: EdgeInsets.only(bottom: 10)),

            calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);
                  if (day.weekday == DateTime.sunday) {
                    // final text = DateFormat.E().format(day);

                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ),
                  );
                },
                disabledBuilder: (context, _datetime, event) {
                  return BoxCalender(
                    _datetime.day.toString(),
                    disable: true,
                  );
                },
                markerBuilder: (context, _datetime, event) {
                  return _datetime.year != _selectedDay.year ||
                          _datetime.month != _selectedDay.month ||
                          _datetime.day != _selectedDay.day
                      ? BoxCalender(
                          _datetime.day.toString(),
                          isAvaliable: true,
                          morningReserved: true,
                          eveningReserved: true,
                        )
                      : Container();
                },
                // outsideBuilder: (context, _datetime, event){
                //   _datetime.year == _selectedDay.year ||
                //       _datetime.month != _selectedDay.month ?
                //   BoxCalender(_datetime.toString()) : Container();
                // },

                selectedBuilder: (context, _datetime, events) =>
                    _datetime.year == _selectedDay.year &&
                            _datetime.month == _selectedDay.month &&
                            _datetime.day == _selectedDay.day
                        ? BoxCalender(
                            _datetime.day.toString(),
                            isAvaliable: true,
                            isSelected: true,
                            morningReserved: true,
                            eveningReserved: true,
                          )
                        : Container()),



            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            firstDay: DateTime.now().subtract(Duration(days: 75)),
            lastDay: DateTime.now().add(
              Duration(days: 75),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 50.w, left: 50.w, top: 100),
          child: ClipOval(
            child: Divider(
              color: const Color(0xFF017C9B),
              thickness: 1.6.h,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }


  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
