import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/featuers/main/presentation/widgets/favourites_widget_item.dart';
import 'package:chalets/widgets/card_chalet_info.dart';
import 'package:chalets/widgets/random_suggestions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DescriptionChaletScreen extends StatefulWidget {
  // const DescriptionChaletScreen({Key? key}) : super(key: key);
  ScrollController scrollController;


  DescriptionChaletScreen(this.scrollController);

  @override
  State<DescriptionChaletScreen> createState() =>
      _DescriptionChaletScreenState();
}

class _DescriptionChaletScreenState extends State<DescriptionChaletScreen> {
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
  ];

  @override
  Widget build(BuildContext context) {
    return
      ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
        physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
        controller: widget.scrollController,
        children: [
          CardChaletInfo(
            isHsveBorder: true,
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: ExpandableContainer(
              title: 'description'.tr(),
              subtext:
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable, or randomised AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa',
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'facilities'.tr(),
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: 70.w,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Hide All',
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 35.w, vertical: 15.h),
            child: Facilitie(
              title: 'Living Rooms & Seatings ',
              data: [
                '• Main Living Room (Accommodates 12 Persons)',
                '• Outdoor Seating (Accommodates 24 Persons)',
                '• Additional Living Room (Accommodates 8 Persons)'
              ],
              icon: MyFlutterApp.living_rooms____seatings,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 35.w, vertical: 15.h),
            child: Facilitie(
              title: 'Bedrooms & Beds',
              data: [
                '• 2 Master Rooms (2 Double Beds)',
                '• 3 Boys Rooms (5 Single Beds & 1 Double Story Bed)',
                '• 1 Children Room (1 Single Bed & 1 Double Story Bed)'
              ],
              icon: MyFlutterApp.bed2,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 35.w, vertical: 15.h),
            child: Facilitie(
              title: 'Toilets',
              data: ['• 2 Master Toilets', '• 1 Guest Toilet'],
              icon: MyFlutterApp.fluent_emoji_high_contrast_toilet,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 35.w, vertical: 15.h),
            child: Facilitie(
              title: 'Kitchen',
              data: [
                '• Gas',
                '• Oven',
                '• Refrigerator',
                '• Pots',
                '• Kettles',
                '• Spoons & Forks',
              ],
              icon: MyFlutterApp.kitchen,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 35.w, vertical: 15.h),
            child: Facilitie(
              title: 'Grills',
              data: [
                '• Soggy Barrel',
                '• Grill (length 195 cm)',
                '• Taboon Oven',
              ],
              icon: MyFlutterApp.grills,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 30.w),
              child: Text('Random Suggestions (City)',    style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp
              ),)),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 230.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RandomSuggestion(
                    images: images,
                    titleChalet: 'Best Morocco Chalet',
                    location: 'Palestine - Gaza Strip - Gaza - AlRemal',
                    rating: '8.6'),
                RandomSuggestion(
                    images: images,
                    titleChalet: 'Best Morocco Chalet',
                    location: 'Palestine - Gaza Strip - Gaza - AlRemal',
                    rating: '8.6'),
                RandomSuggestion(
                    images: images,
                    titleChalet: 'Best Morocco Chalet',
                    location: 'Palestine - Gaza Strip - Gaza - AlRemal',
                    rating: '8.6')
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
    ),
      );
  }
}

class ExpandableContainer extends StatefulWidget {
  final String title;
  final String subtext;

  ExpandableContainer({required this.title, required this.subtext});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: RichText(
            text: TextSpan(
              text: widget.subtext.length > 217
                  ? widget.subtext
                      .substring(0, expanded ? widget.subtext.length : 217)
                  : widget.subtext,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.5.sp,
              ),
              children: [
                if (!expanded)
                  TextSpan(
                    text: 'more'.tr(),
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          expanded = true;
                        });
                      },
                  ),
                if (expanded)
                  TextSpan(
                    text: 'less'.tr(),
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          expanded = false;
                        });
                      },
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Facilitie extends StatefulWidget {
  IconData icon;
  String title;
  List<String> data;

  Facilitie({required this.title, required this.data, required this.icon});

  @override
  State<Facilitie> createState() => _FacilitieState();
}

class _FacilitieState extends State<Facilitie> {
  bool listIsVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(widget.icon),
            SizedBox(
              width: 7.w,
            ),
            Expanded(
              child: Text(
                widget.title,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            GestureDetector(
              child: Icon(Icons.keyboard_arrow_down_rounded),
              onTap: () {
                setState(() {
                  listIsVisibility = !listIsVisibility;
                });
              },
            )
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 35.w),
          child: Visibility(
            visible: listIsVisibility,
            child: Column(
              children: widget.data
                  .map((item) => Container(
                        margin: EdgeInsets.only(top: 12.h),
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        width: double.infinity,
                      ))
                  .toList(),
            ),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: data.length,
          //   itemBuilder: (BuildContext context, int index) {
          //
          //     return  Container(
          //       margin: EdgeInsets.only(top: 12.h),
          //       child: Text(
          //         data[index],
          //         style: GoogleFonts.inter(
          //           color: Colors.black,
          //           fontSize: 10.sp,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //
          //     );
          //   },
          // ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 35.w),
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(top: 12.h),
        //         child: Text(
        //           '• Main Living Room (Accommodates 12 Persons)',
        //           style: GoogleFonts.inter(
        //             color: Colors.black,
        //             fontSize: 10.sp,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //         width: double.infinity,
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 12.h),
        //         child: Text(
        //           '• Outdoor Seating (Accommodates 24 Persons)',
        //           style: GoogleFonts.inter(
        //             color: Colors.black,
        //             fontSize: 10.sp,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //         width: double.infinity,
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 12.h),
        //         child: Text(
        //           '• Additional Living Room (Accommodates 8 Persons)',
        //           style: GoogleFonts.inter(
        //             color: Colors.black,
        //             fontSize: 10.sp,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //         width: double.infinity,
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
