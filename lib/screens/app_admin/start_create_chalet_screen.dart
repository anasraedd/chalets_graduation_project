import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/screens/app_admin/chalet_information_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class StartCreateChaletScreen extends StatelessWidget {
   StartCreateChaletScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 361.h, start: 10.w, end: 10.w),
              child: SvgPicture.asset(
                  'assets/images/back_for_start_create_chalet.svg'),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(
                  start: 33.5.w,
                  end: 33.5.w,
                  top: 146.h,
                ),
                child: Image.asset(
                  'assets/images/img_start_create_chalet.png',
                  height: 343.h,
                )),
            Padding(
              padding:  EdgeInsets.only(top: 300.h),
              child: Center(
                child: Text(
                  'add_your_chalet_in'.tr(),
                  style: GoogleFonts.inter(fontSize: 24.sp, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 390.h),
              child: Center(
                child: Text(
                  'only_4_steps'.tr(),
                  style: GoogleFonts.inter(fontSize: 42.sp, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: 480.h, start: 51.5.w, end: 51.5.w),
              height: 9.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(20.r)),
            ),

            GestureDetector(
              onTap: (){
               Get.to(()=>ChaletInformationScreen());

              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 600.h),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    border: Border.all(width: 12, color: color1)
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white, weight: 5, size: 35,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getTokin() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    print('tokin is ${fcmToken}');
  }
}
