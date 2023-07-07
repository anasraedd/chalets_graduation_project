import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../screens/detailed_search_screen.dart';

class FavouritesWidgetItem extends StatelessWidget {
  FavouritesWidgetItem({Key? key}) : super(key: key);
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
"https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
  ];
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 410.h,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.r),
          boxShadow: [
            BoxShadow(color: Colors.grey[400]!, blurRadius: 6),
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 280.h,
                child: Stack(
                  children: [
                    ScrollConfiguration(
                    behavior: MyBehavior(),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        controller: controller,
                        itemCount: images.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                            height: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: images[index],
                               fit: BoxFit.cover,
                              placeholder: (context, url) => SpinKitFadingCircle(
                                color: Colors.blue,
                                size: 50.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: images.length,
                          effect: ExpandingDotsEffect(
                              dotHeight: 8.w,
                              dotWidth: 8.w,
                              dotColor: Colors.white,
                              spacing: 5.w,
                              activeDotColor: Colors.white),
                          onDotClicked: (index) {
                            controller.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                            Row(                              crossAxisAlignment: CrossAxisAlignment.center,
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
                          padding: EdgeInsets.symmetric(vertical: 15.h),

                          height: double.infinity,
                          width: double.infinity,
                          color: const Color(0x40EEEEEE),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //RATE
                              Text("8.6",

                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.sp
                                ),
                              ),
                              // TEXT RATE
                              Text("Excellent",

                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Text("130 Reviews",

                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp
                                ),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage("assets/icons/shareIcon.png"),
                  height: 30.h,
                  width: 30.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
