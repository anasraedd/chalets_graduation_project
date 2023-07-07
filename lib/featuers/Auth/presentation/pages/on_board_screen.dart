import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/featuers/Auth/presentation/widgets/board/board4.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/board/board1.dart';
import '../widgets/board/board2.dart';
import '../widgets/board/board3.dart';
import 'login_screen.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  final pages = [
    Board1(),
    Board2(),
    Board3(),
    Board4(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            pageSnapping: false,
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index];
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                if(index==3){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                }else{
                  controller.nextPage(
                      duration: Duration(milliseconds: 500), curve: Curves.ease);
                  index++;
                }
              },
              child: Container(
                height: 139.r,
                width: 80.r,

                margin: EdgeInsetsDirectional.only(bottom: 122.h),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(-1, 0),
                        blurRadius: 55,

                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(500000),
                      bottomLeft: Radius.circular(500000),
                    )),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 30.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                controller.jumpToPage(0);
              },
              child: Container(
                height: 25.h,
                width: 50.w,
                alignment: Alignment.center,
                margin: EdgeInsetsDirectional.only(top: 30.h, end: 20.w),
                decoration: BoxDecoration(
                    color: const Color(0xbf808080),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(
                  'skip'.tr(),
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 60.h),
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: WormEffect(
                  dotHeight: 10.r ,
                  dotWidth: 10.r,
                  type: WormType.thin,
                  dotColor: const Color(0xFF666666),
                  activeDotColor: Colors.white,
                  // strokeWidth: 5,
                ),
                onDotClicked: (index){
                  controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                 },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
// Stack(
// children: [
// Board1(),
// Align(
// alignment: Alignment.bottomRight,
// child: Container(
// height: 139.r,
// width: 80.r,
// margin: EdgeInsetsDirectional.only(bottom: 122.h),
// decoration:  const BoxDecoration(
// color: primaryColor,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(500000),
// bottomLeft: Radius.circular(500000),
// )),
// child: Icon(
// Icons.arrow_forward_rounded,
// color: Colors.white,
// size: 30.h,
// ),
//
// ),
// ),
// Align(
// alignment: Alignment.topRight,
// child: Container(
// height: 25.h,
// width: 50.w,
// alignment: Alignment.center,
// margin: EdgeInsetsDirectional.only(top: 30.h ,end: 20.w),
// decoration:   BoxDecoration(
// color: Color(0xbf808080),
// borderRadius: BorderRadius.circular(5.r)),
// child: Text(lang.skip,
// style: GoogleFonts.inter(
// color: Colors.white,
// fontSize: 13.sp,
// fontWeight: FontWeight.bold
// ),
// ),
//
// ),
// ),
// ],
// ),
