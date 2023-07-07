import 'package:chalets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardChaletInfo extends StatelessWidget {
  bool isHsveBorder = false;

  CardChaletInfo({super.key, this.isHsveBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only( left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(17.r),
          boxShadow: !isHsveBorder
              ? [
                  BoxShadow(color: Colors.grey[400]!, blurRadius: 6),
                ]
              : null,
          border: isHsveBorder
              ? Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: primaryColor)
              : null),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                          margin:
                              EdgeInsets.only(top: 8.h, bottom: 8.h, left: 4.w),
                          child: ClipOval(
                            child: Divider(
                              color: const Color(0xFF017C9B),
                              thickness: 1.1.h,
                              height: 2,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                  "assets/images/area_icon.png"),
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            //Area Text
                            RichText(
                              text: TextSpan(
                                  text: "Unit Area ",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "1006",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " m",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                  "assets/images/map_icon.png"),
                              height: 16.h,
                              width: 16.h,
                            ),
                            SizedBox(
                              width: 15.w,
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
                  Container(
                    height: 100.h,
                    width: 75.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.sp),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8.r,
                              offset: const Offset(0, 0),
                              color: Color(0x40000000))
                        ]),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      color: const Color(0x40EEEEEE),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //RATE
                          Text(
                            "8.6",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25.sp),
                          ),
                          // TEXT RATE
                          Text(
                            "Excellent",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "130 Reviews",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
