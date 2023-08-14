import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/get/calender_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BoxCalender extends StatefulWidget {
  String dateNumber;
  bool morningReserved;
  bool eveningReserved;
  bool isAvaliable;
  bool isAvaliableAfter;
  bool isSelected;
  bool chosenDay;
  bool disable;
  bool reseveMorning;

  BoxCalender(
    this.dateNumber, {
    this.morningReserved = false,
    this.eveningReserved = false,
    this.isAvaliable = false,
    this.isAvaliableAfter = false,
    this.isSelected = false,
    this.chosenDay = false,
    this.disable = false,
    this.reseveMorning = false,
  });

  @override
  State<BoxCalender> createState() => _BoxCalenderState();
}

class _BoxCalenderState extends State<BoxCalender> {
  final createChaletGetxController =
      Get.lazyPut<CalenderGetxController>(() => CalenderGetxController());

  @override
  Widget build(BuildContext context) {
    return widget.isAvaliable
        ? Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            widget.morningReserved && widget.eveningReserved
                ? 'assets/images/card_morning_and_evening_reserved.svg'
                : widget.morningReserved
                ? 'assets/images/card_morning_reserved.svg'
                : widget.eveningReserved
                ? 'assets/images/card_evening_reserved.svg' : widget.chosenDay
                ? 'assets/images/chose_day.svg'
                : 'assets/images/card_not_reserved.svg',
            width: 40.w,
            height: 40.w,
          ),
          /* Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),

                    gradient: LinearGradient(
                      colors: [
                        widget.morningReserved
                            ? Color(0xFF2C8095)
                            : widget.chosenDay ? Colors.grey : Colors.lightGreenAccent,
                        widget.eveningReserved
                            ? Color(0xFF2C8095)
                            : widget.chosenDay ? Colors.grey : Colors.lightGreenAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.5, 0.5],
                    ),

                  ),

                ),*/
        ),
        Center(
          child: Container(
            height: 25.w,
            width: 25.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                widget.isSelected ? Color(0xFFFF9A9A) : Colors.white),
            child: Center(
              child: Text(
                widget.dateNumber,
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    )
        : Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: widget.disable ? primaryColorDisable : primaryColor)),
        child: Center(
          child: Text(
            widget.dateNumber,
            style: TextStyle(fontSize: 20.sp, color:  widget.disable ? Colors.black26 : Colors.black),
            textAlign: TextAlign.center,

          ),
        ),
      ),
    );
  }
}



/*
widget.isAvaliable
        ? Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // CalenderGetxController.to.reseveMorning.value =
                  //     !CalenderGetxController.to.reseveMorning.value;
                  // CalenderGetxController.to.selectedDate.value =
                  //     widget.dateNumber.toString();
                  // setState(() {
                  //
                  // });
                  setState(() {
                    widget.reseveMorning = !widget.reseveMorning;
                  });
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 3.w, top: 3.h),
                    child: SvgPicture.asset(
                      'assets/images/morning_box_calender.svg', height: 37.w,
                      width: 37.w,
                      //CalenderGetxController.to.selectedDate.value == widget.dateNumber &&
                    //  color: widget.reseveMorning ? primaryColor : Colors.redAccent,
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 3.w, bottom: 3.h),
                  child: SvgPicture.asset(
                    'assets/images/evening_box_calender.svg',
                    height: 37.w,
                    width: 37.w,
                  ),
                ),
              ),

              // Center(
              //   child: SvgPicture.asset(
              //     widget.morningReserved && widget.eveningReserved
              //         ? 'assets/images/card_morning_and_evening_reserved.svg'
              //         : widget.morningReserved
              //             ? 'assets/images/card_morning_reserved.svg'
              //             : widget.eveningReserved
              //                 ? 'assets/images/card_evening_reserved.svg' : widget.chosenDay
              //         ? 'assets/images/chose_day.svg'
              //         : 'assets/images/card_not_reserved.svg',
              //     width: 40.w,
              //     height: 40.w,
              //   ),
              //   /* Container(
              //     height: 40.w,
              //     width: 40.w,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.r),
              //
              //       gradient: LinearGradient(
              //         colors: [
              //           widget.morningReserved
              //               ? Color(0xFF2C8095)
              //               : widget.chosenDay ? Colors.grey : Colors.lightGreenAccent,
              //           widget.eveningReserved
              //               ? Color(0xFF2C8095)
              //               : widget.chosenDay ? Colors.grey : Colors.lightGreenAccent,
              //         ],
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         stops: [0.5, 0.5],
              //       ),
              //
              //     ),
              //
              //   ),*/
              // ),
              // Center(
              //   child: Container(
              //     height: 25.w,
              //     width: 25.w,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color:
              //       Colors
              //           .white, //widget.isSelected ? Color(0xFFFF9A9A) : Colors.white),
              //     ),
              //     child: Center(
              //       child: Text(
              //         widget.dateNumber,
              //         style: TextStyle(fontSize: 16.sp),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // )
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1,
                      color:
                          widget.disable ? primaryColorDisable : primaryColor)),
              child: Center(
                child: Text(
                  widget.dateNumber,
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: widget.disable ? Colors.black26 : Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
 */