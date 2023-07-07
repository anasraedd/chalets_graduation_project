import 'dart:ui';

import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/calender_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/conversations_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/favorite_page.dart';
import 'package:chalets/models/bn_screen.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import 'main_screen_pages/home_page.dart';
import 'main_screen_pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(title: 'Profile', widget: ProfilePage()),
    BnScreen(title: 'Calender', widget: CalenderPage()),
    BnScreen(title: 'Home', widget: HomePage()),
    BnScreen(title: 'Conversations', widget: ConversationsPage()),
    BnScreen(title: 'Favourites', widget: FavoriteScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    //var lang = AppLocalizations.of(context)!;
    // if (_currentIndex == 2) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor:
    //         Colors.transparent, // Set status bar color to transparent
    //   ));
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: primaryColor, // Set status bar color to transparent
    //   ));
    // }
    return Scaffold(
      appBar: (_currentIndex == 4)
          ? AppBar(
              backgroundColor: primaryColor,
              shadowColor: primaryColor,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),

              toolbarHeight: 80.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35.r),
                  bottomLeft: Radius.circular(35.r),
                ),
              ),
              title: Text(
                'favourites'.tr(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25.sp,
                ),
              ),
            )
          : (_currentIndex == 0)
              ? AppBar(
                  backgroundColor: primaryColor,
                  shadowColor: primaryColor,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: primaryColor,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness:
                        Brightness.light, // For iOS (dark icons)
                  ),
                  toolbarHeight: 80.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35.r),
                      bottomLeft: Radius.circular(35.r),
                    ),
                  ),
                  title: Text(
                    'profile'.tr(),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25.sp,
                    ),
                  ),
                  leading: Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Container(
                          width: 28.w,
                          height: 26.w,
                          child: const Image(
                            image:
                                AssetImage("assets/images/profileReplace.png"),
                          ),
                        ),
//profileReplace.png
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          child: Container(
                            width: 28.w,
                            height: 28.w,
                            child: const Image(
                              image:
                                  AssetImage("assets/images/profileMore.png"),
                            ),
                          ),
//profileReplace.png
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                      ],
                    )
                  ],
                )
              : (_currentIndex == 1)
                  ? AppBar(
                      backgroundColor: primaryColor,
                      shadowColor: primaryColor,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: primaryColor,
                        statusBarIconBrightness: Brightness.light,
                        statusBarBrightness:
                            Brightness.light, // For iOS (dark icons)
                      ),
                      toolbarHeight: 80.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(35.r),
                          bottomLeft: Radius.circular(35.r),
                        ),
                      ),
                      title: Text(
                        'calender'.tr(),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25.sp,
                        ),
                      ),
                      leading: InkWell(
                        onTap: () {
                          _showBlurredDialog(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          margin: EdgeInsetsDirectional.only(bottom: 18.h, start: 30.w),
                          width: 35.w,
                          height: 35.w,
                          child: const Image(
                            image: AssetImage("assets/icons/directions.png"),
                          ),
                        ),
//profileReplace.png
                      ),
                    )
                  : (_currentIndex == 3)
                      ? AppBar(
                          backgroundColor: primaryColor,
                          shadowColor: primaryColor,
                          systemOverlayStyle: const SystemUiOverlayStyle(
                            statusBarColor: primaryColor,
                            statusBarIconBrightness: Brightness.light,
                            statusBarBrightness:
                                Brightness.light, // For iOS (dark icons)
                          ),
                          toolbarHeight: 80.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(35.r),
                              bottomLeft: Radius.circular(35.r),
                            ),
                          ),
                          title: Text(
                            'conversations'.tr(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25.sp,
                            ),
                          ),
                        )
                      : null,
      body: SafeArea(
        child: _bnScreen[_currentIndex].widget,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/FTBPK.png"),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.only(bottom: 8.h),
          height: 70.h,
          width: 70.w,
          child: Icon(
            Icons.home_rounded,
            size: 33.r,
            color: Colors.white,
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
                activeIcon: Image(
                  image: const AssetImage("assets/icons/profileActive.png"),
                  height: 24.h,
                  width: 24.w,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/profileUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image(
                  image: const AssetImage("assets/icons/calenderUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                  color: primaryColor,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/calenderUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Container(),
              label: "",
            ),
            BottomNavigationBarItem(
                activeIcon: Image(
                  image: const AssetImage("assets/icons/chatUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                  color: primaryColor,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/chatUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image(
                  image: const AssetImage("assets/icons/likeUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                  color: primaryColor,
                ),
                icon: Image(
                  image: const AssetImage("assets/icons/likeUnActive.png"),
                  height: 24.h,
                  width: 24.w,
                ),
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
                            'notReserved'.tr(),
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
                            'morningReserved'.tr(),
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
                            'eveningReserved'.tr(),
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
                                'morningAndEveningReserved'.tr(),
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
                                'chosenDay'.tr(),
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
                            'dayNotDisplay'.tr(),
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
