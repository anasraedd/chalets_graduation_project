import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarChaletScreen extends StatefulWidget {
  @override
  _CalendarChaletScreenState createState() => _CalendarChaletScreenState();
}

class _CalendarChaletScreenState extends State<CalendarChaletScreen>
    with Helpers {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // List<DateTime> arr = [
  //   DateTime.now().subtract(Duration(days: 2)),
  //   DateTime.now().add(Duration(days: 2)),
  // ];

  // int isExist(DateTime _dateTime) => arr
  //     .where((element) =>
  //         element.day == _dateTime.day &&
  //         element.month == _dateTime.month &&
  //         element.year == _dateTime.year)
  //     .length;

  @override
  Widget build(BuildContext context) {
    // return GetX<ChaletsGetxController>(
    //     init: ChaletsGetxController(),
    //     builder: (ChaletsGetxController getxController) {
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

              // selectedDecoration: BoxDecoration(
              //   color: Colors.blue,
              //   shape: BoxShape.circle,
              // ),
              // todayDecoration: BoxDecoration(
              //   color: Colors.yellow,
              //   shape: BoxShape.circle,
              // ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayTextStyle: TextStyle(color: Colors.black),
              // markersColor: Colors.grey,
              outsideDaysVisible: false, // Hides non-visible days

            ),
            // todayDecoration: BoxDecoration(
            // shape: BoxShape.circle,
            // color: Colors.transparent,
            // ),

            availableGestures: AvailableGestures.none,

            headerStyle:
                HeaderStyle(headerPadding: EdgeInsets.only(bottom: 10)),

            calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
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
            }, disabledBuilder: (context, _datetime, event) {
              return BoxCalender(
                _datetime.day.toString(),
                disable: true,
              );
            },
                markerBuilder: (context, _datetime, event) {
              bool morningReserved = false;
              bool eveningReserved = false;
              if (_datetime.year != _selectedDay.year ||
                  _datetime.month != _selectedDay.month ||
                  _datetime.day != _selectedDay.day) {
                // DateTime customDate = DateTime.now().add(Duration(days: 1));
                // if( _datetime.year == customDate.year &&
                //     _datetime.month == customDate.month &&
                //     _datetime.day == customDate.day){
                //
                //   morningReserved =true;
                //   eveningReserved = true;
                // }
                if (ChaletsGetxController
                    .to.chalet.value.chaletReservations.isNotEmpty) {
                  ChaletsGetxController.to.chalet.value.chaletReservations
                      .forEach((element) {
                    DateTime startAtDate = DateTime.parse(element.startAt);
                    DateTime endAtDate = DateTime.parse(element.endAt);
                    // DateTime startAtDate =
                    //     DateTime.now().subtract(Duration(days: 5));
                    // DateTime endAtDate =
                    //     DateTime.now().add(Duration(days: 6));



                    if (_datetime.isAfter(startAtDate.add(Duration(days: 1))) &&
                        _datetime.isBefore(endAtDate)) {
                      //.add(Duration(days: 1)
                      morningReserved = true;
                      eveningReserved = true;
                    }else  if ((_datetime.year == startAtDate.year &&
                        _datetime.month == startAtDate.month &&
                        _datetime.day == startAtDate.day) && (
                        _datetime.year == endAtDate.year &&
                            _datetime.month == endAtDate.month &&
                            _datetime.day == endAtDate.day
                    )) {
                      if (element.periodStart == 'Morning' && element.periodEnd == 'Evening') {
                        eveningReserved = true;
                        morningReserved = true;
                      } else   if (element.periodStart == 'Morning' && element.periodEnd == 'Morning'){
                        //
                        // bool isExsist = false;
                        // for(int i =0; i <  ChaletsGetxController.to.chalet.value.chaletReservations.length; i++ ){
                        //   if(DateTime.parse(element.endAt).day == DateTime.parse(ChaletsGetxController.to.chalet.value.chaletReservations[i].startAt).day &&
                        //       DateTime.parse(element.endAt).month == DateTime.parse(ChaletsGetxController.to.chalet.value.chaletReservations[i].startAt).month){
                        //     isExsist = true;
                        //     // break;
                        //     print('lllgggggggggggggggggggggggggggggggggggggggggggggggggggggggggmk');
                        //
                        //   }
                        // }
                        // if(isExsist){
                        //   morningReserved = true;
                        //   eveningReserved = true;
                        //   print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
                        //
                        // }else{
                          morningReserved = true;
                          eveningReserved = false;

                        //}
                        //

                      }
                      else   if (element.periodStart == 'Evening' && element.periodEnd == 'Evening'){
                        morningReserved = false;
                        eveningReserved = true;
                      }
                    } else
                    if (_datetime.year == startAtDate.year &&
                        _datetime.month == startAtDate.month &&
                        _datetime.day == startAtDate.day) {
                      if (element.periodStart == 'Evening') {
                        eveningReserved = true;
                        morningReserved = false;
                      } else {
                        morningReserved = true;
                        eveningReserved = true;
                      }
                    } else if (_datetime.year == endAtDate.year &&
                        _datetime.month == endAtDate.month &&
                        _datetime.day == endAtDate.day) {
                      if (element.periodEnd == 'Evening') {
                        morningReserved = true;
                        eveningReserved = true;

                        // morningReserved = false;
                      } else {
                        morningReserved = true;
                      }
                    }
                  });
                  // ChaletsGetxController.to.chalet.value.chaletReservations
                  //     .forEach((element) {
                  //   DateTime startAtDate = DateTime.parse(element.startAt);
                  //   DateTime endAtDate = DateTime.parse(element.endAt);
                  //   // DateTime startAtDate =
                  //   //     DateTime.now().subtract(Duration(days: 5));
                  //   // DateTime endAtDate =
                  //   //     DateTime.now().add(Duration(days: 6));
                  //   if (_datetime.isAfter(startAtDate.add(Duration(days: 1))) &&
                  //       _datetime.isBefore(endAtDate)) {
                  //     //.add(Duration(days: 1)
                  //     morningReserved = true;
                  //     eveningReserved = true;
                  //   }else
                  //   if (_datetime.year == startAtDate.year &&
                  //       _datetime.month == startAtDate.month &&
                  //       _datetime.day == startAtDate.day) {
                  //     if (element.periodStart == 'Evening') {
                  //       eveningReserved = true;
                  //       morningReserved = false;
                  //     } else {
                  //       morningReserved = true;
                  //       eveningReserved = true;
                  //     }
                  //   } else if (_datetime.year == endAtDate.year &&
                  //       _datetime.month == endAtDate.month &&
                  //       _datetime.day == endAtDate.day) {
                  //     if (element.periodEnd == 'Evening') {
                  //       morningReserved = true;
                  //       eveningReserved = true;
                  //
                  //       // morningReserved = false;
                  //     } else {
                  //       morningReserved = true;
                  //     }
                  //   }
                  // });


                }

                return BoxCalender(
                  _datetime.day.toString(),
                  isAvaliable: true,
                  morningReserved: morningReserved,
                  eveningReserved: eveningReserved,
                );
              } else {
                return Container();
              }

            },

                // outsideBuilder: (context, _datetime, event){
                //
                //  return
                //    _datetime.year == _selectedDay.year ||
                //       _datetime.month != _selectedDay.month ?
                //   BoxCalender(_datetime.toString()) : Container();
                // },

                selectedBuilder: (context, _datetime, events) {
              bool morningReserved = false;
              bool eveningReserved = false;
              if (_datetime.year == _selectedDay.year &&
                  _datetime.month == _selectedDay.month &&
                  _datetime.day == _selectedDay.day) {
                if (ChaletsGetxController
                    .to.chalet.value.chaletReservations.isNotEmpty) {
                  ChaletsGetxController.to.chalet.value.chaletReservations
                      .forEach((element) {
                    DateTime startAtDate = DateTime.parse(element.endAt);
                    DateTime endAtDate = DateTime.parse(element.startAt);
                    if (_datetime.isAfter(startAtDate.add(Duration(days: 1))) &&
                        _datetime.isBefore(endAtDate)) {
                      //.add(Duration(days: 1)
                      morningReserved = true;
                      eveningReserved = true;
                    }
                    if (_datetime.year == startAtDate.year &&
                        _datetime.month == startAtDate.month &&
                        _datetime.day == startAtDate.day) {
                      if (element.periodStart == 'Evening') {
                        eveningReserved = true;
                        morningReserved = false;
                      } else {
                        morningReserved = true;
                        eveningReserved = true;
                      }
                    } else if (_datetime.year == endAtDate.year &&
                        _datetime.month == endAtDate.month &&
                        _datetime.day == endAtDate.day) {
                      if (element.periodEnd == 'Evening') {
                        morningReserved = true;
                        eveningReserved = true;

                        // morningReserved = false;
                      } else {
                        morningReserved = true;
                      }
                    }
                  });
                }
                return BoxCalender(
                  _datetime.day.toString(),
                  isAvaliable: true,
                  morningReserved: morningReserved,
                  eveningReserved: eveningReserved,
                );
              }
              // ? BoxCalender(
              //     _datetime.day.toString(),
              //     isAvaliable: true,
              //     isSelected: true,
              //     morningReserved: true,
              //     eveningReserved: true,
              //   )
              // : Container()
            }

            ),

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
    //});
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
