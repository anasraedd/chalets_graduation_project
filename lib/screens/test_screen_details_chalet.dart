import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/screens/terms_chalet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'calender_chalet_screen.dart';
import 'map_chalet_screen.dart';

class DetailsChaletScreen3 extends StatefulWidget {
  @override
  _DetailsChaletScreen3State createState() => _DetailsChaletScreen3State();
}

class _DetailsChaletScreen3State extends State<DetailsChaletScreen3>
    with SingleTickerProviderStateMixin {
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

  bool isOpen = false;
  late double dragStart;

  //double currentPosition = -20;
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

// عند تحميل البيانات أو بناء القائمة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        500,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // _animationController.dispose();
    // _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  double containerPosition = -40;

  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (containerPosition <= 0) {
        if ((containerPosition >= -800)) {
          containerPosition += details.delta.dy;
        } else {
          containerPosition = -300;
        }
        //  }else{
        //    containerPosition == -300;
        // }
        // }else{

        // }

      } else {
        containerPosition = -40;
      }
    });
  }

  void onVerticalDragEnd(DragEndDetails details) {
    setState(() {
      if (containerPosition < -150) {
        if (!(containerPosition < -300)) {
          containerPosition = -300;
        } else if (!(containerPosition < -400)) {
          containerPosition = -300;
        }
      } else {
        //  containerPosition = 200;
        // containerPosition = -300;

        containerPosition = -40;
        //  containerPosition = MediaQuery.of(context).size.height;
      }
    });
  }

  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

        ListView(
          controller: _scrollController,
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


            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0.h),
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
            Container(
              height: 550.h,
              child: TabBarView(
                  controller: _tabController,

                  children: [
                  //  DescriptionChaletScreen(),
                    CalendarChaletScreen(),
                   // MapChaletScreen(),
                    TermsChaletScreen(),

                  ]),
            ),
          ],
        ),


