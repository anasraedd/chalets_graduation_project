import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/my_flutter_app_icons.dart';
import '../core/utils/my_behavior.dart';

class RandomSuggestion extends StatelessWidget {
  List<String> images;
  String titleChalet;
  String location;
  String rating;


  RandomSuggestion({required this.images,required this.titleChalet, required this.location, required this.rating});

  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 203.h,
      width: 280.w,
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
                height: 135.h,
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              // decoration: BoxDecoration(
                              //    // color: Colors.white,
                              //     borderRadius: BorderRadius.circular(17.r),
                              //     // boxShadow: [
                              //     //   BoxShadow(color: Colors.grey[400]!, blurRadius: 6),
                              //     // ]
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: images[index],


                                fit: BoxFit.cover,
                                placeholder: (context, url) => SpinKitFadingCircle(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
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
                  margin: EdgeInsets.symmetric(
                      vertical:  10.h, horizontal: 10.w
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
                                  titleChalet,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.5.sp,
                                  ),
                                ),
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
                                  location,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 7.5.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 15.h),

                        color: Colors.white,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //RATE
                            Center(child: Icon(Icons.star, color: Colors.amber,)),
                            // TEXT RATE
                            Text("8.6",

                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp
                              ),
                            ),



                          ],
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
                Icon(MyFlutterApp.circle_heart_outlined, color: Colors.white, size: 25,),

                // Image(
                //   image: AssetImage("assets/icons/favourites.png"),
                //   height: 30.h,
                //   width: 30.h,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
