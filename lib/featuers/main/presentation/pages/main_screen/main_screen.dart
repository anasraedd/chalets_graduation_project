import 'dart:core';
import 'dart:ui';

import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/calender_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/conversations_page.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen_pages/favorite_page.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/bn_screen.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import 'main_screen_pages/home_page.dart';
import 'main_screen_pages/profile_page.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Helpers {
  int _currentIndex = 2;

  List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(title: 'Profile', widget: ProfilePage()),
    BnScreen(title: 'Calender', widget: CalenderPage()),
    BnScreen(title: 'Home', widget: HomePage()),
    BnScreen(title: 'Conversations', widget: ConversationsPage()),
    BnScreen(title: 'Favourites', widget: FavoriteScreen()),
  ];

  bool isShowEnabledEmail = SharedPrefController().getValueFor<bool>(key: PrefKeys.emailEnabled.name) ?? false;
  bool   loadingSendVerify = false;


  @override
  void initState() {
    // TODO: implement initState
    if(SharedPrefController().getValueFor<bool>(key: PrefKeys.emailEnabled.name) == false || SharedPrefController().getValueFor<bool>(key: PrefKeys.emailEnabled.name) == null){
      isShowEnabledEmail = true;
      // showSnackBarForEmail(title: 'Enable Email');
    }else{
      isShowEnabledEmail = false;

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      // showDialog(
      //   context: context,
      //   builder: (BuildContext dialogContext) => AlertDialog(
      //     content: GestureDetector(
      //       onTap: () {
      //  showSnackBarForEmail(title: 'Email Enabled', mainButton: TextButton(onPressed: () async {

      // ApiResponse apiResponse = await AuthApiController().sendEmailVerify();
      // print('${apiResponse.message}');
      // if(apiResponse.success){
      //   Get.back();
      // }
      // setState(() {
      //   isShowEnabledEmail =false;
      // });

      // }, child: Text('Enable', style: GoogleFonts.inter(color: Colors.greenAccent, fontWeight: FontWeight.bold),)));

      //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //           content: const Text('snack'),
      //           duration: const Duration(days: 3),
      //           action: SnackBarAction(
      //             label: 'ACTION',
      //             onPressed: () {},
      //           ),
      //         ));
      // },
      //   child: Center(
      //     child: Text('Show SnackBar!'),
      //   ),
      // ),
      // ),
      // );
    });
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
                lang.tr('favourites'),
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
                    statusBarColor: Colors.transparent,
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
                    lang.tr('profile'),
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
                        onTap: () {
                          Get.offAllNamed('/select_chalet_screen');
                        },
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
                        lang.tr('calender'),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25.sp,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 18.w),
                          child: GestureDetector(
                            onTap: () => showInfoOfCalender(context),
                            child: SvgPicture.asset(
                                'assets/icons/calender_directions.svg'),
                          ),
                        )
                      ],
