import 'dart:ui';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/calender_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/conversations_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/favorite_page.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/models/bn_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/widgets/admin_calender_page.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/widgets/admin_conversations_page.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/widgets/admin_home_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/widgets/notifications_screen.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class MainAdminScreen extends StatefulWidget {
  late int id;


  MainAdminScreen({required this.id});
  @override
  State<MainAdminScreen> createState() => _MainAdminScreenState();
}

class _MainAdminScreenState extends State<MainAdminScreen> {
  int _currentIndex = 4;
  late List<BnScreen> _bnScreen;
  @override
  void initState() {
  _bnScreen = <BnScreen>[
      BnScreen(title: 'Notifications', widget: NotificationsScreen()),
      BnScreen(title: 'Conversations', widget: AdminConversationsPage()),
      BnScreen(title: 'Favourites', widget: Container()),

      BnScreen(title: 'Calender', widget: AdminCalenderPage()),
      BnScreen(title: 'Home', widget: AdminHomeScreen(id: widget.id,)),

    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);
    return Scaffold(

//       appBar: (_currentIndex == 4)
//           ? AppBar(
//         backgroundColor: primaryColor,
//         shadowColor: primaryColor,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: primaryColor,
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness: Brightness.light, // For iOS (dark icons)
//         ),
//
//         toolbarHeight: 80.h,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(35.r),
//             bottomLeft: Radius.circular(35.r),
//           ),
//         ),
//         title: Text(
//           'favourites'.tr(),
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 25.sp,
//           ),
//         ),
//       )
//           : (_currentIndex == 0)
//           ? AppBar(
//         backgroundColor: primaryColor,
//         shadowColor: primaryColor,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: primaryColor,
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness:
//           Brightness.light, // For iOS (dark icons)
//         ),
//         toolbarHeight: 80.h,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(35.r),
//             bottomLeft: Radius.circular(35.r),
//           ),
//         ),
//         title: Text(
//           'profile'.tr(),
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 25.sp,
//           ),
//         ),
//         leading: Row(
//           children: [
//             SizedBox(
//               width: 30.w,
//             ),
//             InkWell(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               focusColor: Colors.transparent,
//               child: Container(
//                 width: 28.w,
//                 height: 26.w,
//                 child: const Image(
//                   image:
//                   AssetImage("assets/images/profileReplace.png"),
//                 ),
//               ),
// //profileReplace.png
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             children: [
//               InkWell(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 focusColor: Colors.transparent,
//                 child: Container(
//                   width: 28.w,
//                   height: 28.w,
//                   child: const Image(
//                     image:
//                     AssetImage("assets/images/profileMore.png"),
//                   ),
//                 ),
// //profileReplace.png
//               ),
//               SizedBox(
//                 width: 30.w,
//               ),
//             ],
//           )
//         ],
//       )
//           : (_currentIndex == 1)
//           ? AppBar(
//         backgroundColor: primaryColor,
//         shadowColor: primaryColor,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: primaryColor,
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness:
//           Brightness.light, // For iOS (dark icons)
//         ),
//         toolbarHeight: 80.h,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(35.r),
//             bottomLeft: Radius.circular(35.r),
//           ),
//         ),
//         title: Text(
//           'calender'.tr(),
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 25.sp,
//           ),
//         ),
//         leading: InkWell(
//           onTap: () {
//             _showBlurredDialog(context);
//           },
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           focusColor: Colors.transparent,
//           child: Container(
//             alignment: AlignmentDirectional.bottomCenter,
//             margin: EdgeInsetsDirectional.only(bottom: 18.h, start: 30.w),
//             width: 35.w,
//             height: 35.w,
//             child: const Image(
//               image: AssetImage("assets/icons/directions.png"),
//             ),
//           ),
// //profileReplace.png
//         ),
//       )
//           : (_currentIndex == 3)
//           ? AppBar(
//         backgroundColor: primaryColor,
//         shadowColor: primaryColor,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: primaryColor,
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness:
//           Brightness.light, // For iOS (dark icons)
//         ),
//         toolbarHeight: 80.h,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(35.r),
//             bottomLeft: Radius.circular(35.r),
//           ),
//         ),
//         title: Text(
//           'conversations'.tr(),
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 25.sp,
//           ),
//         ),
//       )
//           : null,
      body: SafeArea(
        child: _bnScreen[_currentIndex].widget,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            // _currentIndex = 2;
            Get.off(MainScreen());
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/FTBPK.png"),
                  fit: BoxFit.cover)),
          padding: EdgeInsetsDirectional.only(top: 18.w, bottom: 22.w, start: 18.w, end: 18.w),
          height: 70.h,
          width: 70.w,
          child:   Center(
            // height: 40,
            // width: 40,
            child: Image(
              image:
              AssetImage("assets/images/profileReplace.png",),

            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 65.h,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          onTap: (int selectedItemIndex) {
            if (selectedItemIndex != 2) {
              setState(() {
                _currentIndex = selectedItemIndex;
              });
            }
          },
          selectedIconTheme: IconThemeData(color: primaryColor),
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined, size: 25,),
                // Image(
                //   image: const AssetImage("assets/icons/profileActive.png"),
                //   height: 24.h,
                //   width: 24.w,
                // ),
                // icon: Image(
                //   image: const AssetImage("assets/icons/profileUnActive.png"),
                //   height: 24.h,
                //   width: 24.w,
                // ),
                label: ""),



            BottomNavigationBarItem(
                activeIcon: Image(
                  image: const AssetImage("assets/icons/chatUnActive.png"),
                  height: 25.h,
                  width: 25.w,
                  color: primaryColor,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/chatUnActive.png"),
                  height: 25.h,
                  width: 25.w,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Container(),
              label: "",
            ),


            BottomNavigationBarItem(
                activeIcon: Image(
                  image: const AssetImage("assets/icons/calenderUnActive.png"),
                  height: 25.h,
                  width: 25.w,
                  color: primaryColor,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/calenderUnActive.png"),
                  height: 25.h,
                  width: 25.w,
                ),
                label: ""),
            BottomNavigationBarItem(
                // activeIcon: Image(
                //   image: const AssetImage("assets/icons/likeUnActive.png"),
                //   height: 24.h,
                //   width: 24.w,
                //   color: primaryColor,
                // ),
                icon: SvgPicture.asset('assets/icons/home_icon.svg',  height: 25.h,
                  width: 25.w,),
                activeIcon: SvgPicture.asset('assets/icons/home_icon.svg', color: primaryColor,  height: 25.h,
                  width: 25.w,),
                //Icon(Icons.home_outlined, size: 27,),
                // Image(
                //   image: const AssetImage("assets/icons/likeUnActive.png"),
                //   height: 24.h,
                //   width: 24.w,
                // ),
                label: ""),
          ],
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

void _showBlurredDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(20.0),

            child: Stack(children: <Widget>[
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.transparent,
                    // child: Column(
                    //   children: [
                    //     Container(
                    //     //  height: 40.w,
                    //       //width: 40.w,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //
                    //         children: [
                    //       BoxCalender('4', isAvaliable: true,),
                    //
                    //           Expanded(child: Text('notReserved'.tr())),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(
                            '',
                            isAvaliable: true,
                          ),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                          child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                               lang.tr( 'notReserved'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height:
                                  1.2, // Adjust this value to reduce line spacing
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(
                            '',
                            isAvaliable: true,
                            morningReserved: true,
                          ),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                          child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                              lang.tr('morningReserved'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height:
                                  1.2, // Adjust this value to reduce line spacing
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(
                            '',
                            isAvaliable: true,
                            eveningReserved: true,
                          ),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                          child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                lang.tr('eveningReserved'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height:
                                  1.2, // Adjust this value to reduce line spacing
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(
                            '',
                            isAvaliable: true,
                            morningReserved: true,
                            eveningReserved: true,
                          ),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                               lang.tr( 'morningAndEveningReserved'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 1.2,
                                ),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(
                            '',
                            isAvaliable: true,
                            isSelected: true,
                            chosenDay: true,
                          ),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                          child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                               lang.tr('chosenDay'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height:
                                  1.2, // Adjust this value to reduce line spacing
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: BoxCalender(''),
                          height: 50.w,
                          width: 50.w,
                        ),
                        Expanded(
                          child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                lang.tr('dayNotDisplay'),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height:
                                  1.2, // Adjust this value to reduce line spacing
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]));
      });
}

