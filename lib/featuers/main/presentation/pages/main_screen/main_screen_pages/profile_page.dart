import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/theme/app_theme.dart';


class ProfilePage extends StatelessWidget with Helpers{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var lang = AppLocalizations.of(context)!;
    return ScrollConfiguration(
        behavior: MyBehavior(),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(15.w),
                child: Container(
                    height: 87.w,
                    width: 87.w,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(555555.r),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/anas.png' ),
                        ))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user name
                    Text(
                      "Anas Raed",
                      style:
                          GoogleFonts.inter(fontSize: 20.sp, color: primaryColor),
                    ),
                    //email
                    Text(
                      "AbodK08@gmail.com",
                      style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFABABAB)),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  showBlurredDialog(context);
                },
                child: Image(
                  image: AssetImage("assets/images/profileExitICon.png"),
                  height: 27.5.w,
                  width: 27.5.w,
                ),
              ),
              SizedBox(
                width: 38.w,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'resevations'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      "23",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  children: [
                    Text(
                      'walletBalance'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      "23 ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'coins'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  children: [
                    Text(
                      'ratingFromChalets'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      "9/10",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  children: [
                    Text(
                    'chaletsWhoBannedYou'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      "10",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Container(
                  height: 2.h,
                  margin: EdgeInsets.symmetric(vertical: 19.h),
                  decoration: BoxDecoration(
                      color: const Color(0x6EABABAB),
                      borderRadius: BorderRadius.circular(1)),
                ),
                Text(
                  'yourAccount'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/icons/profileUnActive.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
          'chaletsWhoBannedYou'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/accountBlance.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'accountBalance'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  'preferences'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/langIcon.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'language'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    //lang value
                    Text(
                      "English",
                      style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/themeIcon.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'theme'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    //lang value
                    Text(
                      "Light",
                      style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  'support'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/rateUsIcon.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'rateUs'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),   SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/rewordIcon.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'inviteFriend'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ), SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/termsOfUseAndPolicy.png",
                      ),
                      color: Colors.black,
                      height: 27.5.h,
                      width: 27.5.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'termsPolicy'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),

                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.w,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