//                       leading: InkWell(
//                         onTap: () {
//                           _showBlurredDialog(context);
//                         },
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         child: Container(
//                           alignment: AlignmentDirectional.bottomCenter,
//                           margin: EdgeInsetsDirectional.only(bottom: 18.h, start: 30.w),
//                           width: 35.w,
//                           height: 35.w,
//                           child: const Image(
//                             image: AssetImage("assets/icons/directions.png"),
//                           ),
//                         ),
// //profileReplace.png
//                       ),
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
                            lang.tr('conversations'),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25.sp,
                            ),
                          ),
                        )
                      : null,
      body: SafeArea(
        child: Column(
          children: [
            Visibility(
              visible: isShowEnabledEmail,
              child: Container(
                width: double.infinity,
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey.withOpacity(0.8)),
                margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text('Enabled Email', style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.white),),
                    )),
                    loadingSendVerify ? Padding(
                      padding:  EdgeInsetsDirectional.only(end: 30),
                      child: SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ):
                    TextButton(onPressed: () async {
                      setState(() {
                        loadingSendVerify = true;
                      });
                      String? email = await  SharedPrefController().getValueFor<String>(key: 'email');
                      print(email);
                      if(email != null && email.isNotEmpty) {
                        ApiResponse apiResponse = await AuthApiController()
                            .sendEmailVerify(email: email);
                        print('${apiResponse.message}');
                        setState(() {
                          isShowEnabledEmail = false;
                        });
                        if (apiResponse.success) {
                          setState(() {
                            isShowEnabledEmail = false;
                            showSnackBarByGet(title: 'An activation message has been sent to your email',);

                            SharedPrefController().enabledEmail(value: true);
                          });
                        } else {
                          setState(() {
                            // showSnackBarByGet(title: '${apiResponse.message}, make sure your email is correct', error: true);
                            loadingSendVerify = false;
                          });
                        }
                      }

                    }, child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text('Enable', style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.greenAccent),),
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(

                children: [

                  Padding(
                    padding: EdgeInsets.only(bottom: 80.h),
                    child: _bnScreen[_currentIndex].widget,
                  ),

                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
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
                                image: const AssetImage(
                                    "assets/icons/profileActive.png"),
                                height: 24.h,
                                width: 24.w,
                              ),
                              icon: Image(
                                image: const AssetImage(
                                    "assets/icons/profileUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                              ),
                              label: ""),
                          BottomNavigationBarItem(
                              activeIcon: Image(
                                image: const AssetImage(
                                    "assets/icons/calenderUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                                color: primaryColor,
                              ),
                              icon: Image(
                                image: const AssetImage(
                                    "assets/icons/calenderUnActive.png"),
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
                                image:
                                    const AssetImage("assets/icons/chatUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                                color: primaryColor,
                              ),
                              icon: Image(
                                image:
                                    const AssetImage("assets/icons/chatUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                              ),
                              label: ""),
                          BottomNavigationBarItem(
                              activeIcon: Image(
                                image:
                                    const AssetImage("assets/icons/likeUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                                color: primaryColor,
                              ),
                              icon: Image(
                                image:
                                    const AssetImage("assets/icons/likeUnActive.png"),
                                height: 24.h,
                                width: 24.w,
                              ),
                              label: ""),
                        ],
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       _currentIndex = 2;
      //     });
      //   },
      //   child: Container(
      //     margin: EdgeInsets.only(bottom: 20.h),
      //     decoration: const BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage("assets/icons/FTBPK.png"),
      //             fit: BoxFit.cover)),
      //     padding: EdgeInsets.only(bottom: 8.h),
      //     height: 70.h,
      //     width: 70.w,
      //     child: Icon(
      //       Icons.home_rounded,
      //       size: 33.r,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: Visibility(
      //   visible: isShowEnabledEmail,
      //   child: Container(
      //     width: double.infinity,
      //     height: 45.h,
      //     decoration: BoxDecoration(color: Colors.blueGrey),
      //     child: Row(
      //       children: [
      //         Expanded(child: Padding(
      //           padding:  EdgeInsets.symmetric(horizontal: 10.w),
      //           child: Text('Enabled Email', style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.white),),
      //         )),
      //         loadingSendVerify ? Padding(
      //           padding:  EdgeInsetsDirectional.only(end: 30),
      //           child: SizedBox(
      //             height: 20.w,
      //             width: 20.w,
      //             child: CircularProgressIndicator(
      //               strokeWidth: 2.5,
      //               color: Colors.greenAccent,
      //             ),
      //           ),
      //         ):
      //         TextButton(onPressed: () async {
      //         setState(() {
      //             loadingSendVerify = true;
      //           });
      //         ApiResponse apiResponse = await AuthApiController().sendEmailVerify();
      //           print('${apiResponse.message}');
      //           if(apiResponse.success){
      //            setState(() {
      //              isShowEnabledEmail = false;
      //               SharedPrefController().enabledEmail(value: true);
      //            });
      //           }else{
      //             setState(() {
      //               loadingSendVerify = false;
      //             });
      //           }
      //
      //         }, child: Padding(
      //           padding:  EdgeInsets.symmetric(horizontal: 10.w),
      //           child: Text('Enable', style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.greenAccent),),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
