
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/get/calender_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BoxCalenderInReservation extends StatelessWidget {
  String dateNumber;
  bool morningReserved;
  bool eveningReserved;
  bool morningSelectToReservation;
  bool eveningSelectToReservation;
  bool isAvaliable;
  bool isAvaliableAfter;
  bool isSelected;
  bool chosenDay;
  bool disable;
  bool reseveMorning;
  //void Function(String value) onClicked;
  //bool isClick = false;

  /*
  GestureDetector(
      onTap: (){
            // (String value){
        // widget.onClicked;
       // if( widget.onClicked != null){
         onClicked(dateNumber);
         // isClick = true;

       // }

      },
   */

  BoxCalenderInReservation(
      this.dateNumber, {
        this.morningReserved = false,
        this.eveningReserved = false,
        this.isAvaliable = false,
        this.isAvaliableAfter = false,
        this.morningSelectToReservation = false,
        this.eveningSelectToReservation = false ,
        this.isSelected = false,
        this.chosenDay = false,
        this.disable = false,
        this.reseveMorning = false,
       // required this.onClicked,
      });

  // final createChaletGetxController =
  @override
  Widget build(BuildContext context) {
    return isAvaliable
        ? SizedBox(
      height: 45.w,
      width: 45.w,
          child: Stack(
      children: [
          Center(
            child: SvgPicture.asset(
              morningReserved && eveningReserved
                  ? 'assets/images/morning_and_evening_reservation.svg'  :
              morningSelectToReservation && eveningSelectToReservation
                  ? 'assets/images/select_morning&evening.svg' :
              eveningReserved && morningSelectToReservation ? 'assets/images/evening_reserved&morning_select_to_reservation.svg':
              morningReserved && eveningSelectToReservation ? 'assets/images/mornning_reserved&evening_selected.svg' :
              // morningSelectToReservation && !eveningSelectToReservation
              //     ? 'assets/images/morning_select.svg':

              eveningReserved && !morningReserved
                  ? 'assets/images/evening_reseved.svg' :
              morningReserved && !eveningReserved
                  ? 'assets/images/morning_reseved.svg'

                  : eveningSelectToReservation && !morningSelectToReservation
                  ? 'assets/images/evening_select.svg' :    morningSelectToReservation && !eveningSelectToReservation
                  ? 'assets/images/morning_select.svg'
                  // : eveningSelectToReservation
                  // ? 'assets/images/card_evening_reserved.svg'

                  : 'assets/images/not_reseved.svg',
              height: 45.w,
              width: 45.w,


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
              height: 30.w,
              width: 30.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F8FF)),
              child: Center(
                child: Text(
                  dateNumber,
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
      ],
    ),
        )
        : Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: disable ? primaryColorDisable : primaryColor)),
        child: Center(
          child: Text(
            dateNumber,
            style: TextStyle(fontSize: 20.sp, color:  disable ? Colors.black26 : Colors.black),
            textAlign: TextAlign.center,

          ),
        ),
      ),
    );
  }
}


