import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet/chalet_have_descount.dart';
import 'package:chalets/models/chalet/chalet_prices.dart';
import 'package:chalets/models/chalet/chalet_reservations.dart';
import 'package:chalets/widgets/add_discount_code_bottom_sheet.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';

import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChaletReservationScreen extends StatefulWidget {
  const ChaletReservationScreen({Key? key}) : super(key: key);

  @override
  State<ChaletReservationScreen> createState() => _ChaletReservationScreenState();
}

class _ChaletReservationScreenState extends State<ChaletReservationScreen>
    with Helpers {
  late double totalPrice;


  @override
  void initState() {
    totalPrice = sumPrice();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          )),
          title: Text(
            lang.tr('reservation'),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
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
                                            const EdgeInsets.all(
                                                7.5),
                                            child: Text(
                                              '7:00 ${controller.selectReservedPeriodStart.value == 'Evening' ? 'PM' : 'AM'}',
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
                                        // SizedBox(
                                        //   height: 28.h,
                                        //   width: 60.w,
                                        //   child: controller
                                        //       .allowChangeEndPeriod
                                        //       .value
                                        //       ? ElevatedButton(
                                        //       onPressed: () {
                                        //         if (controller
                                        //             .allowChangeStartPeriod
                                        //             .value) {
                                        //           if (DateTime.parse(controller
                                        //               .selectReservedDateStart
                                        //               .value)
                                        //               .day ==
                                        //               DateTime.parse(controller
                                        //                   .selectReservedDateEnd
                                        //                   .value)
                                        //                   .day &&
                                        //               DateTime.parse(controller
                                        //                   .selectReservedDateStart
                                        //                   .value)
                                        //                   .month ==
                                        //                   DateTime.parse(controller
                                        //                       .selectReservedDateEnd
                                        //                       .value)
                                        //                       .month) {
                                        //             if (controller
                                        //                 .selectReservedPeriodStart
                                        //                 .value ==
                                        //                 'Evening') {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Morning';
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Morning';
                                        //             } else {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Evening';
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Evening';
                                        //             }
                                        //             setState(() {});
                                        //           } else {
                                        //             if (controller
                                        //                 .selectReservedPeriodStart ==
                                        //                 'Evening') {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Morning';
                                        //             } else {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Evening';
                                        //             }
                                        //             setState(() {});
                                        //           }
                                        //         }
                                        //
                                        //         // setState(() {
                                        //         //
                                        //         // });
                                        //       },
                                        //       style: ElevatedButton
                                        //           .styleFrom(
                                        //           padding:
                                        //           EdgeInsets
                                        //               .all(
                                        //               0)),
                                        //       child: Text(
                                        //         controller.selectReservedPeriodStart ==
                                        //             'Evening'
                                        //             ? 'Morning'
                                        //             : 'Evening',
                                        //         style: GoogleFonts
                                        //             .inter(
                                        //             fontSize:
                                        //             12.sp),
                                        //       ))
                                        //       : Container(),
                                        // )
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
                                            const EdgeInsets.all(
                                                7.5),
                                            child: Text(
                                              '6:00 ${controller.selectReservedPeriodEnd.value == 'Evening' ? 'PM' : 'AM'}',
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
                                        // controller.allowChangeEndPeriod
                                        //     .value
                                        //     ? SizedBox(
                                        //   height: 28.h,
                                        //   width: 60.w,
                                        //   child: ElevatedButton(
                                        //       onPressed: () {
                                        //         if (controller
                                        //             .allowChangeEndPeriod
                                        //             .value) {
                                        //           if (DateTime.parse(controller
                                        //               .selectReservedDateStart
                                        //               .value)
                                        //               .day ==
                                        //               DateTime.parse(controller
                                        //                   .selectReservedDateEnd
                                        //                   .value)
                                        //                   .day &&
                                        //               DateTime.parse(controller
                                        //                   .selectReservedDateStart
                                        //                   .value)
                                        //                   .month ==
                                        //                   DateTime.parse(controller
                                        //                       .selectReservedDateEnd
                                        //                       .value)
                                        //                       .month) {
                                        //             if (controller
                                        //                 .selectReservedPeriodEnd
                                        //                 .value ==
                                        //                 'Evening') {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Morning';
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Morning';
                                        //             } else {
                                        //               controller
                                        //                   .selectReservedPeriodStart
                                        //                   .value =
                                        //               'Evening';
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Evening';
                                        //             }
                                        //             setState(() {});
                                        //           } else {
                                        //
                                        //             if (controller
                                        //                 .selectReservedPeriodEnd ==
                                        //                 'Evening') {
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Morning';
                                        //             } else {
                                        //               controller
                                        //                   .selectReservedPeriodEnd
                                        //                   .value =
                                        //               'Evening';
                                        //             }
                                        //             setState(
                                        //                     () {});
                                        //           }
                                        //         }
                                        //       },
                                        //       style: ElevatedButton
                                        //           .styleFrom(
                                        //           padding:
                                        //           EdgeInsets.all(
                                        //               0)),
                                        //       child: Text(
                                        //         controller.selectReservedPeriodEnd ==
                                        //             'Evening'
                                        //             ? 'Morning'
                                        //             : 'Evening',
                                        //         style: GoogleFonts
                                        //             .inter(
                                        //             fontSize:
                                        //             12.sp),
                                        //       )),
                                        // )
                                        //     : Container()
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
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          lang.tr('price/half_day'),
                          style: GoogleFonts.inter(
                              fontSize: 17.5.sp, fontWeight: FontWeight.w400),
                        )),
                        Text('5 * 430')
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                             lang.tr('services_fee'),
                              style: GoogleFonts.inter(
                                  fontSize: 17.5.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '40',
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          lang.tr('discount_code'),
                          style: GoogleFonts.inter(
                              fontSize: 17.5.sp, fontWeight: FontWeight.w400),
                        )),
                        SizedBox(
                          height: 30.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bottomSheet(
                                  context: context,
                                  body: AddDiscountCodeBottomSheet());
                            },
                            child: Text(
                             lang.tr('add_code'),
                              style: GoogleFonts.inter(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 43.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          lang.tr('total'),
                          style: GoogleFonts.inter(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        )),
                        Icon(MyFlutterApp.between_numbers2),
                        Text(
                          '$totalPrice',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.black12,
                                blurRadius: 2.5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          MyFlutterApp.between_numbers2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              margin: EdgeInsetsDirectional.only(bottom: 40.h),
              child: SizedBox(
                width: 270.w,
                height: 47.h,
                child: ElevatedButton(
                  onPressed: () {
                   _reserveChalet();

                  },
                  child: Text(
                   lang.tr('confirm'),
                    style: GoogleFonts.inter(
                        fontSize: 22.5.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47.r))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _reserveChalet() async {
    showLoadingDialog(context);

    // Future.delayed(Duration(seconds: 5), () {
    //   Get.back();
    // });

    ChaletReservations chaletReservations = ChaletReservations(id: 251,
        /*
        ChaletsGetxController.to.chalet.value.id
         */
        startAt:  ChaletsGetxController.to.selectReservedDateStart.value,
        endAt: ChaletsGetxController.to.selectReservedDateEnd.value, periodStart: ChaletsGetxController.to.selectReservedPeriodStart.value,
        periodEnd: ChaletsGetxController.to.selectReservedPeriodEnd.value);
    print(ChaletsGetxController.to.chalet.value.id,);

    // ApiResponse result = ChaletsApiController
    ApiResponse apiResponse = await ChaletsApiController().reserveChalet(chaletReservations: chaletReservations, totalPrice: totalPrice );
    // showSnackBarByGet(title: apiResponse.message, error: false);

    if (apiResponse.success) {
      Get.back();
      Get.back();
      Get.back();
      showSnackBarByGet(title: 'Success', error: !apiResponse.success);

      // Get.off(DetailsScreen());
    } else {
      Get.back();
      showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);
    }
  }

  double sumPrice(){
    double price = 0;
    var chaletPrices =ChaletsGetxController
        .to.chalet.value.chaletPrices[0];
    int numberOfDays = DateTime.parse(ChaletsGetxController.to.selectReservedDateEnd.value).difference(DateTime.parse(ChaletsGetxController.to.selectReservedDateStart.value)).inDays + 1;
print('sum: $numberOfDays');
    for(int i = 0; i< numberOfDays; i++){
       String dayName =DateFormat('EEEE').format(DateTime.parse(ChaletsGetxController.to.selectReservedDateStart.value).add(Duration(days: i)));
       if(i == 0){
         if(ChaletsGetxController.to.selectReservedPeriodStart == 'Evening'){
           if(dayName == 'Saturday'){
             price += double.parse(chaletPrices.saturdayPm);

           }else if(dayName == 'Sunday'){
             price += double.parse(chaletPrices.sundayPm);
           }else if(dayName == 'Monday'){
             price += double.parse(chaletPrices.mondayPm);
           }else if(dayName == 'Tuesday'){
             price += double.parse(chaletPrices.tuesdayPm);
           }else if(dayName == 'Wednesday'){
             price += double.parse(chaletPrices.wednesdayPm);
           }else if(dayName == 'Thursday'){
             price += double.parse(chaletPrices.thursdayPm);
           }else if(dayName == 'Friday'){
             price += double.parse(chaletPrices.fridayPm);
           }
         }else{
           if(dayName == 'Saturday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.saturdayPm);

           }else if(dayName == 'Sunday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.sundayPm);
           }else if(dayName == 'Monday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.mondayPm);
           }else if(dayName == 'Tuesday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.tuesdayPm);
           }else if(dayName == 'Wednesday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.wednesdayPm);
           }else if(dayName == 'Thursday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.thursdayPm);
           }else if(dayName == 'Friday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.fridayPm);
           }
         }


       }else if(i < numberOfDays){
         if(dayName == 'Saturday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.saturdayPm);

         }else if(dayName == 'Sunday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.sundayPm);
         }else if(dayName == 'Monday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.mondayPm);
         }else if(dayName == 'Tuesday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.tuesdayPm);
         }else if(dayName == 'Wednesday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.wednesdayPm);
         }else if(dayName == 'Thursday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.thursdayPm);
         }else if(dayName == 'Friday'){
           price += double.parse(chaletPrices.saturdayAm);
           price += double.parse(chaletPrices.fridayPm);
         }

       }else if(i == numberOfDays){
         if(ChaletsGetxController.to.selectReservedPeriodStart == 'Evening'){
           if(dayName == 'Saturday'){
             price += double.parse(chaletPrices.saturdayPm);

           }else if(dayName == 'Sunday'){
             price += double.parse(chaletPrices.sundayPm);
           }else if(dayName == 'Monday'){
             price += double.parse(chaletPrices.mondayPm);
           }else if(dayName == 'Tuesday'){
             price += double.parse(chaletPrices.tuesdayPm);
           }else if(dayName == 'Wednesday'){
             price += double.parse(chaletPrices.wednesdayPm);
           }else if(dayName == 'Thursday'){
             price += double.parse(chaletPrices.thursdayPm);
           }else if(dayName == 'Friday'){
             price += double.parse(chaletPrices.fridayPm);
           }
         }else{
           if(dayName == 'Saturday'){
             price += int.parse(chaletPrices.saturdayAm);
             price += int.parse(chaletPrices.saturdayPm);

           }else if(dayName == 'Sunday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.sundayPm);
           }else if(dayName == 'Monday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.mondayPm);
           }else if(dayName == 'Tuesday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.tuesdayPm);
           }else if(dayName == 'Wednesday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.wednesdayPm);
           }else if(dayName == 'Thursday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.thursdayPm);
           }else if(dayName == 'Friday'){
             price += double.parse(chaletPrices.saturdayAm);
             price += double.parse(chaletPrices.fridayPm);
           }
         }
       }
      print('Day: ${dayName} $i $numberOfDays');
       print('price: $price');

    }

    return price;

  }
}
