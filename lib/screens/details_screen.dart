import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/screens/calender_chalet_screen.dart';
import 'package:chalets/screens/description_chalet_screen.dart';
import 'package:chalets/screens/map_chalet_screen.dart';
import 'package:chalets/screens/terms_chalet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>  with SingleTickerProviderStateMixin {
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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();


    _tabController = TabController(length: 4, vsync: this);

  }

  @override
  void dispose() {
    // _animationController.dispose();
    // _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 350.h,
            child:
            Stack(
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
                    margin: EdgeInsets.symmetric(vertical: 50.h),
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.h, right: 30.w, left: 30.w),
                  child: Container(
                    height: 30.h,
                    child: Row(
                      children: [
                        Expanded(
                          child:
                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child:
                              Transform.flip(child: Icon(MyFlutterApp.back, color: Colors.white, size: 30, ),flipX: context.locale.languageCode == 'ar', )

                            // Image(
                            //   image: AssetImage("assets/icons/back.png"),
                            //   height: 30.h,
                            //   width: 30.h,
                            // ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Icon(MyFlutterApp.circle_share, color: Colors.white,size: 30,)
                        ),
                        Container(

                            child:  Icon(MyFlutterApp.circle_heart_outlined, color: Colors.white,size: 30,)
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

         Padding(padding: EdgeInsets.only(top: 100.h),
         child:     scroll(),

         )

         // buttonArrow(),
        ],
      ),
    );
  }
  
  
  scroll(){
    return DraggableScrollableSheet(
        initialChildSize: 0.8.h,
        maxChildSize: 1.1.h,
        minChildSize: 0.8.h,
        builder: (context, scrllController){
      
      return Container(
      //  padding: EdgeInsets.symmetric(horizontal: 20.w),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          color: Colors.white,

        ),

  child:
  Column(
    children: [
      Center(
        child: Center(
         // padding:  EdgeInsets.only(top: ),
          child: TabBar(

              controller: _tabController,
              isScrollable: true,
              overlayColor: MaterialStateProperty.all(primaryColor),
              labelColor: primaryColor,
              unselectedLabelColor: Color(0xFF454545),
              //indicatorWeight: 0,
              indicatorColor: Colors.transparent,

              //labelPadding: EdgeInsets.symmetric(horizontal: 0),
              labelStyle:
              TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              onTap: (int selectedTabIndex) {

              },
              tabs: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Tab(
                    text: 'description'.tr(),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Tab(
                    text: 'calendar'.tr(),
                  ),
                ),
                Padding(

                  padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Tab(
                    text: 'map'.tr(),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Tab(
                    text: 'terms'.tr(),
                  ),
                ),
              ]),
        ),
      ),
      Expanded(
        child: TabBarView(
            controller: _tabController,

            children: [
              DescriptionChaletScreen(scrllController),
              CalendarChaletScreen(),
              MapChaletScreen(),
              TermsChaletScreen(),

            ]),
      ),
    ],
  ),
      );
    });
  }
  // Widget buttonArrow(){
  //   return Container(
  //     height: 55,
  //     w
  //   );
  // }
}
