import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/widgets/add_discount_code_bottom_sheet.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBalanceScreen extends StatefulWidget {
  const AccountBalanceScreen({Key? key}) : super(key: key);

  @override
  State<AccountBalanceScreen> createState() => _AccountBalanceScreenState();
}

class _AccountBalanceScreenState extends State<AccountBalanceScreen>
    with Helpers {
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
            "account_balance".tr(),
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
              child: Row(
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
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
                      fit: BoxFit.cover,
                      // fit: BoxFit.fill,
                      placeholder: (context, url) => SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(
                              15.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Best Morocco Chalet",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
//edit
                                      Container(
                                        width: 270.w,
                                        margin: EdgeInsets.only(
                                            top: 8.h, bottom: 8.h, left: 4.w),
                                        child: ClipOval(
                                          child: Divider(
                                            color: const Color(0xFF017C9B),
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
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                    text: "1006",
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text: " m",
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                            "Palestine - Gaza Strip - Gaza - AlRemal",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.black)),

              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.all(12.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'check_in_date'.tr(),
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF252525),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Text(
                                '2/7/2023',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 12.5,
                            // ),
                            Text(
                              'check_out_date'.tr(),
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF252525),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Text(
                                '2/7/2023',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'check_in_time'.tr(),
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF252525),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Text(
                                '7:00 AM',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 12.5,
                            // ),
                            Text(
                              'check_out_time'.tr(),
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF252525),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Text(
                                '6:00 PM',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF252525),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

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
                          'price/half_day'.tr(),
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
                              'services_fee'.tr(),
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
                          'discount_code'.tr(),
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
                              'add_code'.tr(),
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
                          'total'.tr(),
                          style: GoogleFonts.inter(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        )),
                        Icon(MyFlutterApp.between_numbers2),
                        Text(
                          '2500',
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
                  onPressed: () {},
                  child: Text(
                    'confirm'.tr(),
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
}
