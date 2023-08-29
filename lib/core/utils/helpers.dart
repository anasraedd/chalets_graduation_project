import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/widgets/admin_widgets/DashedLine.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Helpers {
  void showSnackBar(
      {required BuildContext context,
      required String content,
      bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void bottomSheet({required context, required body}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      backgroundColor: Color(0xFFF5F8FF),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: body,
      ),
    );
  }

  void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  child,
                ],
              ));

  void showBlurredDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Stack(children: <Widget>[
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        16.0), // Set the desired radius here
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 300.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/logout_image.jpg"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'areYouSureLogout'.tr(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Color(0xFFD92C2C),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                          height: 3,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 40.h,
                                      child: Center(
                                        child: Text(
                                          'cancel'.tr(),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Color(0xFFD92C2C),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              VerticalDivider(
                                width: 3,
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () async {
                                    Get.back();
                                    showLoadingDialog(context);
                                    ApiResponse apiResponse  = await AuthApiController().logout();
                                   if(apiResponse.success){
                                     Get.back();
                                     Get.offNamed('/register_or_login_screen');
                                     SharedPrefController().clear();
                                   }

                                  },
                                  child: Container(
                                      height: 40.h,
                                      child: Center(
                                          child: Text(
                                        'logout'.tr(),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: primaryColor,
                                        ),
                                      ))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]));
        });
  }

  void showCouponDialog(BuildContext context, {required String code, required String discountPercentage, required String startAt, required String endAt}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Dialog(
                backgroundColor: Colors.transparent,
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 130.w, vertical: 280).h,
                child: Center(
                  child: Container(
                    width: 200.w,
                    height: 350.h,
                    child: Stack(children: <Widget>[
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.symmetric(
                                  horizontal: 20.w),
                              height: 30.h,
                              child: Row(
                                children: [
                                  Align(
                                      alignment:
                                          AlignmentDirectional.topStart,
                                      child: Text(
                                        'Start at',
                                        style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            color: Color(0xFF009900)),
                                      )),
                                  Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: Text('${startAt} 09:35am',
                                          style: GoogleFonts.fleurDeLeah(
                                              fontSize: 10.sp,
                                              color: Colors.black)))
                                  //flamenco
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.symmetric(
                                  horizontal: 20.w),
                              height: 30.h,
                              child: Row(
                                children: [
                                  Align(
                                      alignment:
                                          AlignmentDirectional.topStart,
                                      child: Text(
                                        'End at',
                                        style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            color: Color(0xFFFF0000)),
                                      )),
                                  Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: Text('${endAt} 09:35am',
                                          style: GoogleFonts.fleurDeLeah(
                                              fontSize: 10.sp,
                                              color: Colors.black)))
                                  //flamenco
                                ],
                              ),
                            ),

                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 6.w),
                            //   child: RichText(
                            //     text: TextSpan(
                            //       text: '15',
                            //       style: GoogleFonts.inter(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 10.sp,
                            //       ),
                            //       children: [
                            //         TextSpan(
                            //             text: 'Day',
                            //             style: GoogleFonts.indieFlower(
                            //                 fontSize: 8.sp)
                            //             // TextStyle(
                            //             //     color: Colors.black,
                            //             //     fontWeight: FontWeight.bold,
                            //             //     fontSize: 14.sp),
                            //             // recognizer: TapGestureRecognizer()
                            //             //   ..onTap = () {
                            //             //     setState(() {
                            //             //       expanded = true;
                            //             //     });
                            //
                            //             ),
                            //         TextSpan(
                            //           text: ': 23 ',
                            //           style: GoogleFonts.inter(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 10.sp,
                            //           ),
                            //         ),
                            //         TextSpan(
                            //           text: 'Hour',
                            //           style: GoogleFonts.indieFlower(
                            //               color: Colors.black, fontSize: 8.sp
                            //               // fontWeight: FontWeight.bold,
                            //               ),
                            //         ),
                            //         TextSpan(
                            //           text: ': 46 ',
                            //           style: GoogleFonts.inter(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 10.sp,
                            //           ),
                            //         ),
                            //         TextSpan(
                            //           text: 'Min',
                            //           style: GoogleFonts.indieFlower(
                            //               color: Colors.black, fontSize: 8.sp
                            //               //fontWeight: FontWeight.bold,
                            //               ),
                            //         ),
                            //         TextSpan(
                            //           text: ': 57 ',
                            //           style: GoogleFonts.inter(
                            //             color: Colors.red,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 10.sp,
                            //           ),
                            //         ),
                            //         TextSpan(
                            //           text: 'Sec',
                            //           style: GoogleFonts.indieFlower(
                            //               color: Colors.black, fontSize: 8.sp
                            //               // fontWeight: FontWeight.bold,
                            //               ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                              height: 6.h,
                            ),
                            DashedLine(
                              width: 12,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 90.h,
                              child: Stack(
                                children: [
                                  PositionedDirectional(
                                      start: 30.w,
                                      top: 16.h,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/arrow_up.svg'),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/arrow_down.svg'),
                                        ],
                                      )),
                                  Center(
                                      child: SvgPicture.asset(
                                    'assets/images/box_coupon.svg',
                                    height: 63.5,
                                    width: 69,
                                  )),
                                  Center(
                                      child: Text(
                                        discountPercentage,
                                    style: GoogleFonts.knewave(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 19.sp,
                                        color: Colors.white),
                                  )),
                                  PositionedDirectional(
                                    end: 35.w,
                                    top: 16.h,
                                    child: Text(
                                      '%',
                                      style: GoogleFonts.jollyLodger(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange),
                                    ),
                                  ),
                                  PositionedDirectional(
                                    end: 30.w,
                                    top: 45.h,
                                    child: Text(
                                      'off',
                                      style: GoogleFonts.jollyLodger(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              code,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.sp,
                                  color: primaryColor),
                            ),
                            SizedBox(
                              height: 11.5.h,
                            ),

                            //  Divider(
                            //    height: 2,
                            //    color: Colors.black,
                            //
                            //  )
                          ],
                        ),
                      ),
                      PositionedDirectional(
                        //alignment: AlignmentDirectional.bottomCenter,
                        top: 260.h,
                        start: 40,
                        end: 40,
                        child: GestureDetector (
                          onTap: () async {
                            Random random = Random();
                            Get.back();
                         ApiResponse result = await  AdminChaletsApiController().addPriceDiscountCodes(chaletsId: AdminChaletsGetxController.to.chaletForManage.value.id,  percent: int.parse(discountPercentage), startAt: startAt, endAt: endAt);
// if(result.success){
//   showSnackBarByGet(title: 'success');
// }else{
//   showSnackBarByGet(title: result.message, error: true);
//
// }
                          },
                          child: Container(
                            // margin: EdgeInsetsDirectional.only(bottom: -20.h),
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5555),
                              border: Border.all(
                                  width: 3, color: Colors.black26),
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/FTBPK.png"),
                                  fit: BoxFit.cover),
                            ),
                            child: Icon(
                              Icons.save,
                              size: 33.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )),
          );
        });
  }

  void showSnackBarByGet(
      {required String title,
      String subTitle = '',
      TextButton? mainButton,
      bool error = false,
      Duration? duration}) {
    Get.snackbar(title, subTitle,
        // snackbarStatus: (status) {},

        // titleText:  Row(
        //   children: [
        //     SizedBox(
        //       height: 30, width: 50,
        //       child: ElevatedButton(onPressed: (){
        //         print('komokemmcme');
        //       }, child: Text('change')),
        //     ),
        //     Text('klmckldnklvcnklndskvn')
        //   ],
        // ) ,

        dismissDirection: DismissDirection.none,
        isDismissible: true,
        colorText: Colors.white,
        backgroundColor: error ? Colors.red : primaryColor,
        duration: duration ?? Duration(seconds: 3),
        borderRadius: 8,
        snackPosition: SnackPosition.BOTTOM,
        mainButton: mainButton,
        padding:
            EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w, bottom: 5.h),
        messageText: subTitle.isNotEmpty ? null : Container(),
        margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 30));
  }


  void showSnackBarForEmail(
      {required String title,
        String subTitle = '',
        TextButton? mainButton,
        bool error = false,
        Duration? duration}) {
    Get.snackbar(title, subTitle,
        // snackbarStatus: (status) {},

        // titleText:  Row(
        //   children: [
        //     SizedBox(
        //       height: 30, width: 50,
        //       child: ElevatedButton(onPressed: (){
        //         print('komokemmcme');
        //       }, child: Text('change')),
        //     ),
        //     Text('klmckldnklvcnklndskvn')
        //   ],
        // ) ,

        dismissDirection: DismissDirection.none,
        isDismissible: false,
        colorText: Colors.white,
        backgroundColor: error ? Colors.red : Colors.blueGrey,
        duration: duration ?? Duration(days: 2),
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM,
        mainButton: mainButton,
        padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w, bottom:5.h),

        messageText: subTitle.isNotEmpty ? null : Container(),
        margin: EdgeInsets.only(right: 0.w, left: 0.w, bottom: 0.h));
  }


  void showLoadingDialog(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async {
          return true; // تعطيل العودة عند ظهور الـ dialog
        },
        child: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: CircularProgressIndicator()
                    // LoadingAnimationWidget.prograssiveDots(
                    //     color: primaryColor, size: 100),
                    )),
          ),
        ),
      ),
    );
    // showDialog(
    //   barrierDismissible: false,
    //   context: context, builder:  (BuildContext context) {
    //   return Center(
    //     child: Card(
    //
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20)
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: LoadingAnimationWidget.prograssiveDots(color: primaryColor, size: 100),
    //         )),
    //   );
    // },
    //);
  }

  void showReviewToAddImageDialog(File _pickedImage) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async {
          return false; // تعطيل العودة عند ظهور الـ dialog
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 250,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Image.file(
                            _pickedImage,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('upload'.tr()),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor),
                            ),
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('cancle'.tr()),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secondaryColor)),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                )),
          ),
        ),
      ),
    );

    // showDialog(
    //   barrierDismissible: false,
    //   context: context, builder:  (BuildContext context) {
    //   return Center(
    //     child: Card(
    //
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20)
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: LoadingAnimationWidget.prograssiveDots(color: primaryColor, size: 100),
    //         )),
    //   );
    // },
    //);
  }

  void showInfoOfCalender(BuildContext context) {
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


  String generateUsernameFromName(String name) {
    // Remove whitespace and convert name to lowercase
    final cleanedName = name.trim().toLowerCase();

    // Split the name into parts using whitespace
    final nameParts = cleanedName.split('');

    // Take the first letter from each part
    final initials = nameParts.map((part) => part[0]).join();

    // Generate a random number between 100 and 999
    final random = Random();
    final randomNumber = random.nextInt(900) + 100;

    // Combine initials and random number to create the username
    final username = '$initials$randomNumber';

    return username;
  }
}
