import 'package:chalets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderNotificationsWidget extends StatelessWidget {
  const OrderNotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text(
                      'Visitor Data',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.5.sp,
                          color: Colors.black),
                    ),
                    Expanded(child: Container()),
                    SvgPicture.asset(
                      'assets/icons/calender_directions.svg',
                      color: Color(0xFFFFB703),
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '#519566',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: Color(0xFFFFB703)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Name',
                      style: GoogleFonts.inter(fontSize: 15.sp),
                    )),
                    Expanded(
                        child: Text(
                      'Anas Aldrfeel',
                      style: GoogleFonts.inter(
                          fontSize: 15.sp, color: secondaryColor),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Phone Number',
                        style: GoogleFonts.inter(fontSize: 15.sp),
                      )),
                      Expanded(
                          child: Text(
                        '+970595508034',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Visitor Rating',
                        style: GoogleFonts.inter(fontSize: 15.sp),
                      )),
                      Expanded(
                          child: Text(
                        '9 / 10 (5)',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Check-In Date',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: Colors.green),
                      )),
                      Expanded(
                          child: Text(
                        'Check-In Time',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: Colors.green),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Visitor Rating',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      Expanded(
                          child: Text(
                        '9 / 10 (5)',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Check-In Date',
                        style:
                            GoogleFonts.inter(fontSize: 15.sp, color: Colors.red),
                      )),
                      Expanded(
                          child: Text(
                        'Check-In Time',
                        style:
                            GoogleFonts.inter(fontSize: 15.sp, color: Colors.red),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Visitor Rating',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      Expanded(
                          child: Text(
                        '9 / 10 (5)',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 5.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Contact with the Visitor',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      SvgPicture.asset('assets/icons/contact.svg'),
                      SizedBox(
                        width: 15.w,
                      ),
                      SvgPicture.asset('assets/icons/message.svg'),
                      SizedBox(
                        width: 40.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 60.h,
                  child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                  ),child: Text('Cancel', style: GoogleFonts.roboto(
                    fontSize: 17.sp, fontWeight: FontWeight.w700, color: Colors.white
                  ),)),
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: SizedBox(
                    // width: 100.w,
                    height: 60.h,
                    child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2DC653)// Colors.green,

                    ),child: Text('Cancel', style: GoogleFonts.roboto(
                        fontSize: 17.sp, fontWeight: FontWeight.w700, color: Colors.white
                    ),)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
