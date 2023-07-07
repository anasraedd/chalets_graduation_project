import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({Key? key}) : super(key: key);

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 80.h,
        title: RichText(
          text: TextSpan(
            text: 'Prices / Day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
            ),
            children: [
              TextSpan(
                text: ' / Half Day',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
        // Text(
        //   'Prices / Day/',
        //   style: GoogleFonts.inter(
        //     fontSize: 25.sp,
        //     fontWeight: FontWeight.w600,
        //     color: Colors.white,
        //   ),
        // ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            MyFlutterApp.back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, right: 45.w, left: 45.w),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/prices_in_days.svg', height: 62.h,),
                SizedBox(
                  width: 30.w,
                ),
                // SvgPicture.asset('assets/images/prices_in_days.svg'),
                // SvgPicture.asset('assets/images/prices_in_days.svg'),
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8.r)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'AM',
                        style: GoogleFonts.inter(
                          fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '8:00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          children: [
                            TextSpan(
                              text: ' am',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: ' to 7:00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: ' pm',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w,),
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(8.r)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'PM',
                        style: GoogleFonts.inter(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '8:00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          children: [
                            TextSpan(
                              text: ' pm',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: ' to 7:00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: ' am',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: 25.h,),
            PricesInAMAndPM(dayName: 'Saturday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Sunday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Monday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Tuesday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Wednesday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Thursday', priceInAM: 500.toString(), priceInPM: 550.toString()),
            SizedBox(height: 5.h,),
            PricesInAMAndPM(dayName: 'Friday', priceInAM: 500.toString(), priceInPM: 550.toString()),

          ],
        ),
      ),
    );
  }
}

class PricesInAMAndPM extends StatelessWidget {

  final String dayName;
  final String priceInAM;
  final String priceInPM;


  PricesInAMAndPM({required this.dayName, required this.priceInAM, required this.priceInPM});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(8.r),  bottomEnd: Radius.circular(8.r)),
          ),
          child:  Center(
            child: Text(
              dayName,
              style: GoogleFonts.inter(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),

        ),
        SizedBox(width: 30.w,),
        Container(
          height: 50.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: scaffoldBackGround,
            borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(8.r),  topEnd: Radius.circular(8.r)),
         border: Border.all(color: secondaryColor, width: 3)
          ),
          child:  Center(
            child: Text(
              '${priceInAM} \$',
              style: GoogleFonts.inter(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),

        ),
        SizedBox(width: 10.w,),
        Container(
          height: 50.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: scaffoldBackGround,
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(8.r),  topEnd: Radius.circular(8.r)),
              border: Border.all(color: secondaryColor, width: 3)
          ),
          child:  Center(
            child: Text(
              '$priceInPM \$',
              style: GoogleFonts.inter(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),

        ),
      ],
    );
  }
}
