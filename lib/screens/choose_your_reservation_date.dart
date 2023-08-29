import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/calender_getx_controller.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet/chalet_reservations.dart';
import 'package:chalets/screens/chalet_reservation_screen.dart';
import 'package:chalets/screens/details_screen.dart';
import 'package:chalets/widgets/box_calender.dart';
import 'package:chalets/widgets/box_calender_in_reservation.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseYourReservationDate extends StatefulWidget {
  const ChooseYourReservationDate({Key? key}) : super(key: key);

  @override
  State<ChooseYourReservationDate> createState() =>
      _ChooseYourReservationDateState();
}

class _ChooseYourReservationDateState extends State<ChooseYourReservationDate>
    with Helpers {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // DateTime _selectedDay = DateTime.now().add(Duration(days: 100));
  DateTime _focusedDay = DateTime.now().add(Duration(days: 1));

  // final createChaletGetxController = Get.lazyPut<CalenderGetxController>(
  //         () => CalenderGetxController());
  late DateTime _currentMonth;
  bool _isFirstDisplayedMonth = false;
  DateTime _firstDay = DateTime.now().add(Duration(days: 1));
  DateTime _lastDay = DateTime.now().add(
    Duration(days: 75),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            shadowColor: primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            toolbarHeight: 80.h,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
            )),
            title: Text(
              lang.tr('choose_your_reservation_date'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                MyFlutterApp.back,
                color: Colors.white,
                size: 30,
              ),
            )),
        body: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Card(
              // height: 130.h,
              // width: double.infinity,
              //  clipBehavior: Clip.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.only(left: 25.w, right: 25.w),

              child: SizedBox(
                  //  height: 130.h,
                  width: double.infinity,
                  child: GetX<ChaletsGetxController>(
                      init: ChaletsGetxController(),
                      builder: (ChaletsGetxController controller) {
                        return Row(
                          children: [
                            Container(
                              height: 102.w,
                              width: 102.w,
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsetsDirectional.only(start: 5.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8.r),
                                //
                                // border:  Border.all(
                                //     strokeAlign: BorderSide.strokeAlignOutside,
                                //     color: Colors.white)
                              ),
                              child: CachedNetworkImage(
                                imageUrl: controller.chalet.value.logo,

                                fit: BoxFit.cover,
                                // fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    SpinKitFadingCircle(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(
                                      15.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                    controller
                                                        .chalet.value.name,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17.5.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
//edit
                                              Container(
                                                width: 270.w,
                                                margin: EdgeInsets.only(
                                                    top: 8.h,
                                                    bottom: 8.h,
                                                    left: 4.w),
                                                child: ClipOval(
                                                  child: Divider(
                                                    color:
                                                        const Color(0xFF017C9B),
                                                    thickness: 1.1.h,
                                                    height: 2,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: const AssetImage(
                                                        "assets/images/area_icon.png"),
                                                    height: 20.h,
                                                    width: 20.w,
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  //Area Text
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "Unit Area ",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10.sp,
                                                                color: Colors
                                                                    .black),
                                                        children: [
                                                          TextSpan(
                                                            text: controller
                                                                .chalet
                                                                .value
                                                                .space,
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          TextSpan(
                                                            text: " m",
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: const AssetImage(
                                                        "assets/images/map_icon.png"),
                                                    height: 16.h,
                                                    width: 16.h,
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  //Chalet LOCATION
                                                  Text(
                                                    controller
                                                        .chalet.value.location,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.5.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      })),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                  // height: 125.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.black)),
                  child: GetX<ChaletsGetxController>(
                      init: ChaletsGetxController(),
                      builder: (ChaletsGetxController controller) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check_In Date',
                                        style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF252525),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.5),
                                        child: controller
                                                .selectReservedDateStart
                                                .value
                                                .isNotEmpty
                                            ? Text(
                                                controller
                                                    .selectReservedDateStart
                                                    .value,
                                                style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF252525),
                                                ),
                                              )
                                            : ShimmerLoadingWidget(
                                                height: 20.h,
                                                width: 100.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                      ),
                                      // SizedBox(
                                      //   height: 12.5,
                                      // ),
                                      Text(
                                        'Check_Out Date',
                                        style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.5),
                                        child: controller.selectReservedDateEnd
                                                .value.isNotEmpty
                                            ? Text(
                                                controller.selectReservedDateEnd
                                                    .value,
                                                style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF252525),
                                                ),
                                              )
                                            : ShimmerLoadingWidget(
                                                height: 20.h,
                                                width: 100.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check_In Time',
                                        style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF252525),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      controller.selectReservedPeriodStart.value
                                              .isNotEmpty
                                          ? Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                         EdgeInsets.all(
                                                            5.w),
                                                    child: Text(
                                                      '${controller.selectReservedPeriodStart.value == 'Evening' ? '7:00 ' : '8:00 '}',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xFF252525),
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                SizedBox(
                                                  height: 28.h,
                                                  width: 56.w,
                                                  child: controller
                                                          .allowChangeEndPeriod
                                                          .value
                                                      ? Container(
                                                          width: 56.w,
                                                          height: 40.w,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      secondaryColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    if (controller
                                                                        .allowChangeStartPeriod
                                                                        .value) {
                                                                      setState(
                                                                          () {
                                                                        controller
                                                                            .selectReservedPeriodStart
                                                                            .value = 'Morning';
                                                                      });
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    // width: 28.w,
                                                                    height:
                                                                        40.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: controller.selectReservedPeriodStart.value ==
                                                                              'Morning'
                                                                          ? primaryColor.withOpacity(
                                                                              0.7)
                                                                          : Colors
                                                                              .white,
                                                                      borderRadius: BorderRadiusDirectional.only(
                                                                          topStart: Radius.circular(
                                                                              5),
                                                                          bottomStart:
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child: Center(
                                                                        child: Text(
                                                                      'AM',
                                                                      style: GoogleFonts.inter(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          color: controller.selectReservedPeriodStart.value == 'Morning'
                                                                              ? Colors.white
                                                                              : Colors.black),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1,
                                                                height: 40.h,
                                                                color: secondaryColor,
                                                              ),
                                                              // VerticalDivider(
                                                              //   width: 1,
                                                              //   color:
                                                              //       secondaryColor,
                                                              // ),
                                                              Expanded(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    if (controller
                                                                        .allowChangeStartPeriod
                                                                        .value) {
                                                                      if (DateTime.parse(controller.selectReservedDateStart.value).day ==
                                                                          DateTime.parse(controller.selectReservedDateEnd.value)
                                                                              .day &&
                                                                          DateTime.parse(controller.selectReservedDateStart.value).month ==
                                                                              DateTime.parse(controller.selectReservedDateEnd.value).month) {
                                                                        setState(
                                                                                () {
                                                                              if(controller.selectReservedPeriodEnd == 'Evening'){
                                                                                setState(() {
                                                                                  controller
                                                                                      .selectReservedPeriodStart
                                                                                      .value = 'Evening';
                                                                                });
                                                                              }

                                                                            });
                                                                      }else{
                                                                        setState(() {
                                                                          controller
                                                                              .selectReservedPeriodStart
                                                                              .value = 'Evening';
                                                                        });
                                                                      }

                                                                      // setState(
                                                                      //         () {
                                                                      //       setState(() {
                                                                      //         controller
                                                                      //             .selectReservedPeriodStart
                                                                      //             .value = 'Evening';
                                                                      //       });
                                                                      //     });
                                                                    }
                                                                    // if (DateTime.parse(controller.selectReservedDateStart.value).day !=
                                                                    //         DateTime.parse(controller.selectReservedDateEnd.value)
                                                                    //             .day ||
                                                                    //     DateTime.parse(controller.selectReservedDateStart.value).month !=
                                                                    //         DateTime.parse(controller.selectReservedDateEnd.value).month) {
                                                                    //   setState(
                                                                    //       () {
                                                                    //     controller
                                                                    //         .selectReservedPeriodStart
                                                                    //         .value = 'Evening';
                                                                    //   });
                                                                    // }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    // width: 28.w,
                                                                    height:
                                                                        40.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: controller.selectReservedPeriodStart.value ==
                                                                              'Evening'
                                                                          ? primaryColor.withOpacity(
                                                                              0.7)
                                                                          : Colors
                                                                              .white,

                                                                      // border: BorderDirectional(              bottom: BorderSide(width: 1.5, color: Colors.grey),
                                                                      //  ),
                                                                      borderRadius: BorderRadiusDirectional.only(
                                                                          topEnd: Radius.circular(
                                                                              5),
                                                                          bottomEnd:
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child: Center(
                                                                        child: Text(
                                                                      'PM',
                                                                      style: GoogleFonts.inter(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          color: controller.selectReservedPeriodStart.value == 'Evening'
                                                                              ? Colors.white
                                                                              : Colors.black),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      // ElevatedButton(
                                                      //         onPressed: () {
                                                      //           if (controller
                                                      //               .allowChangeStartPeriod
                                                      //               .value) {
                                                      //             if (DateTime.parse(controller
                                                      //                             .selectReservedDateStart
                                                      //                             .value)
                                                      //                         .day ==
                                                      //                     DateTime.parse(controller
                                                      //                             .selectReservedDateEnd
                                                      //                             .value)
                                                      //                         .day &&
                                                      //                 DateTime.parse(controller
                                                      //                             .selectReservedDateStart
                                                      //                             .value)
                                                      //                         .month ==
                                                      //                     DateTime.parse(controller
                                                      //                             .selectReservedDateEnd
                                                      //                             .value)
                                                      //                         .month) {
                                                      //               if (controller
                                                      //                       .selectReservedPeriodStart
                                                      //                       .value ==
                                                      //                   'Evening') {
                                                      //                 controller
                                                      //                         .selectReservedPeriodStart
                                                      //                         .value =
                                                      //                     'Morning';
                                                      //                 controller
                                                      //                         .selectReservedPeriodEnd
                                                      //                         .value =
                                                      //                     'Morning';
                                                      //               } else {
                                                      //                 controller
                                                      //                         .selectReservedPeriodStart
                                                      //                         .value =
                                                      //                     'Evening';
                                                      //                 controller
                                                      //                         .selectReservedPeriodEnd
                                                      //                         .value =
                                                      //                     'Evening';
                                                      //               }
                                                      //               setState(() {});
                                                      //             } else {
                                                      //
                                                      //               if (controller
                                                      //                       .selectReservedPeriodStart ==
                                                      //                   'Evening') {
                                                      //                 controller
                                                      //                         .selectReservedPeriodStart
                                                      //                         .value =
                                                      //                     'Morning';
                                                      //               } else {
                                                      //                 controller
                                                      //                         .selectReservedPeriodStart
                                                      //                         .value =
                                                      //                     'Evening';
                                                      //               }
                                                      //               setState(() {});
                                                      //             }
                                                      //           }
                                                      //
                                                      //           // setState(() {
                                                      //           //
                                                      //           // });
                                                      //         },
                                                      //         style: ElevatedButton
                                                      //             .styleFrom(
                                                      //                 padding:
                                                      //                     EdgeInsets
                                                      //                         .all(
                                                      //                             0)),
                                                      //         child: Text(
                                                      //           controller.selectReservedPeriodStart ==
                                                      //                   'Evening'
                                                      //               ? 'Morning'
                                                      //               : 'Evening',
                                                      //           style: GoogleFonts
                                                      //               .inter(
                                                      //                   fontSize:
                                                      //                       12.sp),
                                                      //         ))
                                                      : Container(),
                                                )
                                              ],
                                            )
                                          : ShimmerLoadingWidget(
                                              height: 20.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                      // SizedBox(
                                      //   height: 12.5,
                                      // ),
                                      Text(
                                        'Check_Out Time',
                                        style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      controller.selectReservedPeriodEnd.value
                                              .isNotEmpty
                                          ? Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                         EdgeInsets.all(
                                                            5.w),
                                                    child: Text(
                                                      '${controller.selectReservedPeriodStart.value == 'Evening' ? '8:00 ' : '7:00 '}',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xFF252525),
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                controller.allowChangeEndPeriod
                                                        .value
                                                    ? SizedBox(
                                                        height: 28.h,
                                                        width: 56.w,
                                                        child:
                                                        Container(
                                                          width: 56.w,
                                                          height: 40.w,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                  secondaryColor),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  6)),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (controller
                                                                        .allowChangeEndPeriod
                                                                        .value) {
                                                                      if (DateTime.parse(controller.selectReservedDateStart.value).day ==
                                                                                            DateTime.parse(controller.selectReservedDateEnd.value)
                                                                                                .day &&
                                                                                        DateTime.parse(controller.selectReservedDateStart.value).month ==
                                                                                            DateTime.parse(controller.selectReservedDateEnd.value).month) {
                                                                                      setState(
                                                                                          () {
                                                                                            if(controller.selectReservedPeriodStart != 'Evening'){
                                                                                              setState(() {
                                                                                                controller
                                                                                                    .selectReservedPeriodEnd
                                                                                                    .value = 'Morning';
                                                                                              });
                                                                                            }

                                                                                      });
                                                                                    }else{
                                                                                  setState(() {
                                                                                    controller
                                                                                        .selectReservedPeriodEnd
                                                                                        .value = 'Morning';
                                                                                    controller
                                                                                        .selectReservedPeriodStart
                                                                                        .value = 'Morning';
                                                                                  });
                                                                                }

                                                                               // }

                                                                    }
                                                                  },
                                                                  child:
                                                                  Container(
                                                                    // width: 28.w,
                                                                    height:
                                                                    40.h,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: controller.selectReservedPeriodEnd.value ==
                                                                          'Morning'
                                                                          ? primaryColor.withOpacity(
                                                                          0.7)
                                                                          : Colors
                                                                          .white,
                                                                      borderRadius: BorderRadiusDirectional.only(
                                                                          topStart: Radius.circular(
                                                                              5),
                                                                          bottomStart:
                                                                          Radius.circular(5)),
                                                                    ),
                                                                    child: Center(
                                                                        child: Text(
                                                                          'AM',
                                                                          style: GoogleFonts.inter(
                                                                              fontSize: 12
                                                                                  .sp,
                                                                              color: controller.selectReservedPeriodEnd.value == 'Morning'
                                                                                  ? Colors.white
                                                                                  : Colors.black),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1,
                                                                height: 40.h,
                                                                color: secondaryColor,
                                                              ),
                                                              // VerticalDivider(
                                                              //   width: 1,
                                                              //   color:
                                                              //       secondaryColor,
                                                              // ),
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (controller
                                                                        .allowChangeEndPeriod
                                                                        .value) {
                                                                      setState(
                                                                              () {
                                                                            setState(() {
                                                                              controller
                                                                                  .selectReservedPeriodEnd
                                                                                  .value = 'Evening';
                                                                            });
                                                                          });
                                                                    }
                                                                    // if (DateTime.parse(controller.selectReservedDateStart.value).day !=
                                                                    //         DateTime.parse(controller.selectReservedDateEnd.value)
                                                                    //             .day ||
                                                                    //     DateTime.parse(controller.selectReservedDateStart.value).month !=
                                                                    //         DateTime.parse(controller.selectReservedDateEnd.value).month) {
                                                                    //   setState(
                                                                    //       () {
                                                                    //     controller
                                                                    //         .selectReservedPeriodStart
                                                                    //         .value = 'Evening';
                                                                    //   });
                                                                    // }
                                                                  },
                                                                  child:
                                                                  Container(
                                                                    // width: 28.w,
                                                                    height:
                                                                    40.h,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: controller.selectReservedPeriodEnd.value ==
                                                                          'Evening'
                                                                          ? primaryColor.withOpacity(
                                                                          0.7)
                                                                          : Colors
                                                                          .white,

                                                                      // border: BorderDirectional(              bottom: BorderSide(width: 1.5, color: Colors.grey),
                                                                      //  ),
                                                                      borderRadius: BorderRadiusDirectional.only(
                                                                          topEnd: Radius.circular(
                                                                              5),
                                                                          bottomEnd:
                                                                          Radius.circular(5)),
                                                                    ),
                                                                    child: Center(
                                                                        child: Text(
                                                                          'PM',
                                                                          style: GoogleFonts.inter(
                                                                              fontSize: 12
                                                                                  .sp,
                                                                              color: controller.selectReservedPeriodEnd.value == 'Evening'
                                                                                  ? Colors.white
                                                                                  : Colors.black),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // ElevatedButton(
                                                        //     onPressed: () {
                                                        //       if (controller
                                                        //           .allowChangeEndPeriod
                                                        //           .value) {
                                                        //         if (DateTime.parse(controller.selectReservedDateStart.value)
                                                        //                     .day ==
                                                        //                 DateTime.parse(controller.selectReservedDateEnd.value)
                                                        //                     .day &&
                                                        //             DateTime.parse(controller.selectReservedDateStart.value)
                                                        //                     .month ==
                                                        //                 DateTime.parse(controller.selectReservedDateEnd.value)
                                                        //                     .month) {
                                                        //           if (controller
                                                        //                   .selectReservedPeriodEnd
                                                        //                   .value ==
                                                        //               'Evening') {
                                                        //             controller
                                                        //                     .selectReservedPeriodStart
                                                        //                     .value =
                                                        //                 'Morning';
                                                        //             controller
                                                        //                     .selectReservedPeriodEnd
                                                        //                     .value =
                                                        //                 'Morning';
                                                        //           } else {
                                                        //             controller
                                                        //                     .selectReservedPeriodStart
                                                        //                     .value =
                                                        //                 'Evening';
                                                        //             controller
                                                        //                     .selectReservedPeriodEnd
                                                        //                     .value =
                                                        //                 'Evening';
                                                        //           }
                                                        //           setState(
                                                        //               () {});
                                                        //         } else {
                                                        //           if (controller
                                                        //                   .selectReservedPeriodEnd ==
                                                        //               'Evening') {
                                                        //             controller
                                                        //                     .selectReservedPeriodEnd
                                                        //                     .value =
                                                        //                 'Morning';
                                                        //           } else {
                                                        //             controller
                                                        //                     .selectReservedPeriodEnd
                                                        //                     .value =
                                                        //                 'Evening';
                                                        //           }
                                                        //           setState(
                                                        //               () {});
                                                        //         }
                                                        //       }
                                                        //     },
                                                        //     style: ElevatedButton
                                                        //         .styleFrom(
                                                        //             padding:
                                                        //                 EdgeInsets.all(
                                                        //                     0)),
                                                        //     child: Text(
                                                        //       controller.selectReservedPeriodEnd ==
                                                        //               'Evening'
                                                        //           ? 'Morning'
                                                        //           : 'Evening',
                                                        //       style: GoogleFonts
                                                        //           .inter(
                                                        //               fontSize:
                                                        //                   12.sp),
                                                        //     )),
                                                      )
                                                    : Container()
                                              ],
                                            )
                                          : ShimmerLoadingWidget(
                                              height: 20.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      })

//            child: ,
                  ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: TableCalendar(
                  selectedDayPredicate: (day) {
                    return true;
                  },
                  // selectedDayPredicate: (day) {
                  //   return isSameDay(DateTime.now().add(Duration(days: 100)), day);
                  // },

                  // rangeSelectionMode: RangeSelectionMode.toggledOn,
                  //  selectedDayPredicate: null,
                  availableGestures: AvailableGestures.horizontalSwipe,

                  calendarFormat: _calendarFormat,
                  //selectedDay: _selectedDay,

                  focusedDay: _focusedDay,

                  // onFormatChanged: (format) {
                  //   setState(() {
                  //     _calendarFormat = format;
                  //   });
                  // },

                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,

                    cellAlignment: Alignment.bottomCenter,

                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    // todayTextStyle: TextStyle(
                    // fontSize: 16,
                    // color: Colors.black,
                    // )
                  ),

                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(horizontal: 15.w)),

                  calendarBuilders: CalendarBuilders(

                    dowBuilder: (context, day) {
                      final text = DateFormat.E().format(day);
                      if (day.weekday == DateTime.sunday) {
                        // final text = DateFormat.E().format(day);

                        return Center(
                          child: Text(
                            text,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                          ),
                        ),
                      );
                    },

                    disabledBuilder: (context, _datetime, event) {
                      return BoxCalender(
                        _datetime.day.toString(),
                        disable: true,
                      );
                    },

                    markerBuilder: (context, _datetime, event) {

                      bool morningReserved = false;
                      bool eveningReserved = false;
                      bool morningSelectToReservation = false;
                      bool eveningSelectToReservation = false;
                      /*
                    if (_datetime.year != _selectedDay.year ||
                        _datetime.month != _selectedDay.month ||
                        _datetime.day != _selectedDay.day) {
                      */
                      // DateTime customDate = DateTime.now().add(Duration(days: 1));
                      // if( _datetime.year == customDate.year &&
                      //     _datetime.month == customDate.month &&
                      //     _datetime.day == customDate.day){
                      //
                      //   morningReserved =true;
                      //   eveningReserved = true;
                      // }
                      if (ChaletsGetxController
                          .to.chalet.value.chaletReservations.isNotEmpty) {
                        ChaletsGetxController.to.chalet.value.chaletReservations
                            .forEach((element) {
                          DateTime startAtDate = DateTime.parse(element.startAt);
                          DateTime endAtDate = DateTime.parse(element.endAt);
                          // DateTime startAtDate =
                          //     DateTime.now().subtract(Duration(days: 5));
                          // DateTime endAtDate =
                          //     DateTime.now().add(Duration(days: 6));
                          if (_datetime.isAfter(startAtDate.add(Duration(days: 1))) &&
                              _datetime.isBefore(endAtDate)) {
                            //.add(Duration(days: 1)
                            morningReserved = true;
                            eveningReserved = true;
                          }else  if ((_datetime.year == startAtDate.year &&
                              _datetime.month == startAtDate.month &&
                              _datetime.day == startAtDate.day) && (
                              _datetime.year == endAtDate.year &&
                                  _datetime.month == endAtDate.month &&
                                  _datetime.day == endAtDate.day
                          )) {
                            if (element.periodStart == 'Morning' && element.periodEnd == 'Evening') {
                              eveningReserved = true;
                              morningReserved = true;
                            } else   if (element.periodStart == 'Morning' && element.periodEnd == 'Morning'){
                              morningReserved = true;
                              eveningReserved = false;
                            }
                            else   if (element.periodStart == 'Evening' && element.periodEnd == 'Evening'){
                              morningReserved = false;
                              eveningReserved = true;
                            }
                          } else
                          if (_datetime.year == startAtDate.year &&
                              _datetime.month == startAtDate.month &&
                              _datetime.day == startAtDate.day) {
                            if (element.periodStart == 'Evening') {
                              eveningReserved = true;
                              morningReserved = false;
                            } else {
                              morningReserved = true;
                              eveningReserved = true;
                            }
                          } else if (_datetime.year == endAtDate.year &&
                              _datetime.month == endAtDate.month &&
                              _datetime.day == endAtDate.day) {
                            if (element.periodEnd == 'Evening') {
                              morningReserved = true;
                              eveningReserved = true;

                              // morningReserved = false;
                            } else {
                              morningReserved = true;
                            }
                          }
                        });

                        // ChaletsGetxController.to.chalet.value.chaletReservations
                        //     .forEach((element) {
                        //   DateTime startAtDate = DateTime.parse(element.startAt);
                        //   DateTime endAtDate = DateTime.parse(element.endAt);
                        //   // DateTime startAtDate =
                        //   //     DateTime.now().add(Duration(days: 7));
                        //   // DateTime endAtDate =
                        //   //     DateTime.now().add(Duration(days: 12));
                        //   if (_datetime.isAfter(startAtDate) &&
                        //       _datetime.isBefore(endAtDate)) {
                        //     //.add(Duration(days: 1)
                        //     // if (element.id != null) {
                        //     //   morningSelectToReservation = true;
                        //     //   eveningSelectToReservation = true;
                        //     // } else {
                        //     morningReserved = true;
                        //     eveningReserved = true;
                        //     // }
                        //   }else
                        //   if (_datetime.year == startAtDate.year &&
                        //       _datetime.month == startAtDate.month &&
                        //       _datetime.day == startAtDate.day) {
                        //     if (element.periodStart == 'Evening' &&
                        //         element.periodEnd == 'Evening') {
                        //       // if (element.id != null) {
                        //       //   eveningSelectToReservation = true;
                        //       //   morningSelectToReservation = false;
                        //       // } else {
                        //       eveningReserved = true;
                        //       morningReserved = false;
                        //       // }
                        //     } else if (element.periodStart == 'Morning' &&
                        //         element.periodEnd == 'Morning') {
                        //       // if (element.id != null) {
                        //       //   morningSelectToReservation = true;
                        //       //   eveningSelectToReservation = true;
                        //       // } else {
                        //       morningReserved = true;
                        //       eveningReserved = false;
                        //       // }
                        //     } else {
                        //       morningReserved = true;
                        //       eveningReserved = true;
                        //     }
                        //   }else if (_datetime.year == endAtDate.year &&
                        //       _datetime.month == endAtDate.month &&
                        //       _datetime.day == endAtDate.day) {
                        //     if (element.periodEnd == 'Evening') {
                        //       // if (element.id != null) {
                        //       //   morningSelectToReservation = true;
                        //       //   eveningSelectToReservation = true;
                        //       // } else {
                        //       morningReserved = true;
                        //       eveningReserved = true;
                        //       // }
                        //
                        //       // morningReserved = false;
                        //     } else {
                        //       // if (element.id != null) {
                        //       //   morningSelectToReservation = true;
                        //       // } else {
                        //       morningReserved = true;
                        //       // }
                        //     }
                        //   }
                        //
                        //   // if(ChaletsGetxController.to.selectReservedDateStart.isNotEmpty){
                        //   //
                        //   // }else{
                        //   //   if(_selectedDay == _datetime){
                        //   //     morningReserved = true;
                        //   //     eveningReserved= true;
                        //   //   }
                        //   // }
                        // });
                      }

                      if (ChaletsGetxController
                              .to.selectReservedDateStart.value.isNotEmpty &&
                          ChaletsGetxController
                              .to.selectReservedDateEnd.value.isNotEmpty) {
                        DateTime selectReservedDateStart = DateTime.parse(
                            ChaletsGetxController
                                .to.selectReservedDateStart.value);
                        DateTime selectReservedDateEnd = DateTime.parse(
                            ChaletsGetxController
                                .to.selectReservedDateEnd.value);
                        if (_datetime.isAfter(selectReservedDateStart.add(Duration(days: 1))) &&
                            _datetime.isBefore(selectReservedDateEnd)) {
                          //.add(Duration(days: 1)
                          morningSelectToReservation = true;
                          eveningSelectToReservation = true;
                        }else
                        if ((_datetime.year == selectReservedDateStart.year &&
                            _datetime.month == selectReservedDateStart.month &&
                            _datetime.day == selectReservedDateStart.day) && (
                            _datetime.year == selectReservedDateEnd.year &&
                                _datetime.month == selectReservedDateEnd.month &&
                                _datetime.day == selectReservedDateEnd.day
                        )) {
                          if (ChaletsGetxController
                              .to.selectReservedPeriodStart == 'Morning' &&ChaletsGetxController
                              .to.selectReservedPeriodEnd == 'Evening') {
                            eveningSelectToReservation = true;
                            morningSelectToReservation = true;
                          } else   if (ChaletsGetxController
                              .to.selectReservedPeriodStart == 'Morning' &&ChaletsGetxController
                              .to.selectReservedPeriodEnd == 'Morning'){
                            morningSelectToReservation = true;
                            eveningSelectToReservation = false;
                          }
                          else   if (ChaletsGetxController
                              .to.selectReservedPeriodStart == 'Evening' &&ChaletsGetxController
                              .to.selectReservedPeriodEnd == 'Evening'){
                            morningSelectToReservation = false;
                            eveningSelectToReservation = true;
                          }
                        } else
                        if (_datetime.year == selectReservedDateStart.year &&
                            _datetime.month == selectReservedDateStart.month &&
                            _datetime.day == selectReservedDateStart.day) {
                          if (ChaletsGetxController
                              .to.selectReservedPeriodStart == 'Evening') {
                            eveningSelectToReservation = true;
                            morningSelectToReservation = false;
                          } else {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = true;
                          }
                        } else if (_datetime.year == selectReservedDateEnd.year &&
                            _datetime.month == selectReservedDateEnd.month &&
                            _datetime.day == selectReservedDateEnd.day) {
                          if (ChaletsGetxController
                              .to.selectReservedPeriodEnd == 'Morning') {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = false;


                            // morningReserved = false;
                          } else if(ChaletsGetxController
                              .to.selectReservedPeriodEnd == 'Evening'){
                            morningSelectToReservation = true;
                            eveningSelectToReservation = true;

                          }
                        }

                        // print(true);

                        /*
                        DateTime selectReservedDateStart = DateTime.parse(
                            ChaletsGetxController
                                .to.selectReservedDateStart.value);
                        DateTime selectReservedDateEnd = DateTime.parse(
                            ChaletsGetxController
                                .to.selectReservedDateEnd.value);

                        if (_datetime.isAfter(selectReservedDateStart) &&
                            _datetime.isBefore(selectReservedDateEnd)) {
                          //.add(Duration(days: 1)
                          // if (element.id != null) {
                          // if (ChaletsGetxController
                          //         .to.selectReservedPeriodStart.value ==
                          //     'Morning') {
                          //   if (ChaletsGetxController
                          //           .to.selectReservedPeriodStart.value ==
                          //       'Evening') {
                          //     eveningSelectToReservation = true;
                          //   } else {
                          //     morningSelectToReservation = true;
                          //   }
                          // } else if (ChaletsGetxController
                          //         .to.selectReservedPeriodStart.value ==
                          //     'Evening') {
                          //   if (ChaletsGetxController
                          //           .to.selectReservedPeriodStart.value ==
                          //       'Morning') {
                          //     morningSelectToReservation = true;
                          //   }else{
                          //     eveningSelectToReservation = true;
                          //   }
                          // } else {
                          morningSelectToReservation = true;
                          eveningSelectToReservation = true;
                          //  }

                          // } else {
                          // morningReserved = true;
                          // eveningReserved = true;
                          // }
                        }
                        if (_datetime.month == selectReservedDateStart.month &&
                            _datetime.day == selectReservedDateStart.day) {
                          if (ChaletsGetxController
                                      .to.selectReservedPeriodStart.value ==
                                  'Evening'
                              // &&
                              // ChaletsGetxController
                              //         .to.selectReservedPeriodEnd.value ==
                              //     'Evening'
                          ) {
                            // if (element.id != null) {
                            eveningSelectToReservation = true;
                            morningSelectToReservation = false;


                            // } else {
                            // eveningReserved = true;
                            // morningReserved = false;
                            // }
                            // }
                            // else if (ChaletsGetxController
                            //             .to.selectReservedPeriodStart.value ==
                            //         'Morning' &&
                            //     ChaletsGetxController
                            //             .to.selectReservedPeriodEnd.value ==
                            //         'Morning') {
                            //   // if (element.id != null) {
                            //   morningSelectToReservation = true;
                            //   // eveningSelectToReservation = false;
                            //   // } else {
                            //   // morningReserved = true;
                            //   // eveningReserved = true;
                            //   // }

                          }else{
                            morningSelectToReservation = true;
                            eveningSelectToReservation = true;
                          }
/*
                          } else if (ChaletsGetxController
                                      .to.selectReservedPeriodStart.value ==
                                  'Morning' &&
                              ChaletsGetxController
                                      .to.selectReservedPeriodEnd.value ==
                                  'Morning') {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = false;
                          } else {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = true;
                          }
                          */
                          /*
                           if (element.periodStart == 'Evening' && element.periodEnd == 'Evening') {
                              // if (element.id != null) {
                              //   eveningSelectToReservation = true;
                              //   morningSelectToReservation = false;
                              // } else {
                              eveningReserved = true;
                              morningReserved = false;
                              // }
                            } else  if (element.periodStart == 'Morning' && element.periodEnd == 'Morning'){
                              // if (element.id != null) {
                              //   morningSelectToReservation = true;
                              //   eveningSelectToReservation = true;
                              // } else {
                              morningReserved = true;
                              eveningReserved = false;
                              // }
                            }else{
                              morningReserved = true;
                              eveningReserved = true;
                            }
                           */
                        }else  if (
                        _datetime.year == selectReservedDateEnd.year &&_datetime.month == selectReservedDateEnd.month &&
    _datetime.day == selectReservedDateEnd.day) {
    if (ChaletsGetxController
        .to.selectReservedPeriodEnd.value ==
    'Morning' ){
    //&&
    // ChaletsGetxController
    //     .to.selectReservedPeriodEnd.value ==
    // 'Evening') {
      // if (element.id != null) {
      eveningSelectToReservation = false;
      morningSelectToReservation = true;

    }else{
      eveningSelectToReservation = true;
      morningSelectToReservation = true;
    }
                       /* else if (_datetime.year ==
                                selectReservedDateEnd.year &&
                            _datetime.month == selectReservedDateEnd.month &&
                            _datetime.day == selectReservedDateEnd.day) {
                          if (ChaletsGetxController
                                  .to.selectReservedPeriodEnd.value ==
                              'Evening') {
                            // if (element.id != null) {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = true;
                            // } else {
                            // morningReserved = true;
                            // eveningReserved = true;
                            // }

                            // morningReserved = false;
                          } else
                          // if (ChaletsGetxController
                          //   .to.selectReservedPeriodEnd.value ==
                          //   'Morning')
                          {
                            // if (element.id != null) {
                            morningSelectToReservation = true;
                            eveningSelectToReservation = false;
                            // } else {
                            // morningReserved = true;
                            // }
                          }
                          */
                          // else{
                          //   morningSelectToReservation = false;
                          //   eveningSelectToReservation = true;
                          // }
                        }

                        // if(startAtDate.isBefore(selectReservedDateStart) || endAtDate.isAtSameMomentAs(selectReservedDateStart)){
                        //   print(true);
                        // }

                        */

                      }

                      print(
                          'morningReserved: $morningReserved \n eveningReserved: $eveningReserved \n morningSelectToReservation: $morningSelectToReservation \n eveningSelectToReservation: $eveningSelectToReservation');

                      return BoxCalenderInReservation(
                        _datetime.day.toString(),
                        isAvaliable: true,
                        morningReserved: morningReserved,
                        eveningReserved: eveningReserved,
                        morningSelectToReservation: morningSelectToReservation,
                        eveningSelectToReservation: eveningSelectToReservation,
                        // onClicked: (value){
                        //
                        //   print('cccccccccccccc: ${value ?? 'kom'}');
                        // },
                        // isSelected: true,
                      );

                      /*
                    } else {
                      return Container();
                    }
                    */
                    },

                    // outsideBuilder: (context, _datetime, event){
                    //   _datetime.year == _selectedDay.year ||
                    //       _datetime.month != _selectedDay.month ?
                    //   BoxCalender(_datetime.toString()) : Container();
                    // },
/*
                          selectedBuilder: (context, _datetime, events) {
                    bool morningReserved = false;
                    bool eveningReserved = false;
                    bool morningSelectToReservation = false;
                    bool eveningSelectToReservation = false;
                    if (_datetime.year == _selectedDay.year &&
                        _datetime.month == _selectedDay.month &&
                        _datetime.day == _selectedDay.day) {
                      if (ChaletsGetxController
                          .to.chalet.value.chaletReservations.isNotEmpty) {
                        ChaletsGetxController.to.chalet.value.chaletReservations
                            .forEach((element) {
                          DateTime startAtDate = DateTime.parse(element.endAt);
                          DateTime endAtDate = DateTime.parse(element.startAt);
                          if (_datetime.isAfter(
                                  startAtDate.add(Duration(days: 1))) &&
                              _datetime.isBefore(endAtDate)) {
                            //.add(Duration(days: 1)
                            // if (element.id != null) {
                            //   morningSelectToReservation = true;
                            //   eveningSelectToReservation = true;
                            // } else {
                            morningReserved = true;
                            eveningReserved = true;
                            // }
                          }
                          if (_datetime.year == startAtDate.year &&
                              _datetime.month == startAtDate.month &&
                              _datetime.day == startAtDate.day) {
                            if (element.periodStart == 'Evening') {
                              // if (element.id != null) {
                              //   eveningSelectToReservation = true;
                              //   morningSelectToReservation = false;
                              // } else {
                              eveningReserved = true;
                              morningReserved = false;
                              // }
                            } else {
                              // if (element.id != null) {
                              //   morningSelectToReservation = true;
                              //   eveningSelectToReservation = true;
                              // } else {
                              morningReserved = true;
                              eveningReserved = true;
                              // }
                            }
                          } else if (_datetime.year == endAtDate.year &&
                              _datetime.month == endAtDate.month &&
                              _datetime.day == endAtDate.day) {
                            if (element.periodEnd == 'Evening') {
                              // if (element.id != null) {
                              //   morningSelectToReservation = true;
                              //   eveningSelectToReservation = true;
                              // } else {
                              morningReserved = true;
                              eveningReserved = true;
                              // }

                              // morningReserved = false;
                            } else {
                              // if (element.id != null) {
                              //   morningSelectToReservation = true;
                              // } else {
                              morningReserved = true;
                              //  }
                            }
                          }

                          // if(ChaletsGetxController.to.selectReservedDateStart.isNotEmpty){
                          //
                          // }else{
                          //   if(_selectedDay == _datetime){
                          //     morningReserved = true;
                          //     eveningReserved= true;
                          //   }
                          // }
                        });
                        return BoxCalenderInReservation(
                          _datetime.day.toString(),
                          isAvaliable: true,
                          morningReserved: morningReserved,
                          eveningReserved: eveningReserved,
                          onClicked: (String value) {
                            print('cccccccccccccc: ${value ?? 'kom'}');
                          },

                          // isSelected: true,
                        );
                      }
                      // if (ChaletsGetxController
                      //     .to.chalet.value.chaletReservations.isNotEmpty) {
                      //   ChaletsGetxController.to.chalet.value.chaletReservations
                      //       .forEach((element) {
                      //     DateTime startAtDate = DateTime.parse(element.endAt);
                      //     DateTime endAtDate = DateTime.parse(element.startAt);
                      //     // DateTime startAtDate =
                      //     //     DateTime.now().subtract(Duration(days: 5));
                      //     // DateTime endAtDate =
                      //     //     DateTime.now().add(Duration(days: 6));
                      //     if (_datetime.isAfter(
                      //             startAtDate.add(Duration(days: 1))) &&
                      //         _datetime.isBefore(endAtDate)) {
                      //       //.add(Duration(days: 1)
                      //       morningReserved = true;
                      //       eveningReserved = true;
                      //     }
                      //     if (_datetime.year == startAtDate.year &&
                      //         _datetime.month == startAtDate.month &&
                      //         _datetime.day == startAtDate.day) {
                      //       if (element.periodStart == 'Evening') {
                      //         eveningReserved = true;
                      //         morningReserved = false;
                      //       } else {
                      //         morningReserved = true;
                      //         eveningReserved = true;
                      //       }
                      //     } else if (_datetime.year == endAtDate.year &&
                      //         _datetime.month == endAtDate.month &&
                      //         _datetime.day == endAtDate.day) {
                      //       if (element.periodEnd == 'Evening') {
                      //         morningReserved = true;
                      //         eveningReserved = true;
                      //
                      //         // morningReserved = false;
                      //       } else {
                      //         morningReserved = true;
                      //       }
                      //     }
                      //   });
                      // }
                    }
                    // ? BoxCalender(
                    //     _datetime.day.toString(),
                    //     isAvaliable: true,
                    //     isSelected: true,
                    //     morningReserved: true,
                    //     eveningReserved: true,
                    //   )
                    // : Container()
                  }

                  */
                  ),

                  onDaySelected: (selectedDay, focusedDay) {
                    // if( ChaletsGetxController.to.enabledClick.value < 2) {
                    //   ChaletsGetxController.to.enabledClick.value =  ChaletsGetxController.to.enabledClick.value+1;
                    if (ChaletsGetxController
                        .to.selectReservedDateStart.value.isEmpty) {
                      // ChaletsGetxController.to.selectReservedPeriodStart.value =
                      //     'Morning';
                      // ChaletsGetxController.to.selectReservedPeriodEnd.value =
                      //     'Evening';
                      bool allowSelect = true;
                      for (int i = 0; i < ChaletsGetxController.to.chalet.value.chaletReservations.length; i++) {
                        String  startAt = ChaletsGetxController.to.chalet.value.chaletReservations[i].startAt;
                        String  endAt = ChaletsGetxController.to.chalet.value.chaletReservations[i].endAt;

                        // else if ( (DateTime.parse(ChaletsGetxController
                        //     .to.selectReservedDateStart.value)
                        //     .isBefore(DateTime.now()
                        //     .add(Duration(days: 7))) &&
                        //     selectedDay.isAfter(DateTime.now()
                        //         .add(Duration(days: 12)))))

                        // else{
                        //   ChaletsGetxController
                        //       .to.selectReservedPeriodStart.value = 'Morning';
                        //   ChaletsGetxController
                        //       .to.selectReservedPeriodEnd.value = 'Evening';
                        // }


                        // else{
                        //   ChaletsGetxController.to.selectReservedDateStart.value =
                        //         FormatDateTimeMassage.getDateTime(selectedDay);
                        //     ChaletsGetxController.to.selectReservedDateEnd.value =
                        //         FormatDateTimeMassage.getDateTime(selectedDay);
                        //     // if (ChaletsGetxController
                        //     //     .to.allowChangeStartPeriod.value) {
                        //       ChaletsGetxController
                        //           .to.selectReservedPeriodStart.value = 'Morning';
                        //    // }
                        //    //  if (ChaletsGetxController
                        //    //      .to.allowChangeEndPeriod.value) {
                        //       ChaletsGetxController
                        //           .to.selectReservedPeriodEnd.value = 'Evening';
                        // }
                        if ((selectedDay.isBefore(DateTime.parse(endAt)) &&
                            selectedDay.isAfter(DateTime.parse(startAt)))) {
                          print('iiiiiiiiiiii: ${i}');

                          // ChaletsGetxController
                          //     .to.selectReservedPeriodStart.value = 'Morning';
                          // ChaletsGetxController
                          //     .to.selectReservedPeriodEnd.value = 'Evening';
                          if (selectedDay.day ==
                              DateTime.parse(startAt).day &&
                              selectedDay.month ==
                                  DateTime.parse(startAt).month) {
                            if (ChaletsGetxController.to.chalet.value
                                .chaletReservations[i].periodStart ==
                                'Morning'){
                              allowSelect = false;
                              break;
                            }
                          }else  if (selectedDay.day ==
                              DateTime.parse(endAt).day &&
                              selectedDay.month ==
                                  DateTime.parse(endAt).month) {
                            if (ChaletsGetxController.to.chalet.value
                                .chaletReservations[i].periodEnd ==
                                'Evening'){
                              allowSelect = false;
                              break;
                            }
                          }else{
                            allowSelect = false;
                            break;
                          }

                        }
                        if (selectedDay.day ==
                            DateTime.parse(startAt).day &&
                            selectedDay.month ==
                                DateTime.parse(startAt).month) {
                          if (ChaletsGetxController.to.chalet.value
                                  .chaletReservations[i].periodStart ==
                              'Evening') {
                            print(
                                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                            ChaletsGetxController
                                .to.selectReservedPeriodStart.value = 'Morning';
                            ChaletsGetxController
                                .to.selectReservedPeriodEnd.value = 'Morning';
                            // ChaletsGetxController
                            //     .to.selectReservedPeriodStart.value = 'Morning';
                            ChaletsGetxController
                                .to.allowChangeEndPeriod.value = false;
                            allowSelect = false;

                            ChaletsGetxController
                                    .to.selectReservedDateEnd.value =
                                FormatDateTimeMassage.getDateTime(selectedDay);

                            ChaletsGetxController
                                    .to.selectReservedDateStart.value =
                                FormatDateTimeMassage.getDateTime(selectedDay);

                            //  break;
                          }
                          // if (ChaletsGetxController.to.chalet.value
                          //         .chaletReservations[i].periodStart ==
                          //     'Morning') {
                          //   ChaletsGetxController
                          //       .to.selectReservedPeriodStart.value = 'Evening';
                          //   ChaletsGetxController
                          //       .to.selectReservedPeriodEnd.value = 'Evening';
                          // }
                        }
                        if (selectedDay.day ==
                            DateTime.parse(endAt).day &&
                            selectedDay.month ==
                                DateTime.parse(endAt).month) {
                          if (ChaletsGetxController.to.chalet.value
                              .chaletReservations[i].periodEnd != 'Evening') {
                            // ChaletsGetxController.to.selectReservedDateEnd.value =
                            //     FormatDateTimeMassage.getDateTime(selectedDay);
                            // allowSelect = false;
                            // break;
                            print(
                                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                            ChaletsGetxController
                                .to.selectReservedPeriodStart.value = 'Evening';
                            ChaletsGetxController
                                .to.allowChangeStartPeriod.value = false;
                            allowSelect = true;
                            break;
                          } else {
                            // ChaletsGetxController.to.selectReservedPeriodStart.value = 'Morning';
                            allowSelect = false;
                            break;
                          }
                        }

                        // else
                        //
                        // if (selectedDay.day ==
                        //     DateTime.parse(startAt).day &&
                        //     selectedDay.month ==
                        //         DateTime.parse(startAt).month) {
                        //   if (ChaletsGetxController.to.chalet.value
                        //       .chaletReservations[i].periodStart == 'Evening') {
                        //     // ChaletsGetxController.to.selectReservedDateEnd.value =
                        //     //     FormatDateTimeMassage.getDateTime(selectedDay);
                        //     // allowSelect = false;
                        //     // break;
                        //     print(
                        //         'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                        //     ChaletsGetxController
                        //         .to.selectReservedPeriodStart.value = 'Morning';
                        //     ChaletsGetxController
                        //         .to.selectReservedPeriodEnd.value = 'Morning';
                        //     ChaletsGetxController
                        //         .to.allowChangeStartPeriod.value = false;
                        //     allowSelect = true;
                        //     break;
                        //   } else {
                        //     // ChaletsGetxController.to.selectReservedPeriodStart.value = 'Morning';
                        //     allowSelect = false;
                        //     break;
                        //   }
                        // }
                        // else
                        // if (selectedDay.isBefore(
                        //         DateTime.now().add(Duration(days: 12))) &&
                        //     selectedDay.isAfter(
                        //         DateTime.now().add(Duration(days: 7)))) {
                        //   print('iiiiiiiiiiii: ${i}');
                        //   allowSelect = false;
                        //
                        //   break;
                        // }
                      }
                      if (allowSelect) {
                        print('true');
                        ChaletsGetxController.to.selectReservedDateStart.value =
                            FormatDateTimeMassage.getDateTime(selectedDay);
                        ChaletsGetxController.to.selectReservedDateEnd.value =
                            FormatDateTimeMassage.getDateTime(selectedDay);
                        if (ChaletsGetxController
                            .to.allowChangeStartPeriod.value) {
                          ChaletsGetxController
                              .to.selectReservedPeriodStart.value = 'Morning';
                        }
                        if (ChaletsGetxController
                            .to.allowChangeEndPeriod.value) {
                          ChaletsGetxController
                              .to.selectReservedPeriodEnd.value = 'Evening';
                        }
                        // ChaletsGetxController
                        //       .to.selectReservedPeriodStart.value = 'Morning';
                        //   ChaletsGetxController
                        //       .to.selectReservedPeriodEnd.value = 'Evening';
                      }

                      // print()
                    } else {
                      // ChaletsGetxController.to.selectReservedDateStart.value = FormatDateTimeMassage.getDateTime(selectedDay);
                      if (!selectedDay.isBefore(DateTime.parse(
                          ChaletsGetxController
                              .to.selectReservedDateStart.value))) {
                        bool allowSelect = true;
                        for (int i = 0;
                            i <
                                ChaletsGetxController
                                    .to.chalet.value.chaletReservations.length;
                            i++) {
                          String  startAt = ChaletsGetxController.to.chalet.value.chaletReservations[i].startAt;
                          String  endAt = ChaletsGetxController.to.chalet.value.chaletReservations[i].endAt;
                          // print('iiiiiiiiiiii: ${i}');
                          // ChaletsGetxController
                          //       .to.selectReservedPeriodStart.value = 'Morning';
                          //   ChaletsGetxController
                          //       .to.selectReservedPeriodEnd.value = 'Evening';

                          if ((selectedDay.isBefore(
                              DateTime.parse(endAt)) &&
                                  selectedDay.isAfter(
                                      DateTime.parse(startAt))) ||
                              (DateTime.parse(ChaletsGetxController
                                          .to.selectReservedDateStart.value)
                                      .isBefore( DateTime.parse(startAt)) &&
                                  selectedDay.isAfter( DateTime.parse(endAt)))) {
                            print('iiiiiiiiiiii: ${i}');

                            // ChaletsGetxController
                            //     .to.selectReservedPeriodStart.value = 'Morning';
                            // ChaletsGetxController
                            //     .to.selectReservedPeriodEnd.value = 'Evening';
                            if (selectedDay.day ==
                                DateTime.parse(startAt).day &&
                                selectedDay.month ==
                                    DateTime.parse(startAt).month) {
                              if (ChaletsGetxController.to.chalet.value
                                  .chaletReservations[i].periodStart ==
                                  'Morning'){
                                allowSelect = false;
                                break;
                              }
                            }else  if (selectedDay.day ==
                                DateTime.parse(endAt).day &&
                                selectedDay.month ==
                                    DateTime.parse(endAt).month) {
                              if (ChaletsGetxController.to.chalet.value
                                  .chaletReservations[i].periodEnd ==
                                  'Evening'){
                                allowSelect = false;
                                break;
                              }
                            }else{
                              allowSelect = false;
                              break;
                            }
                          } else {
                            // else{
                            //   ChaletsGetxController
                            //       .to.selectReservedPeriodStart.value = 'Morning';
                            //   ChaletsGetxController
                            //       .to.selectReservedPeriodEnd.value = 'Evening';
                            // }
                          }


                          /*
                          if ((selectedDay.isBefore(
                              DateTime.parse(endAt).subtract(Duration(days: 1))) &&
                              selectedDay.isAfter(
                                  DateTime.parse(startAt).add(Duration(days: 1)))) ||
                              (DateTime.parse(ChaletsGetxController
                                  .to.selectReservedDateStart.value)
                                  .isBefore( DateTime.parse(startAt).add(Duration(days: 1))) &&
                                  selectedDay.isAfter( DateTime.parse(endAt).subtract(Duration(days: 1)))) ||
                              (selectedDay
                                  .isBefore( DateTime.parse(startAt).add(Duration(days: 1))) &&
                                  DateTime.parse(ChaletsGetxController
                                      .to.selectReservedDateEnd.value).isAfter( DateTime.parse(endAt).subtract(Duration(days: 1))))) {
                            print('iiiiiiiiiiii: ${i}');
                            if ((selectedDay.day ==
                                DateTime.parse(startAt).day &&
                                selectedDay.month ==
                                    DateTime.parse(startAt).month) && (selectedDay.day ==
                                DateTime.parse(endAt).day &&
                                selectedDay.month ==
                                    DateTime.parse(endAt).month)) {
                              if (ChaletsGetxController.to.chalet.value
                                  .chaletReservations[i].periodStart ==
                                  'Evening') {
                                // ChaletsGetxController.to.selectReservedDateEnd.value =
                                //     FormatDateTimeMassage.getDateTime(selectedDay);
                                print(
                                    'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                                ChaletsGetxController
                                    .to.selectReservedPeriodEnd.value = 'Morning';
                                ChaletsGetxController
                                    .to.allowChangeEndPeriod.value = false;
                                allowSelect = true;
                                //  break;
                              }else{
                                // ChaletsGetxController
                                //     .to.selectReservedPeriod.value = 'Evening';
                              }
                            }
                            else
                            if (selectedDay.day ==
                                DateTime.parse(startAt).day &&
                                selectedDay.month ==
                                    DateTime.parse(startAt).month) {
                              if (ChaletsGetxController.to.chalet.value
                                  .chaletReservations[i].periodStart ==
                                  'Evening') {
                                // ChaletsGetxController.to.selectReservedDateEnd.value =
                                //     FormatDateTimeMassage.getDateTime(selectedDay);
                                print(
                                    'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                                ChaletsGetxController
                                    .to.selectReservedPeriodEnd.value = 'Morning';
                                ChaletsGetxController
                                    .to.allowChangeEndPeriod.value = false;
                                allowSelect = true;
                                //  break;
                              } else {
                                // ChaletsGetxController
                                //     .to.selectReservedPeriodEnd.value =
                                // 'Evening';
                                // ChaletsGetxController.to.allowChangeEndPeriod.value = false;
                                allowSelect = false;
                                //   break;
                              }
                            }else {
                              // ChaletsGetxController
                              //     .to.selectReservedPeriodStart.value = 'Morning';
                              // ChaletsGetxController
                              //     .to.selectReservedPeriodEnd.value = 'Evening';
                              allowSelect = false;
                              break;
                            }
                          } else {
                            // else{
                            //   ChaletsGetxController
                            //       .to.selectReservedPeriodStart.value = 'Morning';
                            //   ChaletsGetxController
                            //       .to.selectReservedPeriodEnd.value = 'Evening';
                            // }
                          }
                          */



/*
                          if ((selectedDay.day ==
                              DateTime.parse(startAt).day &&
                              selectedDay.month ==
                                  DateTime.parse(startAt).month) && (selectedDay.day ==
                              DateTime.parse(endAt).day &&
                              selectedDay.month ==
                                  DateTime.parse(endAt).month)) {
                            if (ChaletsGetxController.to.chalet.value
                                .chaletReservations[i].periodStart ==
                                'Evening') {
                              // ChaletsGetxController.to.selectReservedDateEnd.value =
                              //     FormatDateTimeMassage.getDateTime(selectedDay);
                              print(
                                  'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                              ChaletsGetxController
                                  .to.selectReservedPeriodEnd.value = 'Morning';
                              ChaletsGetxController
                                  .to.allowChangeEndPeriod.value = false;
                              allowSelect = true;
                              //  break;
                            }else{
                              // ChaletsGetxController
                              //     .to.selectReservedPeriod.value = 'Evening';
                            }
                          }
                          else

 */
                          if (selectedDay.day ==
                              DateTime.parse(startAt).day &&
                              selectedDay.month ==
                                  DateTime.parse(startAt).month) {
                            if (ChaletsGetxController.to.chalet.value
                                    .chaletReservations[i].periodStart ==
                                'Evening') {
                              // ChaletsGetxController.to.selectReservedDateEnd.value =
                              //     FormatDateTimeMassage.getDateTime(selectedDay);
                              print(
                                  'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                              ChaletsGetxController
                                  .to.selectReservedPeriodEnd.value = 'Morning';
                              ChaletsGetxController
                                  .to.allowChangeEndPeriod.value = false;
                              allowSelect = true;
                              //  break;
                            } else {
                              // ChaletsGetxController
                              //     .to.selectReservedPeriodEnd.value =
                              // 'Evening';
                              // ChaletsGetxController.to.allowChangeEndPeriod.value = false;
                              allowSelect = false;
                              //   break;
                            }
                          }


                          // if (selectedDay.year >=
                          //     DateTime.now().add(Duration(days: 12)).year && selectedDay.day ==
                          //         DateTime.now().add(Duration(days: 12)).day &&
                          //     selectedDay.month >=
                          //         DateTime.now()
                          //             .add(Duration(days: 12))
                          //             .month) {
                          //   if ('Morning' != 'Evening') {
                          //     // ChaletsGetxController.to.selectReservedDateEnd.value =
                          //     //     FormatDateTimeMassage.getDateTime(selectedDay);
                          //     // allowSelect = false;
                          //     // break;
                          //     print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                          //     ChaletsGetxController.to.selectReservedPeriodStart
                          //         .value = 'Evening';
                          //     // ChaletsGetxController.to.selectReservedPeriodEnd
                          //     //     .value = 'Evening';
                          //     ChaletsGetxController
                          //         .to.allowChangeStartPeriod.value = false;
                          //
                          //     allowSelect = true;
                          //     // break;
                          //   } else {
                          //     // ChaletsGetxController.to.selectReservedPeriodEnd
                          //     //     .value = 'Morning';
                          //     // ChaletsGetxController.to.selectReservedPeriodEnd
                          //     //     .value = 'Evening';
                          //     allowSelect = false;
                          //     // break;
                          //   }
                          // }

                          // else
                          //
                          // if (selectedDay.day ==
                          //     DateTime.now().add(Duration(days: 12)).day &&
                          //     selectedDay.month ==
                          //         DateTime.now().add(Duration(days: 12)).month) {
                          //   if ('Morning' != 'Evening') {
                          //     // ChaletsGetxController.to.selectReservedDateEnd.value =
                          //     //     FormatDateTimeMassage.getDateTime(selectedDay);
                          //     // allowSelect = false;
                          //     // break;
                          //     print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                          //     ChaletsGetxController.to.selectReservedPeriodStart.value = 'Evening';
                          //     allowSelect = true;
                          //     break;
                          //   }else{
                          //     // ChaletsGetxController.to.selectReservedPeriodStart.value = 'Morning';
                          //     allowSelect = false;
                          //     break;
                          //   }
                          // }
                          // if (selectedDay.day ==
                          //     DateTime.now().add(Duration(days: 12)).day &&
                          //     selectedDay.month ==
                          //         DateTime.now().add(Duration(days: 12)).month) {
                          //   if ( 'Morning'== 'Evening') { //ChaletsGetxController.to.chalet.value.chaletReservations[i].periodStart
                          //
                          //     // ChaletsGetxController.to.selectReservedDateEnd.value =
                          //     //     FormatDateTimeMassage.getDateTime(selectedDay);
                          //     print(
                          //         'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccc');
                          //     ChaletsGetxController
                          //         .to.selectReservedPeriodEnd.value = 'Morning';
                          //     allowSelect = true;
                          //     break;
                          //   } else {}
                          // }
                        }
                        if (allowSelect) {
                          ChaletsGetxController.to.selectReservedDateEnd.value =
                              FormatDateTimeMassage.getDateTime(selectedDay);
                          print('true');

                          // ChaletsGetxController.to.selectReservedDateStart.value = FormatDateTimeMassage.getDateTime(selectedDay);
                          // ChaletsGetxController.to.selectReservedDateEnd.value = FormatDateTimeMassage.getDateTime(selectedDay);
                        }

                        //  }

                        // else {
                        //   ChaletsGetxController.to.selectReservedDateStart.value =
                        //       FormatDateTimeMassage.getDateTime(selectedDay);
                        //   ChaletsGetxController.to.selectReservedDateEnd.value =
                        //       FormatDateTimeMassage.getDateTime(selectedDay);
                        // }
                      }
                    }

                    //  }

                    //  setState(() {
                    print(
                        'selected start: ${ChaletsGetxController.to.selectReservedDateStart.value}');
                    //   });
                    print(
                        'selected end: ${ChaletsGetxController.to.selectReservedDateEnd.value}');
                  },
                  //   // setState(() {
                  //
                  //     ChaletsGetxController.to.selectReservedDateStart.value =  FormatDateTimeMassage.getDateTime(selectedDay);
                  //
                  //     // ChaletReservations myReservation = ChaletsGetxController
                  //     //     .to
                  //     //     .chalet
                  //     //     .value
                  //     //     .chaletReservations[ChaletsGetxController
                  //     //         .to.chalet.value.chaletReservations.length -
                  //     //     1];
                  //     // if (myReservation.id != null) {
                  //     //   ChaletsGetxController.to.chalet.value.chaletReservations
                  //     //       .add(ChaletReservations(
                  //     //           id: 0,
                  //     //           startAt: ,
                  //     //           endAt: FormatDateTimeMassage.getDateTime(
                  //     //               selectedDay),
                  //     //           periodStart: 'Morning',
                  //     //           periodEnd: 'Evining'));
                  //     //   print('***** edit');
                  //     // } else {
                  //     //   bool isreserved = false;
                  //     //   // for (var i = 0;
                  //     //   //     i <
                  //     //   //         ChaletsGetxController
                  //     //   //             .to.chalet.value.chaletReservations.length;
                  //     //   //     i++) {
                  //     //   //   DateTime startAtDate = DateTime.parse(
                  //     //   //       ChaletsGetxController
                  //     //   //           .to.chalet.value.chaletReservations[i].startAt);
                  //     //   //   DateTime endAtDate = DateTime.parse(
                  //     //   //       ChaletsGetxController.to.chalet.value
                  //     //   //           .chaletReservations[i].endAt);
                  //     //   //   if ((!selectedDay.isBefore(startAtDate) &&
                  //     //   //           !selectedDay.isBefore(endAtDate) ||
                  //     //   //       !selectedDay.isAfter(startAtDate) &&
                  //     //   //           !selectedDay.isAfter(endAtDate))) {
                  //     //   //     isreserved = true;
                  //     //   //     break;
                  //     //   //   }
                  //     //   // }
                  //     //   // if (!isreserved) {
                  //     //     ChaletsGetxController
                  //     //         .to.chalet.value.chaletReservations
                  //     //         .add(ChaletReservations(
                  //     //             id: 0,
                  //     //             startAt: FormatDateTimeMassage.getDateTime(
                  //     //                 selectedDay),
                  //     //             endAt: FormatDateTimeMassage.getDateTime(
                  //     //                 selectedDay),
                  //     //             periodStart: 'Morning',
                  //     //             periodEnd: 'Evining'));
                  //     //     print('***** Add');
                  //     //   }
                  // //    }
                  //
                  //     // print(FormatDateTimeMassage.getDateTime(selectedDay));
                  //     // if(ChaletsGetxController.to.selectReservedDateStart.value.isNotEmpty){
                  //     //   ChaletsGetxController.to.selectReservedDateEnd.value = focusedDay.toString();
                  //     // }else{
                  //     //   ChaletsGetxController.to.selectReservedDateStart.value = selectedDay.toString();
                  //     //   ChaletsGetxController.to.selectReservedDateEnd.value = _selectedDay.toString();
                  //     // }
                  //     // CalenderGetxController.to.selectedDate.value = selectedDay.add(Duration(days: 1)).toString();
                  //     //                   ChaletsGetxController.to.chalet.value.chaletReservations.forEach((element) {
                  //     //                     DateTime startAtDate = DateTime.parse(element.endAt);
                  //     //                     DateTime endAtDate = DateTime.parse(element.startAt);
                  //     //
                  //     // if (selectedDay.year == startAtDate.year &&
                  //     //     selectedDay.month == startAtDate.month &&
                  //     //     selectedDay.day == startAtDate.day) {
                  //     //
                  //     // }
                  //     //
                  //     //                   });
                  //     _selectedDay = selectedDay;
                  //     _focusedDay =
                  //         focusedDay; // update `_focusedDay` here as well
                  //  // });
                  // },

                  firstDay: _firstDay,
                  lastDay: _lastDay,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GetX<ChaletsGetxController>(
                  init: ChaletsGetxController(),
                  builder: (ChaletsGetxController controller) {
                    return Expanded(
                        child: controller.showMessageError.value
                            ? Padding(
                                padding: EdgeInsetsDirectional.only(
                                    bottom: 20.h, start: 40.w),
                                child: SvgPicture.asset(
                                    'assets/images/error_message.svg'),
                              )
                            : Container()
                        // child: Container(
                        //   height: 41.h,
                        //   decoration: BoxDecoration(
                        //     color:
                        //   ),
                        // ),
                        );
                  }),
              SizedBox(
                height: 140.h,
                width: 90.w,
                child: Column(
                  children: [
                    // Center(
                    //   child: SizedBox(
                    //     height: 60,
                    //     width: 60,
                    //     child: Stack(
                    //       children: [
                    //         Center(child: SvgPicture.asset('assets/images/back_btn_polygon.svg')),
                    //         Center(child: Icon(Icons.edit, size: 20, color: Colors.white,))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ChaletsGetxController
                                .to.selectReservedDateStart.value = '';
                            ChaletsGetxController
                                .to.selectReservedDateEnd.value = '';
                            ChaletsGetxController
                                .to.selectReservedPeriodStart.value = '';
                            ChaletsGetxController
                                .to.selectReservedPeriodEnd.value = '';
                            ChaletsGetxController
                                .to.allowChangeStartPeriod.value = true;
                            ChaletsGetxController
                                .to.allowChangeEndPeriod.value = true;
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(0)),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: primaryColor
                    //   ),
                    //   child: Icon(Icons.edit, color: Colors.white,),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        _performDate();
                      },
                      child: Container(
                        // margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/FTBPK.png"),
                                fit: BoxFit.cover)),
                        padding: EdgeInsets.only(bottom: 8.h),
                        height: 70.h,
                        width: 70.w,
                        child: Transform.flip(
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 33.r,
                            color: Colors.white,
                          ),
                          flipX: true,
                        ),
                      ),
                         // SvgPicture.asset('assets/images/polygon_btn_go.svg'),
                      // Image.asset("assets/icons/btn_go.png"),
                      //SvgPicture.asset('assets/icons/btn_go.svg')
                      // Container(
                      // margin: EdgeInsets.only(top: 10.h),
                      // decoration: const BoxDecoration(
                      // image: DecorationImage(
                      // image: AssetImage("assets/icons/btn_go.png"),
                      // fit: BoxFit.cover)),
                      // padding: EdgeInsets.only(bottom: 5.h),
                      // height: 65.h,
                      // width: 65.w,
                      //
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _performDate() {
    if (_checkDate()) {
      Get.to(ChaletReservationScreen());
    }
  }

  bool _checkDate() {
    if (ChaletsGetxController.to.selectReservedDateStart.isNotEmpty &&
        ChaletsGetxController.to.selectReservedDateEnd.isNotEmpty &&
        ChaletsGetxController.to.selectReservedPeriodStart.isNotEmpty &&
        ChaletsGetxController.to.selectReservedPeriodEnd.isNotEmpty) {
      return true;
    }
    ChaletsGetxController.to.showMessageError.value = true;
    Future.delayed(Duration(seconds: 2), () {
      ChaletsGetxController.to.showMessageError.value = false;
    });

    return false;
  }

  bool isSameMonth(DateTime day1, DateTime day2) {
    return day1.year == day2.year && day1.month == day2.month;
  }

  bool isSameMonthOrLater(DateTime day1, DateTime day2) {
    return day1.isAfter(DateTime(day2.year, day2.month)) ||
        day1.year == day2.year && day1.month == day2.month;
  }

// bool _isDateDisabled(DateTime day) {
//   // Check if the day is in the list of disabled dates
//   return disabledDates.contains(day);
// }
}
