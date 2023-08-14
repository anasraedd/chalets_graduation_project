import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/main.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/personal_information_screen.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/theme/app_theme.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut <UserGetxController>(() =>UserGetxController());
    if(!UserGetxController.to.isGetInfoProfile.value){
      UserGetxController.to.getInfoProfile();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   // var lang = AppLocalizations.of(context)!;
    return GetX<UserGetxController>(
        init: UserGetxController(),
    builder: (UserGetxController controller) {
    // if() {
    //   return
    // }else{
      return  ScrollConfiguration(
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
                          imageUrl:  controller.accountPicture.value ?? '' ,//'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
                          //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                          fit: BoxFit.fill,

                          placeholder: (context, url) =>
                              SpinKitFadingCircle(
                                color: Colors.grey.shade500,
                                size: 50.0,
                              ),
                          errorWidget: (context, url, error) =>  Center(child: Icon(Icons.account_circle, size: 75.w, color: primaryColor,))
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:  EdgeInsets.all(15.w),
                  //   child: Container(
                  //       height: 87.w,
                  //       width: 87.w,
                  //       decoration: BoxDecoration(
                  //           color: primaryColor,
                  //           borderRadius: BorderRadius.circular(555555.r),
                  //           image: const DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: AssetImage('assets/images/anas.png' ),
                  //           ))),
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //user name
                        Text(
                          '${controller.firstName.value} ${controller.lastName.value}',
                          style:
                          GoogleFonts.inter(fontSize: 20.sp, color: primaryColor),
                        ),
                        //email
                        Text(
                          '${controller.email}',
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
                        controller.loadingMyInfoProfile.isTrue ?  ShimmerLoadingWidget(height: 15.h, width: 80.w):Text(
                          lang.tr('resevations'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        controller.loadingMyInfoProfile.isTrue ?  ShimmerLoadingWidget(height: 15.h, width: 30.w) : Text(
                          '${controller.reservationsCount.value}',
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
                        controller.loadingMyInfoProfile.isTrue ?  ShimmerLoadingWidget(height: 15.h, width: 100.w) :Text(
                          lang.tr('walletBalance'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        controller.loadingMyInfoProfile.isTrue ?  ShimmerLoadingWidget(height: 15.h, width: 30.w):
                        Text(
                          ' ${controller.balance.value}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          lang.tr('coins'),
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
                          lang.tr('ratingFromChalets'),
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
                          lang.tr('chaletsWhoBannedYou'),
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
                      lang.tr('yourAccount'),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(PersonalInformationScreen());
                      },
                      child: Container(

                        child: Row(
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
                              lang.tr('personalInformationScreen'),
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
                      ),
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
                          lang.tr('accountBalance'),
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
                          onTap: (){

                          },
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
                    Container(

                      child: Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          Icon(Icons.block,
                            color: Colors.black,
                            size: 27.5.h,

                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            lang.tr('chalet_blocked'),
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
                            onTap: (){
                              Get.toNamed('blocked_chalets_screen');
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20.w,

                                color: const Color(0xFFABABAB),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      lang.tr('preferences'),
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
                          lang.tr('language'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        //lang value
                        InkWell(
                          onTap: (){
                            setState(() {
                              // EasyLocalization.of(context)!.setLocale(const Locale('ar', 'AR'));

                            });
                          },
                          child: Text(
                            "English",
                            style: GoogleFonts.inter(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: (){

                            setState(() {
                             if(Get.locale == Locale('ar', '')){

                               // EasyLocalization.of(context)!.setLocale(Locale('en', ''));
                               MyApp.changeLanguage(context: context, locale: Locale('en', ''));

                             //  Get.updateLocale(Locale('en', 'US'));
                              }else{
                               MyApp.changeLanguage(context: context, locale: Locale('ar', ''));
                            //   EasyLocalization.of(context)!.setLocale(Locale('ar', ''));

                               // Get.updateLocale(Locale('ar', ''));

                              }


                            });
                          },

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
                          lang.tr('theme'),
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
                      lang.tr('support'),
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
                          lang.tr('rateUs'),
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
                          lang.tr('inviteFriend'),
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
                          lang.tr('termsPolicy'),
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
    //}
    });
  }
}
