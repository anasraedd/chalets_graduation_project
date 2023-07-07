// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chalets/anas/my_flutter_app_icons.dart';
// import 'package:chalets/anas/screens/calendar_chalet_screen.dart';
// import 'package:chalets/anas/screens/description_chalet_screen.dart';
// import 'package:chalets/anas/screens/map_chalet_screen.dart';
// import 'package:chalets/anas/screens/terms_chalet_screen.dart';
// import 'package:chalets/core/theme/app_theme.dart';
// import 'package:chalets/core/utils/my_behavior.dart';
// import 'package:chalets/featuers/main/presentation/widgets/favourites_widget_item.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
import 'package:flutter/material.dart';
class DetailsChaletScreen2 extends StatefulWidget {
  const DetailsChaletScreen2({Key? key}) : super(key: key);

  @override
  State<DetailsChaletScreen2> createState() => _DetailsChaletScreen2State();
}

class _DetailsChaletScreen2State extends State<DetailsChaletScreen2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class DetailsChaletScreen extends StatefulWidget {
//   const DetailsChaletScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DetailsChaletScreen> createState() => _DetailsChaletScreenState();
// }
//
// class _DetailsChaletScreenState extends State<DetailsChaletScreen>
//     with SingleTickerProviderStateMixin {
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//   final controller = PageController(
//     viewportFraction: 1,
//     keepPage: true,
//   );
//   late TabController _tabController;
//
//   bool isOpen = false;
//   late double dragStart;
//   double currentPosition = 0;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   late AnimationController _animationController;
//   late Animation<double> _expandAnimation;
//
//   bool _isExpanded = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _tabController = TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     // _animationController.dispose();
//     // _controller.dispose();
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void _toggleExpanded() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//     // if (_isExpanded) {
//     //
//     //   //_animationController.forward();
//     // } else {
//     //   //_animationController.reverse();
//     // }
//   }
//
//   double containerPosition = 0;
//
//   void onVerticalDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       if (containerPosition <= 0) {
//         containerPosition += details.delta.dy;
//       } else if (containerPosition <= -200) {
//         //
//         containerPosition = -300;
//       } else {
//         containerPosition = 0;
//       }
//     });
//   }
//
//   void onVerticalDragEnd(DragEndDetails details) {
//     setState(() {
//       if (containerPosition < 0) {
//         containerPosition = -300;
//       } else if (containerPosition > MediaQuery.of(context).size.height) {
//         //  containerPosition = 200;
//         // containerPosition = -300;
//
//         //  containerPosition = MediaQuery.of(context).size.height;
//       }
//     });
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // _controller = AnimationController(
//   //   //   vsync: this,
//   //   //   duration: Duration(milliseconds: 300),
//   //   // );
//   //   // _animation = CurvedAnimation(
//   //   //   parent: _controller,
//   //   //   curve: Curves.easeInOut,
//   //   // );
//   //
//   // }
//
//   // @override
//   // void dispose() {
//   //   _controller.dispose();
//   //   _tabController.dispose();
//   //   super.dispose();
//   // }
//
//   void toggleFragment() {
//     if (isOpen) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//     setState(() {
//       isOpen = !isOpen;
//     });
//   }
//
//   void onVerticalDragStart(DragStartDetails details) {
//     dragStart = details.globalPosition.dy;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent, // Set status bar color to transparent
//     ));
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             height: 350.h,
//             child: Stack(
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
//                           child: Container(
//                               alignment: AlignmentDirectional.topStart,
//                               child: Transform.flip(
//                                 child: Icon(
//                                   MyFlutterApp.back,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 flipX: context.locale.languageCode == 'ar',
//                               )
//
//                               // Image(
//                               //   image: AssetImage("assets/icons/back.png"),
//                               //   height: 30.h,
//                               //   width: 30.h,
//                               // ),
//                               ),
//                         ),
//                         Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10.w),
//                             child: Icon(
//                               MyFlutterApp.circle_share,
//                               color: Colors.white,
//                               size: 30,
//                             )),
//                         Container(
//                             child: Icon(
//                           MyFlutterApp.circle_heart_outlined,
//                           color: Colors.white,
//                           size: 30,
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListView(
//             shrinkWrap: true,
//
//             children: [
//               Container(height: 350.h,
//                   color: Colors.transparent),
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.0.h),
//                   child: TabBar(
//                       controller: _tabController,
//                       isScrollable: true,
//                       overlayColor: MaterialStateProperty.all(primaryColor),
//                       labelColor: primaryColor,
//                       unselectedLabelColor: Color(0xFF454545),
//                       //indicatorWeight: 0,
//                       indicatorColor: Colors.transparent,
//                       //labelPadding: EdgeInsets.symmetric(horizontal: 0),
//                       labelStyle: TextStyle(
//                           fontSize: 17.sp, fontWeight: FontWeight.bold),
//                       onTap: (int selectedTabIndex) {},
//                       tabs: [
//                         Tab(
//                           text: 'description'.tr(),
//                         ),
//                         Tab(
//                           text: 'calendar'.tr(),
//                         ),
//                         Tab(
//                           text: 'map'.tr(),
//                         ),
//                         Tab(
//                           text: 'terms'.tr(),
//                         ),
//                       ]),
//                 ),
//               ),
//               TabBarView(controller: _tabController, children: [
//                 DescriptionChaletScreen(),
//                 CalendarChaletScreen(),
//                 MapChaletScreen(),
//                 TermsChaletScreen(),
//               ]),
//
//
//
//                   ])
//             ],
//           ),
//
//
//
//       floatingActionButton:
//           // Container(
//           //   margin: EdgeInsets.only(top: 10.h),
//           //   decoration: const BoxDecoration(
//           //       image: DecorationImage(
//           //           image: AssetImage("assets/icons/back_more.png"),
//           //           fit: BoxFit.cover)),
//           //   padding: EdgeInsets.only(bottom: 8.h),
//           //   height: 70.h,
//           //   width: 70.w,
//           //   child: Icon(
//           //     Icons.more_horiz,
//           //     size: 33.r,
//           //     color: Colors.white,
//           //   ),
//           // ),
//           Row(children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: Container(
//             margin: EdgeInsets.only(top: 10.h),
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/icons/back_more.png"),
//                     fit: BoxFit.cover)),
//             padding: EdgeInsets.only(bottom: 5.h),
//             height: 75.h,
//             width: 75.w,
//             child: Icon(
//               _isExpanded ? Icons.close : Icons.more_horiz,
//               // size: 35.r,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Visibility(
//           visible: _isExpanded,
//           child: Container(
//             margin: EdgeInsets.only(top: 10.h),
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/icons/back_more.png"),
//                     fit: BoxFit.cover)),
//             padding: EdgeInsets.only(bottom: 5.h),
//             height: 65.h,
//             width: 65.w,
//             child: Align(
//               alignment: AlignmentDirectional.center,
//               child: Icon(
//                 MyFlutterApp.uil_calender,
//                 // size: 33.r,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: _isExpanded,
//           child: Container(
//             margin: EdgeInsets.only(top: 10.h),
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage(
//                 "assets/icons/back_more.png",
//               ),
//               fit: BoxFit.cover,
//             )),
//             // padding: EdgeInsets.only(bottom: 4.h),
//             height: 60.h,
//             width: 60.w,
//             child: Expanded(
//               child: Center(
//                 child: Icon(
//                   MyFlutterApp.chat2,
//                   size: 24.r,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: _isExpanded,
//           child: Container(
//             margin: EdgeInsets.only(top: 10.h),
//             alignment: AlignmentDirectional.center,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/icons/back_more.png"),
//                     fit: BoxFit.cover)),
//             // padding: EdgeInsets.only(bottom: 4.h),
//             height: 55.h,
//             width: 55.w,
//             child: Align(
//               alignment: AlignmentDirectional.center,
//               child: Icon(
//                 MyFlutterApp.date_time,
//                 size: 24.r,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ]),
//       // body: Stack(
//       //   children: [
//       //     // Your other widgets here
//       //   ],
//       // ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//     );
//   }
// }
