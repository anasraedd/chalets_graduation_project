import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:chalets/widgets/card_chalet_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseYourReservationDate extends StatefulWidget {
  const ChooseYourReservationDate({Key? key}) : super(key: key);

  @override
  State<ChooseYourReservationDate> createState() =>
      _ChooseYourReservationDateState();
}

class _ChooseYourReservationDateState extends State<ChooseYourReservationDate> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  late DateTime _currentMonth;
  bool _isFirstDisplayedMonth = false;
  DateTime _firstDay = DateTime.now().subtract(Duration(days: 75));
  DateTime _lastDay = DateTime.now().add(
    Duration(days: 75),
  );




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            shadowColor: primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            toolbarHeight: 80.h,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
            )),
            title: Text(
              "choose_your_reservation_date".tr(),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                MyFlutterApp.back,
                color: Colors.white,
                size: 30,
              ),
            )),
        body: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Card(
              // height: 130.h,
              // width: double.infinity,
              //  clipBehavior: Clip.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.only(left: 25.w, right: 25.w),

              child: SizedBox(
                //  height: 130.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 102.w,
                      width: 102.w,
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsetsDirectional.only(start: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8.r),
                        //
                        // border:  Border.all(
                        //     strokeAlign: BorderSide.strokeAlignOutside,
                        //     color: Colors.white)
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
                        fit: BoxFit.cover,
                        // fit: BoxFit.fill,
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(
                                15.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                  "assets/images/favouritesHome.png"),
                                              height: 16.h,
                                              width: 16.h,
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            //Chalet Name
                                            Text(
                                              "Best Morocco Chalet",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17.5.sp,
                                              ),
                                            ),
                                          ],
                                        ),
//edit
                                        Container(
                                          width: 270.w,
                                          margin: EdgeInsets.only(
                                              top: 8.h, bottom: 8.h, left: 4.w),
                                          child: ClipOval(
                                            child: Divider(
                                              color: const Color(0xFF017C9B),
                                              thickness: 1.1.h,
                                              height: 2,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                  "assets/images/area_icon.png"),
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            //Area Text
                                            RichText(
                                              text: TextSpan(
                                                  text: "Unit Area ",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      color: Colors.black),
                                                  children: [
                                                    TextSpan(
                                                      text: "1006",
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.sp,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " m",
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ),
                                                  ]),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                  "assets/images/map_icon.png"),
                                              height: 16.h,
                                              width: 16.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            //Chalet LOCATION
                                            Text(
                                              "Palestine - Gaza Strip - Gaza - AlRemal",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.5.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                // height: 125.h,
                width: double.infinity,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Colors.black)),

                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check_In Date',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: Text(
                                  '2/7/2023',
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF252525),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 12.5,
                              // ),
                              Text(
                                'Check_Out Date',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: Text(
                                  '2/7/2023',
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF252525),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check_In Time',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: Text(
                                  '7:00 AM',
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF252525),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 12.5,
                              // ),
                              Text(
                                'Check_Out Time',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: Text(
                                  '6:00 PM',
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF252525),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

//            child: ,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
              child: TableCalendar(
                   selectedDayPredicate: (day) {
                  return isSameMonth(day, _focusedDay);
                },
                availableGestures: AvailableGestures.horizontalSwipe,

                calendarFormat: _calendarFormat,
                //selectedDay: _selectedDay,

                focusedDay: _focusedDay,

                // onFormatChanged: (format) {
                //   setState(() {
                //     _calendarFormat = format;
                //   });
                // },



                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,

                  cellAlignment: Alignment.bottomCenter,

                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  // todayTextStyle: TextStyle(
                  // fontSize: 16,
                  // color: Colors.black,
                  // )
                ),

                headerStyle: HeaderStyle(
                    titleCentered: true,
                    headerPadding: EdgeInsets.symmetric(horizontal: 15.w)),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
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
                                _datetime.day == _selectedDay.day //&& _currentMonth.month == _datetime.month
                            ? BoxCalender(
                                _datetime.day.toString(),
                                isAvaliable: true,
                                isSelected: true,
                                morningReserved: true,
                                eveningReserved: true,
                              )
                            : null),

                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },

                firstDay: _firstDay,
                lastDay:_lastDay,
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {},
          child: Image.asset("assets/icons/btn_go.png"),
          //SvgPicture.asset('assets/icons/btn_go.svg')
          // Container(
          // margin: EdgeInsets.only(top: 10.h),
          // decoration: const BoxDecoration(
          // image: DecorationImage(
          // image: AssetImage("assets/icons/btn_go.png"),
          // fit: BoxFit.cover)),
          // padding: EdgeInsets.only(bottom: 5.h),
          // height: 65.h,
          // width: 65.w,
          //
          // ),
        ));
  }

  bool isSameMonth(DateTime day1, DateTime day2) {
    return day1.year == day2.year && day1.month == day2.month;
  }

  bool isSameMonthOrLater(DateTime day1, DateTime day2) {
    return day1.isAfter(DateTime(day2.year, day2.month)) ||
        day1.year == day2.year && day1.month == day2.month;
}
}
