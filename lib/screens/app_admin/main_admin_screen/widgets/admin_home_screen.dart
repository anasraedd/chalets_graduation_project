import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/widgets/conorol_widget.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart' as lang;

class AdminHomeScreen extends StatefulWidget {

  late int id;


  AdminHomeScreen({required this.id});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<AdminChaletsGetxController>(()=>AdminChaletsGetxController());
    AdminChaletsGetxController.to.getchaletToManage(id: widget.id);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<AdminChaletsGetxController>(
            init: AdminChaletsGetxController(),
            builder: (AdminChaletsGetxController controller) {
              if (controller.loadedGetchaletToManage.isTrue) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 100.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.r)),
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/images/app_bar.svg'),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              lang.tr('home'),
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w),
                          clipBehavior: Clip.hardEdge,
                          height: 75.w,
                          width: 75.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(555555.r),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black, blurRadius: 2),
                              ]
                              // border: Border.all(width: 1),

                              // image: const DecorationImage(
                              //     fit: BoxFit.cover,
                              //
                              //     image: AssetImage('assets/images/anas.png')),

                              ),
                          child: CachedNetworkImage(
                            height: 75.w,
                            width: 75.w,
                            // height: 228.0,
                            imageUrl:
                                '${controller.chaletForManage.value.logo}',
                            // 'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2F934_image?alt=media&token=4ef1c0ef-10ba-4a6f-951f-c71a3a61c6ba',
                            //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                            fit: BoxFit.fill,

                            placeholder: (context, url) =>
                                SpinKitFadingCircle(
                              color: Colors.grey.shade500,
                              size: 50.0,
                            ),
                              errorWidget: (context, url, error) =>  ShimmerLoadingWidget(height: 75.w, width: 75.w, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),) ,//Center(child: Icon(Icons.account_circle, size: 75.w, color: primaryColor,))
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Welcome, ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${controller.chaletForManage.value.name}',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'We wish you happy times with us',
                              style: GoogleFonts.inter(
                                  fontSize: 12.5.sp, color: secondaryColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin:
                        EdgeInsets.only(right: 50.w, left: 50.w, top: 40),
                    child: ClipOval(
                      child: Divider(
                        color: const Color(0xFF017C9B),
                        thickness: 1.6.h,
                        height: 2,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 54.h,
                  ),

                  // Center(child: )

                  /*
          Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.w,),
            child: Row(
              children: [
                // ControlWidget(title: 'Information',),
                // SizedBox(width: 21.w,),

                ControlWidget(title: 'Pictures',),
                //  SizedBox(width: 21.w,),
                Expanded(child: Container()),

                ControlWidget(title: 'Prices',)
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.w,),
            child: Row(
              children: [
                ControlWidget(title: 'Facilities',),
                Expanded(child: Container()),
                //SizedBox(width: 21.w,),

                ControlWidget(title: 'Coupon',),

              ],
            ),
          ),
        ],
          ),
           */

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                        ),
                        child: Row(
                          children: [
                            ControlWidget(
                              title: 'Information',
                            ),
                            SizedBox(
                              width: 21.w,
                            ),

                            ControlWidget(
                              title: 'Pictures',
                              numberPage: 1,
                            ),
                            //  SizedBox(width: 21.w,),
                            Expanded(child: Container()),

                            ControlWidget(
                              title: 'Prices',
                              numberPage: 2,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),

                      // Center(child: )

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                        ),
                        child: Container(
                          width: double.infinity,
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            children: [
                              ControlWidget(
                                title: 'Facilities',
                                numberPage: 3,
                              ),
                              // Expanded(child: Container()),
                              SizedBox(
                                width: 21.w,
                              ),

                              ControlWidget(
                                title: 'Coupon',
                                numberPage: 4,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ]);
              }
            }));
  }
}