//       GestureDetector(
//         onVerticalDragUpdate:  containerPosition < -150 ?onVerticalDragUpdate: null,
//         onVerticalDragEnd: onVerticalDragEnd,
//
//         child: ListView(
// physics: NeverScrollableScrollPhysics(),
// // shrinkWrap: true,
//
//           // SizedBox(
//           //   height: 350.h,
//           //   child:
//           //   Stack(
//           //     children: [
//           //       ScrollConfiguration(
//           //         behavior: MyBehavior(),
//           //         child: PageView.builder(
//           //           scrollDirection: Axis.horizontal,
//           //           pageSnapping: true,
//           //           controller: controller,
//           //           itemCount: images.length,
//           //           itemBuilder: (_, index) {
//           //             return SizedBox(
//           //               height: double.infinity,
//           //               child: CachedNetworkImage(
//           //                 imageUrl: images[index],
//           //                 fit: BoxFit.cover,
//           //                 placeholder: (context, url) => SpinKitFadingCircle(
//           //                   color: Colors.blue,
//           //                   size: 50.0,
//           //                 ),
//           //               ),
//           //             );
//           //           },
//           //         ),
//           //       ),
//           //       Align(
//           //         alignment: Alignment.bottomCenter,
//           //         child: Container(
//           //           margin: EdgeInsets.symmetric(vertical: 50.h),
//           //           child: SmoothPageIndicator(
//           //             controller: controller,
//           //             count: images.length,
//           //             effect: ExpandingDotsEffect(
//           //                 dotHeight: 8.w,
//           //                 dotWidth: 8.w,
//           //                 dotColor: Colors.white,
//           //                 spacing: 5.w,
//           //                 activeDotColor: Colors.white),
//           //             onDotClicked: (index) {
//           //               controller.animateToPage(index,
//           //                   duration: const Duration(milliseconds: 500),
//           //                   curve: Curves.ease);
//           //             },
//           //           ),
//           //         ),
//           //       ),
//           //       Padding(
//           //         padding: EdgeInsets.only(top: 40.h, right: 30.w, left: 30.w),
//           //         child: Container(
//           //           height: 30.h,
//           //           child: Row(
//           //             children: [
//           //               Expanded(
//           //                 child:
//           //                 Container(
//           //                     alignment: AlignmentDirectional.topStart,
//           //                     child:
//           //                     Transform.flip(child: Icon(MyFlutterApp.back, color: Colors.white, size: 30, ),flipX: context.locale.languageCode == 'ar', )
//           //
//           //                   // Image(
//           //                   //   image: AssetImage("assets/icons/back.png"),
//           //                   //   height: 30.h,
//           //                   //   width: 30.h,
//           //                   // ),
//           //                 ),
//           //               ),
//           //               Container(
//           //                   margin: EdgeInsets.symmetric(horizontal: 10.w),
//           //                   child: Icon(MyFlutterApp.circle_share, color: Colors.white,size: 30,)
//           //               ),
//           //               Container(
//           //
//           //                   child:  Icon(MyFlutterApp.circle_heart_outlined, color: Colors.white,size: 30,)
//           //               ),
//           //
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //
//           //     ],
//           //   ),
//           // ),
//
//
//         children: [
//           SizedBox(
//             height: 350.h,
//             child:
//             Stack(
//               children: [
//                 ScrollConfiguration(
//                   behavior: MyBehavior(),
//                   child: PageView.builder(
//                     scrollDirection: Axis.horizontal,
//                     pageSnapping: true,
//                     controller: controller,
//                     itemCount: images.length,
//                     itemBuilder: (_, index) {
//                       return SizedBox(
//                         height: double.infinity,
//                         child: CachedNetworkImage(
//                           imageUrl: images[index],
//                           fit: BoxFit.cover,
//                           placeholder: (context, url) => SpinKitFadingCircle(
//                             color: Colors.blue,
//                             size: 50.0,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 50.h),
//                     child: SmoothPageIndicator(
//                       controller: controller,
//                       count: images.length,
//                       effect: ExpandingDotsEffect(
//                           dotHeight: 8.w,
//                           dotWidth: 8.w,
//                           dotColor: Colors.white,
//                           spacing: 5.w,
//                           activeDotColor: Colors.white),
//                       onDotClicked: (index) {
//                         controller.animateToPage(index,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.ease);
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.h, right: 30.w, left: 30.w),
//                   child: Container(
//                     height: 30.h,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child:
//                           Container(
//                               alignment: AlignmentDirectional.topStart,
//                               child:
//                               Transform.flip(child: Icon(MyFlutterApp.back, color: Colors.white, size: 30, ),flipX: context.locale.languageCode == 'ar', )
//
//                             // Image(
//                             //   image: AssetImage("assets/icons/back.png"),
//                             //   height: 30.h,
//                             //   width: 30.h,
//                             // ),
//                           ),
//                         ),
//                         Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10.w),
//                             child: Icon(MyFlutterApp.circle_share, color: Colors.white,size: 30,)
//                         ),
//                         Container(
//
//                             child:  Icon(MyFlutterApp.circle_heart_outlined, color: Colors.white,size: 30,)
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//
//           // Container(
//           //   height: 300.h,
//           // ),
//         Container(
//           // margin: EdgeInsets.only(top: 330),
//           child: GestureDetector(
//             onVerticalDragUpdate: onVerticalDragUpdate,
//             onVerticalDragEnd: onVerticalDragEnd,
//             child: Container(
//               // margin: EdgeInsets.only(top: 240.h),
//               // width: MediaQuery.of(context).size.width,
//               // height:  550.h,
// // color: Colors.transparent,
//               child: Transform.translate(
//                 offset: Offset(0, containerPosition),
//                 child: Container(
//                   // width: MediaQuery.of(context).size.width,
//                   //   height:  550.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.transparent,
//                   ),
//                   child:    Container(
//                     // margin: EdgeInsets.only(top: 320.h),
//                     decoration: BoxDecoration(
//                         color: scaffoldBackGround,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(30.r),
//                             topLeft: Radius.circular(30.r))),
//                     child: ListView(
//                         physics: containerPosition < -300 ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics() ,
//
//                        shrinkWrap: true,
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                             child: TabBar(
//
//                                 controller: _tabController,
//                                 isScrollable: true,
//                                 overlayColor: MaterialStateProperty.all(primaryColor),
//                                 labelColor: primaryColor,
//                                 unselectedLabelColor: Color(0xFF454545),
//                                 //indicatorWeight: 0,
//                                 indicatorColor: Colors.transparent,
//
//                                 //labelPadding: EdgeInsets.symmetric(horizontal: 0),
//                                 labelStyle:
//                                 TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
//                                 onTap: (int selectedTabIndex) {
//
//                                 },
//                                 tabs: [
//                                   Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                                     child: Tab(
//                                       text: 'description'.tr(),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                                     child: Tab(
//                                       text: 'calendar'.tr(),
//                                     ),
//                                   ),
//                                   Padding(
//
//                                     padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                                     child: Tab(
//                                       text: 'map'.tr(),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                                     child: Tab(
//                                       text: 'terms'.tr(),
//                                     ),
//                                   ),
//                                 ]),
//                           ),
//                         ),
//
//                         // Expanded(
//                         //   child:
//                         Container(
//                          height: 550.h,//containerPosition >= -200 ? 550.h:1700.h,
//                           child:
//                           TabBarView(
//                               controller: _tabController,
//
//                               children: [
//                                 DescriptionChaletScreen(),
//                                 CalendarChaletScreen(),
//                                 MapChaletScreen(),
//                                 TermsChaletScreen(),
//
//                               ]),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                   //  child:
//                   // Container(
//                   //
//                   //   child: Column(
//                   //     children: [
//                   //       Center(
//                   //         child: Padding(
//                   //           padding:  EdgeInsets.symmetric(vertical: 8.0.h),
//                   //           child: TabBar(
//                   //
//                   //               controller: _tabController,
//                   //               isScrollable: true,
//                   //               overlayColor: MaterialStateProperty.all(primaryColor),
//                   //               labelColor: primaryColor,
//                   //               unselectedLabelColor: Color(0xFF454545),
//                   //               //indicatorWeight: 0,
//                   //               indicatorColor: Colors.transparent,
//                   //               //labelPadding: EdgeInsets.symmetric(horizontal: 0),
//                   //               labelStyle:
//                   //               TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
//                   //               onTap: (int selectedTabIndex) {
//                   //
//                   //               },
//                   //               tabs: [
//                   //                 Tab(
//                   //                   text: 'description'.tr(),
//                   //                 ),
//                   //                 Tab(
//                   //                   text: 'calendar'.tr(),
//                   //                 ),
//                   //                 Tab(
//                   //                   text: 'map'.tr(),
//                   //                 ),
//                   //                 Tab(
//                   //                   text: 'terms'.tr(),
//                   //                 ),
//                   //               ]),
//                   //         ),
//                   //       ),
//                   //
//                   //       // Expanded(
//                   //       //   child: TabBarView(
//                   //       //       controller: _tabController,
//                   //       //       children: [
//                   //       //         DescriptionChaletScreen(),
//                   //       //         CalendarChaletScreen(),
//                   //       //         MapChaletScreen(),
//                   //       //         TermsChaletScreen(),
//                   //       //
//                   //       //   ]),
//                   //       // ),
//                   //     ],
//                   //   ),
//                   // )
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//
//
//
//
//           Container(
//         color: Colors.white,
//         child: ListView.builder(
//           shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 20,
//                 itemBuilder: (context, index){
//               return Column(
//                 children: [
//                   Container(
//                     height: 50,
//                     width:double.infinity,
//                     color: Colors.orange,
//
//                   ),
//                   SizedBox(height: 20,)
//                 ],
//               );
//             }),
//           )
//           //   ],
//           // ),
//
//          // Container(
//          //   //height: 550,
//          //   child: ListView(
//          //     physics: NeverScrollableScrollPhysics(),
//          //     shrinkWrap: true,
//          //     children: [
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.black,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.blue,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.green,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.red,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.black,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.blue,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.green,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.red,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.black,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.blue,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.green,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.red,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.black,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.orange,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.blue,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.green,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //       Container(
//          //         color: Colors.red,
//          //         height: 40,
//          //         width: double.infinity,
//          //       ),
//          //     ],
//          //   ),
//          // ),
//
//
// ]
//       ),
//       ),

        floatingActionButton:
    Row(children: [
    GestureDetector(
    onTap: ()
    {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    },
    child: Container(
    margin: EdgeInsets.only(top: 10.h),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/icons/back_more.png"),
    fit: BoxFit.cover)),
    padding: EdgeInsets.only(bottom: 5.h),
    height: 75.h,
    width: 75.w,
    child: Icon(
    _isExpanded ? Icons.close : Icons.more_horiz,
    // size: 35.r,
    color: Colors.white,
    ),
    ),
    ),
    SizedBox(width: 10.h,),
    Visibility(
    visible: _isExpanded,
    child: Container(
    margin: EdgeInsets.only(top: 10.h),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/icons/back_more.png"),
    fit: BoxFit.cover)),
    padding: EdgeInsets.only(bottom: 5.h),
    height: 65.h,
    width: 65.w,
    child: Align(
    alignment: AlignmentDirectional.center,
    child: Icon(
    MyFlutterApp.uil_calender,
    // size: 33.r,
    color: Colors.white,
    ),
    ),
    ),
    ),
    SizedBox(width: 10.h,),
    Visibility(
    visible: _isExpanded,
    child: Container(
    margin: EdgeInsets.only(top: 10.h),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage(
    "assets/icons/back_more.png",
    ),
    fit: BoxFit.cover,
    )),
    // padding: EdgeInsets.only(bottom: 4.h),
    height: 60.h,
    width: 60.w,
    child: Expanded(
    child: Center(
    child: Icon(
    MyFlutterApp.chat2,
    size: 24.r,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
    SizedBox(width: 10.h,),
    Visibility(
    visible: _isExpanded,
    child: Container(
    margin: EdgeInsets.only(top: 10.h),
    alignment: AlignmentDirectional.center,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/icons/back_more.png"),
    fit: BoxFit.cover)),
    // padding: EdgeInsets.only(bottom: 4.h),
    height: 55.h,
    width: 55.w,
    child: Align(
    alignment: AlignmentDirectional.center,
    child: Icon(
    MyFlutterApp.date_time,
    size: 24.r,
    color: Colors.white,
    ),
    ),
    ),
    ),
    SizedBox(width: 10.h,),
    Visibility(
    visible: _isExpanded && _tabController.index == 1,
    child: Container(
    margin: EdgeInsets.only(top: 10.h),
    alignment: AlignmentDirectional.center,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/icons/back_more.png"),
    fit: BoxFit.cover)),
    // padding: EdgeInsets.only(bottom: 4.h),
    height: 50.h,
    width: 50.w,
    child: Align(
    alignment: AlignmentDirectional.center,
    child: Icon(
    MyFlutterApp.info,
    size: 24.r,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ]),

    floatingActionButtonLocation
    :
    FloatingActionButtonLocation
    .
    startFloat
    ,
    );
  }


}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Draggable Container'),
//       ),
//       body: Center(
//         child: DraggableContainer(),
//       ),
//     ),
//   ));
// }
