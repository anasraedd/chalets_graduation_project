import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderWidget extends StatefulWidget {
  final void Function(DateTime selectedDate)? onClicked;

  CalenderWidget({required this.onClicked});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime selectedDate = DateTime.now();
  DateTime _displayedMonth = DateTime.now();

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      widget.onClicked!(date);
    });
  }

  void _changeMonth(int increment) {
    setState(() {
      _displayedMonth =
          DateTime(_displayedMonth.year, _displayedMonth.month + increment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 70.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _changeMonth(-1);
                    },
                    child: Container(
                      height: 34.w,
                      width: 34.w,

                      decoration: BoxDecoration(
                        color: scaffoldBackGround,
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 0),
                              blurRadius: 7.5)
                        ],
                      ),
                      child: Center(
                          child: Transform.flip(
                        child: Icon(
                          MyFlutterApp.box_arrow_left,
                          color: primaryColor,
                          size: 36.w,
                        ),
                        flipX: context.locale.languageCode == 'ar',
                      )),
                      // Image.asset(
                      //   'assets/icons/nextMonth.png',
                      //   width: 35.w,
                      //   height: 35.w,
                      // ),
                    ),
                  ),
                  Container(
                    width: 210.w,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('MMMM yyyy').format(_displayedMonth),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeMonth(1);
                    },
                    child: Container(
                      height: 34.w,
                      width: 34.w,

                      decoration: BoxDecoration(
                        color: scaffoldBackGround,
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 0),
                              blurRadius: 7.5)
                        ],
                      ),
                      child: Transform.flip(
                        child: Icon(
                          MyFlutterApp.box_arrow_right,
                          color: primaryColor,
                          size: 36.w,
                        ),
                        flipX: context.locale.languageCode == 'ar',
                      ),
                      // Image.asset(
                      //   'assets/icons/nextMonth.png',
                      //   width: 35.w,
                      //   height: 35.w,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            CalendarGrid(
              displayedMonth: _displayedMonth,
              selectedDate: selectedDate,
              onDateSelected: _selectDate,
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarGrid extends StatefulWidget {
  final DateTime displayedMonth;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  CalendarGrid({
    required this.displayedMonth,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  //DateTime currentDate = DateTime.now();

  DateTime dateBefore75Days = DateTime.now().subtract(Duration(days: 75));
  DateTime dateAfter75Days = DateTime.now().add(Duration(days: 75));

  @override
  Widget build(BuildContext context) {
    final DateTime myDate = _getDaysInMonth(widget.displayedMonth).first;

    String dayName = getDayName(myDate);
    final List<DateTime> daysInMonth = _getDaysInMonth(widget.displayedMonth);
    print(dayName);
    final List<String> dayLabels = [
      'sun'.tr(),
      'mon'.tr(),
      'tue'.tr(),
      'wed'.tr(),
      'thu'.tr(),
      'fri'.tr(),
      'sat'.tr()
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        children: [
          Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5.w),
                  child: Text(
                    dayLabels[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.only(right: 50.w, left: 50.w, top: 14.h),
            child: ClipOval(
              child: Divider(
                color: const Color(0xFF017C9B),
                thickness: 1.6.h,
                height: 2,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: daysInMonth.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemBuilder: (BuildContext context, int index) {
              final DateTime date = daysInMonth[index];
              final bool isCurrentMonth =
                  date.month == widget.displayedMonth.month;

              return GestureDetector(
                  onTap: () => widget.onDateSelected(date),
                  child: (dayName == 'Sun' || dayName == 'الأحد') && index == 0
                      ? BoxCalender(
                          '${date.day}',
                          isAvaliable: !date.isBefore(dateBefore75Days) &&
                              !date.isAfter(dateAfter75Days),
                          isSelected: isSameDay(date, widget.selectedDate),
                          morningReserved: true,
                        )
                      : (dayName == 'Mon' || dayName == 'الاثنين') && (index == 0)
                          ? Container()
                          : (dayName == 'Thu' || dayName == 'الخميس') &&
                                  (index == 0 ||
                                      index == 1 ||
                                      index == 2 ||
                                      index == 3)
                              ? Container()
                              : (dayName == 'Wed' || dayName == 'الأربعاء')  &&
                                      (index == 0 || index == 1 || index == 2)
                                  ? Container()
                                  : (dayName == 'Tue' || dayName == 'الثلاثاء') &&
                                          (index == 0 || index == 1)
                                      ? Container()
                                      : (dayName == 'Sat' || dayName == 'السبت') &&
                                              (index == 0 ||
                                                  index == 1 ||
                                                  index == 2 ||
                                                  index == 3 ||
                                                  index == 4 ||
                                                  index == 5)
                                          ? Container()
                                          : (dayName == 'Fri' || dayName == 'الجمعة') &&
                                                  (index == 0 ||
                                                      index == 1 ||
                                                      index == 2 ||
                                                      index == 3 ||
                                                      index == 4)
                                              ? Container()
                                              : BoxCalender(
                                                  '${date.day}',
                                                  isAvaliable: !date.isBefore(
                                                          dateBefore75Days) &&
                                                      !date.isAfter(
                                                          dateAfter75Days),
                                                  isSelected: isSameDay(date,
                                                      widget.selectedDate),
                                                  morningReserved: true,
                                                ));
            },
          ),
        ],
      ),
    );
  }

  String getDayName(DateTime date) {
    final DateFormat formatter = DateFormat('EE');
    final String formattedDay = formatter.format(date);
    return formattedDay;
  }

  List<DateTime> _getDaysInMonth(DateTime date) {
    final int year = date.year;
    final int month = date.month;
    final int daysInMonth = DateTime(year, month + 1, 0).day;

    return List<DateTime>.generate(
      daysInMonth,
      (int index) => DateTime(year, month, index + 1),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
