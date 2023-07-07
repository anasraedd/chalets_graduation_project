import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisterOrSignInScreen extends StatelessWidget {
  const RegisterOrSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: scaffoldBackGround,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 388.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/registerChalet.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(41.r),
                  bottomLeft: Radius.circular(41.r),
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.h),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                top: 100.h,
              ),
              child: Text(
                'txtEnjoyThe'.tr(),
                style: GoogleFonts.inter(
                  color: primaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                top: 17.h,
                right: 36.5.w,
                left: 36.5.w,
              ),
              child: Text(
                'txtExploreTheMost'.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF666666),
                  fontSize: 20.sp,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              height: 55.h,
              padding:
                  EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 5.59.w),
              margin: EdgeInsets.only(top: 38.h, right: 50.w, left: 50.w),
              decoration: BoxDecoration(
                color: const Color(0x99D9D9D9),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                    //spreadRadius: 3
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize:   Size(0, 44.h),
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () async {
                        // Navigator.push(context, )
                      },
                      child: Text(
                        'register'.tr(),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.59,
                  ),
                  Expanded(
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 44.h),
                      elevation: 0,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () async {
                        // Navigator.push(context, )
                      },
                      child: Text(
                        'signIn'.tr(),
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 102.w,
                ),
                Expanded(
                  child: ClipOval(
                    child: Divider(
                      color: const Color(0xFF017C9B),
                      thickness: 1.6.h,
                      height: 2,
                    ),
                  ),

                ),
                SizedBox(
                  width: 25.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Center(
                    child: Text(
                      'or'.tr(),
                      style: GoogleFonts.inter(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Expanded(
                  child: ClipOval(
                    child: Divider(
                      color: const Color(0xFF017C9B),
                      thickness: 1.6.h,
                      height: 2,
                    ),
                  ),

                ),
                SizedBox(
                  width: 102.w,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              //symmetric(vertical: 30, horizontal: 35),
              child: Text(
                'txtContinueAs'.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 20.sp, color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
