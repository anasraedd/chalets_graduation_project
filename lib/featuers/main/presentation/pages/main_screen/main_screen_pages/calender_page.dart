import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/featuers/main/presentation/widgets/favourites_widget_item.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:chalets/widgets/calender_widget.dart';
import 'package:chalets/widgets/card_chalet_info.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  late bool isAdmin;

  CalenderPage({this.isAdmin = false});

  DateTime selectedDate = DateTime.now();



  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();


  @override
  void initState() {
    // TODO: implement initState


    Get.lazyPut <UserGetxController>(() =>UserGetxController());
    if(!UserGetxController.to.isGetMyReservations.value){
      UserGetxController.to.getMyReservations();
    }
    //getxController.call();
    // UserGetxController.to.getMyReservations();
    // ChaletsGetxController.to.read(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.isAdmin
            ? Container(
                clipBehavior: Clip.hardEdge,
                height: 100.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/images/app_bar.svg'),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          lang.tr('calender'),
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 18.w),
                          child: SvgPicture.asset(
                              'assets/icons/calender_directions.svg'),
                        ))
                  ],
                ),
              )
            : Container(),
        Expanded(
          child: GetX<UserGetxController>(
              init: UserGetxController(),
              builder: (UserGetxController controller) {
                // if( controller.loading.value) {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                if(controller.loadingMyReservations.value){
                  return Center(child: CircularProgressIndicator());
                }else{
                  return

                    Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ScrollConfiguration(
                                behavior: MyBehavior(),
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

                                  headerStyle: HeaderStyle(
                                      headerPadding: EdgeInsets.only(bottom: 10)),

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
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 15.sp),
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
                                          if (controller.myReservations.isNotEmpty) {
                                            controller.myReservations
                                                .forEach((element) {
                                              DateTime startAtDate = DateTime.parse(element.endAt);
                                              DateTime endAtDate = DateTime.parse(element.startAt);
                                              // DateTime startAtDate =
                                              //     DateTime.now().subtract(Duration(days: 5));
                                              // DateTime endAtDate =
                                              //     DateTime.now().add(Duration(days: 6));
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

                                      selectedBuilder: (context, _datetime, events){
                                        bool morningReserved = false;
                                        bool eveningReserved = false;
                                        if (_datetime.year == _selectedDay.year ||
                                            _datetime.month == _selectedDay.month ||
                                            _datetime.day == _selectedDay.day) {
                                          // DateTime customDate = DateTime.now().add(Duration(days: 1));
                                          // if( _datetime.year == customDate.year &&
                                          //     _datetime.month == customDate.month &&
                                          //     _datetime.day == customDate.day){
                                          //
                                          //   morningReserved =true;
                                          //   eveningReserved = true;
                                          // }
                                          if (controller.myReservations.isNotEmpty) {
                                            controller.myReservations
                                                .forEach((element) {
                                              DateTime startAtDate = DateTime.parse(element.endAt);
                                              DateTime endAtDate = DateTime.parse(element.startAt);
                                              // DateTime startAtDate =
                                              //     DateTime.now().subtract(Duration(days: 5));
                                              // DateTime endAtDate =
                                              //     DateTime.now().add(Duration(days: 6));
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
                                            isSelected: true,
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),

                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      _selectedDay = selectedDay;
                                      _focusedDay =
                                          focusedDay; // update `_focusedDay` here as well
                                    });
                                  },

                                  firstDay: DateTime.now().subtract(Duration(days: 75)),
                                  lastDay: DateTime.now().add(
                                    Duration(days: 75),
                                  ),
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
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Stack(children: [
                            Center(
                              child: Container(
                                height: 40,
                                child: Center(
                                  child: ClipOval(
                                    child: Divider(
                                      color: primaryColor,
                                      thickness: 1.6.h,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                color: scaffoldBackGround,
                                height: 40.h,
                                width: 140.w,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    DateFormat('d MMMM yyyy').format(widget.selectedDate),
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),

                        // Container(
                        //   height: 270.h,
                        //child:
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView(
                              children: [
                                // CardChaletInfo(name: 'll',),
                                // CardChaletInfo(name: 'll',),
                                // CardChaletInfo(name: 'll',),
                              ],
                            ),
                          ),
                        ),
                        //),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    );
                }
                // }else {

  }
  )
        )
      ],
    );
  }
}

//   DateTime _selectedDate = DateTime.now();
//
//   void _selectDate(DateTime date) {
//     setState(() {
//       _selectedDate = date;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Calendar'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               DateFormat('MMMM yyyy').format(_selectedDate),
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             CalendarGrid(
//               selectedDate: _selectedDate,
//               onDateSelected: _selectDate,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CalendarGrid extends StatelessWidget {
//   final DateTime selectedDate;
//   final ValueChanged<DateTime> onDateSelected;
//
//   CalendarGrid({
//     required this.selectedDate,
//     required this.onDateSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final List<DateTime> daysInMonth = _getDaysInMonth(selectedDate);
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: daysInMonth.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         final DateTime date = daysInMonth[index];
//
//         return GestureDetector(
//           onTap: () => onDateSelected(date),
//           child: Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isSameDay(date, selectedDate)
//                   ? Colors.blue
//                   : Colors.transparent,
//             ),
//             child: Text(
//               '${date.day}',
//               style: TextStyle(
//                 color:
//                     isSameDay(date, selectedDate) ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   List<DateTime> _getDaysInMonth(DateTime date) {
//     final int year = date.year;
//     final int month = date.month;
//     final int daysInMonth = DateTime(year, month + 1, 0).day;
//
//     return List<DateTime>.generate(
//       daysInMonth,
//       (int index) => DateTime(year, month, index + 1),
//     );
//   }
//
//   bool isSameDay(DateTime date1, DateTime date2) {
//     return date1.year == date2.year &&
//         date1.month == date2.month &&
//         date1.day == date2.day;
//   }
// }

// class CustomNumberContainer extends StatelessWidget {
//   final int number;
//   final Color borderColor;
//   final Color fillColor;
//
//   CustomNumberContainer({
//     required this.number,
//     required this.borderColor,
//     required this.fillColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: borderColor,
//           width: 4,
//         ),
//         color: fillColor,
//       ),
//       child: Center(
//         child: Text(
//           number.toString(),
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OppositeTrianglesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//
//     // final borderRadius = BorderRadius.circular(20); // Set the desired radius here
//
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTRB(0, 0, size.width, size.height),
//         BorderRadius.circular(20) as Radius,
//       ),
//       paint,
//     );
//
//     final path = Path();
//
//     // Top triangle
//     path.moveTo(95, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width / 2, size.height / 2);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class CurvedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;
//
//     final path = Path();
//
//     // Starting point of the curve
//     final startPoint = Offset(50, 100);
//
//     // Ending point of the curve
//     final endPoint = Offset(250, 100);
//
//     // Control point to define the curve shape
//     final controlPoint = Offset(150, 0);
//
//     path.moveTo(startPoint.dx, startPoint.dy);
//
//     // Drawing a quadratic Bézier curve
//     path.quadraticBezierTo(
//       controlPoint.dx,
//       controlPoint.dy,
//       endPoint.dx,
//       endPoint.dy,
//     );
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
