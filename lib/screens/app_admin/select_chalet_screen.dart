import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/get/chat_getx_controller.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/main_admin_screen.dart';
import 'package:chalets/screens/app_admin/start_create_chalet_screen.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SelectChaletScreen extends StatefulWidget {
  SelectChaletScreen({Key? key}) : super(key: key);

  @override
  State<SelectChaletScreen> createState() => _SelectChaletScreenState();
}

class _SelectChaletScreenState extends State<SelectChaletScreen> {
  List<String> chaletForManage = ['ll', 'kk'];

  @override
  void initState() {
    // TODO: implement initState
    Get.put<AdminChaletsGetxController>(AdminChaletsGetxController());
    Get.put<ChatGetxController>(ChatGetxController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);
    return Scaffold(
      body: SafeArea(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   height: 32.h,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(55552.r)
            //   ),
            // ),
            //SizedBox(height: 3,),
            Container(
              clipBehavior: Clip.hardEdge,
              height: 100.h,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/app_bar.svg'),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Select to Manage',
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
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.w),
              child: Container(
                height: 75.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: primaryColor),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
                      child: Container(
                        // margin: EdgeInsetsDirectional.symmetric(
                        //     horizontal: 10.w),
                        clipBehavior: Clip.hardEdge,
                        height: 75.w,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                            height: 75.w,
                            width: 75.w,
                            // height: 228.0,
                            imageUrl: SharedPrefController()
                                    .getValueFor<String>(
                                        key: PrefKeys.accountPicture.name) ??
                                '',
                            //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
                            //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                            fit: BoxFit.fill,
                            placeholder: (context, url) => SpinKitFadingCircle(
                                  color: Colors.grey.shade500,
                                  size: 50.0,
                                ),
                            errorWidget: (context, url, error) => Center(
                                    child: Icon(
                                  Icons.account_circle,
                                  size: 75.w,
                                  color: primaryColor,
                                ))),
                      ),
                    ),
                    Text(
                      'Swipe to swich to the personal account',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'My Chalets',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: secondaryColor),
            ),
            SizedBox(
              height: 30.h,
            ),
            GetX<AdminChaletsGetxController>(
                init: AdminChaletsGetxController(),
                builder: (AdminChaletsGetxController controller) {
                  if (controller.loadedChaletsInfoIAdmin.isTrue) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,

                            // crossAxisSpacing: 5.w,

                            mainAxisSpacing: 20.w,

                            childAspectRatio: 0.5,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  index < 3
                                      ? ShimmerLoadingWidget(
                                          margin: EdgeInsetsDirectional.symmetric(
                                                  horizontal: 10.w),
                                          height: 85.w,
                                          width: 85.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,

                                              // borderRadius: BorderRadius.circular(555555.r),

                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 2),
                                              ]

                                              // border: Border.all(width: 1),

                                              // image: const DecorationImage(

                                              //     fit: BoxFit.cover,

                                              //

                                              //     image: AssetImage('assets/images/anas.png')),

                                              ),
                                        )
                                      : SizedBox(
                                          height: 75.w,
                                          width: 75.w,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() =>
                                                  StartCreateChaletScreen());
                                            },
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,

                                              radius: Radius.circular(55555.r),

                                              color: Colors.black,

                                              // strokeWidth: 1,

                                              child: Center(
                                                child: Container(
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .symmetric(
                                                                horizontal:
                                                                    10.w),
                                                    clipBehavior: Clip.hardEdge,
                                                    height: 75.w,
                                                    width: 75.w,
                                                    decoration: BoxDecoration(
                                                      // borderRadius: BorderRadius.circular(555555.r),

                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 35,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  index < 3
                                      ? Center(child: ShimmerLoadingWidget(height: 20.h, width: 60.w, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),))
                                      :
                                  Padding(
                                    padding:  EdgeInsets.only(top: 10.h),
                                    child: Text(
                                            'Add Chalet',
                                            style: GoogleFonts.inter(
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.center,

                                          ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            // crossAxisSpacing: 5.w,
                            mainAxisSpacing: 20.w,

                            childAspectRatio: 0.5,
                          ),
                          itemCount: controller.chaletsInfoIAdmin.length + 1,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  index < controller.chaletsInfoIAdmin.length
                                      ? GestureDetector(
                                          onTap: () {
                                            int id = controller.chaletsInfoIAdmin.value[index].id;
                                            ChatGetxController.to.typeAccount.value = AccountType.Admin.name;
                                            // controller.getchaletToManage(
                                            //     id: controller.chaletsInfoIAdmin
                                            //         .value[index].id);
                                            // controller.logoChalet.value =
                                            //     controller.chaletsInfoIAdmin
                                            //         .value[index].logo;

                                            // controller.nameChalet.value =
                                            //     controller.chaletsInfoIAdmin
                                            //         .value[index].name;
                                            Get.off(MainAdminScreen(id: id));
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsetsDirectional.symmetric(
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
                                                      color: Colors.black,
                                                      blurRadius: 2),
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
                                              imageUrl: controller
                                                  .chaletsInfoIAdmin
                                                  .value[index]
                                                  .logo,
                                              //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2F934_image?alt=media&token=4ef1c0ef-10ba-4a6f-951f-c71a3a61c6ba',
                                              //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                                              fit: BoxFit.fill,

                                              placeholder: (context, url) =>
                                                  SpinKitFadingCircle(
                                                color: Colors.grey.shade500,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 75.w,
                                          width: 75.w,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() =>
                                                  StartCreateChaletScreen());
                                            },
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,

                                              radius: Radius.circular(55555.r),
                                              color: Colors.black,
                                              // strokeWidth: 1,
                                              child: Center(
                                                child: Container(
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .symmetric(
                                                                horizontal:
                                                                    10.w),
                                                    clipBehavior: Clip.hardEdge,
                                                    height: 75.w,
                                                    width: 75.w,
                                                    decoration: BoxDecoration(
                                                      // borderRadius: BorderRadius.circular(555555.r),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 35,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 11.h,
                                  ),
                                  index < controller.chaletsInfoIAdmin.length
                                      ? Center(
                                          child: Text(
                                          controller
                                              .chaletsInfoIAdmin[index].name,
                                          style: GoogleFonts.inter(
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ))
                                      : Text(
                                          'Add Chalet',
                                          style: GoogleFonts.inter(
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
