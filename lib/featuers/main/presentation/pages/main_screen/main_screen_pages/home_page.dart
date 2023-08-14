import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/get/home_getx_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet/chalet_have_descount.dart';
import 'package:chalets/models/chalet/chalet_home.dart';
import 'package:chalets/models/chalet/chalet_images.dart';
import 'package:chalets/models/chalet/random_chalet.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/details_screen.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sign = 0;
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2011%20(2).jpg?alt=media&token=cd5040d1-308d-4d18-8b04-61b31513a4c0",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%208.png?alt=media&token=e3a66627-7799-4ff4-83a5-d0e832ff8852",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2014.jpg?alt=media&token=69bd8a31-2d48-45d6-b621-3b38c697fd38",
  ];
  List<String> images2 = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2012.jpg?alt=media&token=7e8d3eb6-e82b-4772-a2e8-c1478451d2c9",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2010%20(2).jpg?alt=media&token=5aef1959-5cbd-4f3b-b6ff-68d34a932e8b",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2013%20(4).jpg?alt=media&token=0fd2894e-b151-47bd-82a6-92a701e82a85",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%2013%20(3).jpg?alt=media&token=c199bddc-557f-4cb1-9e8d-8ba8330218b8"
  ];

  @override
  void initState() {
    Get.lazyPut<ChaletsHomeGetxController>(() => ChaletsHomeGetxController());
    ChaletsHomeGetxController.to.read();
    // TODO: implement initState
    super.initState();
  }

  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //  var lang = AppLocalizations.of(context)!;
    return GetX<ChaletsHomeGetxController>(
        init: ChaletsHomeGetxController(),
        builder: (ChaletsHomeGetxController controller) {
          // if( controller.loading.value) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }else {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30.w),
                child: Row(
                  children: [
                    controller.loading.value
                        ? ShimmerLoadingWidget(
                      height: 60, width: 60, decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      color: Colors.white,
                    ),):
                    // Container(
                    //   height: 60.w,
                    //   width: 60.w,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(555555.r),
                    //       image: const DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: SharedPrefController().getValueFor<String>(key: PrefKeys.accountPicture.name) != null ? AssetImage(): AssetImage())),//AssetImage('assets/images/anas.png'))),
                    // ),
                    // SizedBox(
                    //   height: 75.w,
                    //   width: 75.w,
                    //   child: CircleAvatar(
                    //     backgroundColor: secondaryColor,
                    //     child: CachedNetworkImage(
                    //       // height: 228.0,
                    //       imageUrl: 'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
                    //       fit: BoxFit.cover,
                    //
                    //       placeholder: (context, url) => SpinKitFadingCircle(
                    //         color: Colors.grey.shade500,
                    //         size: 50.0,
                    //       ),
                    //         errorWidget: (context, url, error) =>  Icon(Icons.account_circle, size: 75.w, color: Colors.white70,)//Image.asset('assets/images/')
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                        imageUrl:  SharedPrefController().getValueFor<String>(key: PrefKeys.accountPicture.name) ?? '' ,//'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
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
                    SizedBox(
                      width: 14.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.loading.value ? ShimmerLoadingWidget(height: 20.h, width: MediaQuery.of(context).size.width /2.w, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r))) :
                        RichText(
                            text: TextSpan(
                                text: lang.tr('txtWelcomeHome'),
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                text: "${SharedPrefController().getValueFor<String>(key: PrefKeys.firstName.name)} ${SharedPrefController().getValueFor<String>(key: PrefKeys.lastName.name)}",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              )
                            ])),
                        SizedBox(
                          height: 4.h,
                        ),
                        controller.loading.value ? ShimmerLoadingWidget(height: 20.h, width: MediaQuery.of(context).size.width /1.7.w, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r))) :

                        Text(
                         lang.tr('weWishYouHappyTimesWithUs'),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFFABABAB),
                                  ),
                        )
                      ],
                    )
                  ],
                ),
              ),


              CarouselSlider(
                options: CarouselOptions(
                  height: 260,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.85,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: controller.loading.value ? images2.map((e) {
                  return Stack(
                    alignment: Alignment.centerRight,

                    children: [
                      ShimmerLoadingWidget(height: 228, width: double.infinity,  decoration: BoxDecoration(
                        color: const Color(0x99017C9B),
                        borderRadius:
                        BorderRadius.circular(30.r),
                      ),),
                      ShimmerLoadingWidget(
                        height: 140.h,
                        width: 115.w,
                        baseColor: Color(0x99017C9B),
                        margin: EdgeInsetsDirectional.all(25.w),
                        decoration: BoxDecoration(
                          color: const Color(0x99017C9B),
                          borderRadius:
                          BorderRadius.circular(16.r),
                        ),

                      ),
                    ],
                  );
          }

                ).toList() : controller.randomChaletsHaveDiscount.map(
                  (item) {

                    return GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                           Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          // fromLTRB
                                          Colors.transparent,
                                          Colors.black,
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0, 0, 1, 1],
                                      ).createShader(
                                        Rect.fromLTRB(
                                            0, 0, rect.width, rect.height),
                                      );
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        CachedNetworkImage(
                                          height: 228.0,
                                          imageUrl: item.chaletImages.isNotEmpty
                                              ? item.chaletImages[0].image
                                              : images[0],
                                          placeholder: (context, url) =>
                                              ShimmerLoadingWidget(
                                                  height: 228,
                                                  width: double.infinity),
                                          errorWidget: (context, url, error) =>
                                              ShimmerLoadingWidget(
                                                  height: 228,
                                                  width: double.infinity),
                                          fit: BoxFit.cover,
                                        ),

                                        Container(
                                          height: 140.h,
                                          width: 115.w,
                                          margin: EdgeInsets.all(25.w),
                                          decoration: BoxDecoration(
                                            color: const Color(0x99017C9B),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    top: 8,
                                                    right: 3),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      item
                                                          .chaletPrices[0]
                                                          .chaletPriceDiscountCodes[
                                                              0]
                                                          .percent,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 40.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 4.w,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          lang.tr('discount'),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .copyWith(
                                                                  fontSize:
                                                                      8.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        Text(
                                                          "%",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .copyWith(
                                                                  fontSize:
                                                                      25.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                  "On the Most Beautiful Chalets in Gaza",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Container(
                                                height: 22.h,
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    color: Colors.white),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          item.chaletPrices[0].chaletPriceDiscountCodes[0].code,
                                                          style: GoogleFonts.inter(
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      width: 2.w,
                                                      color: primaryColor,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Code",
                                                          style: GoogleFonts.inter(
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),

              // controller.loading.value
              //     ? shimmerLoadingWidget(
              //         height: 125.h,
              //         baseColor: primaryColor,
              //         width: double.infinity,
              //         margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 15.h),
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(20.r)))
              //     :
              Container(
                      height: 125.h,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/unknownSape.png",))),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 13.h,
                            ),
                            Text(
                              lang.tr('detailedSearch'),
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 13.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed('/detailed_search_screen');
                              },
                              child: Container(
                                height: 55.h,
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/serchTFF.png"))),
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(),
                                    Text(
                                      lang.tr('txtSearch'),
                                      style: GoogleFonts.inter(
                                          color: primaryColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.search_rounded,
                                      color: primaryColor,
                                      size: 27.r,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              controller.loading.value ? ShimmerLoadingWidget(height: 1.6, width: double.infinity, margin: EdgeInsetsDirectional.only(
                  start: 40.w, end: 40.w, top: 22.h, bottom: 10.h),):
              Container(
                margin: EdgeInsets.only(
                    left: 40.w, right: 40.w, top: 22.h, bottom: 10.h),
                child: ClipOval(
                  child: Divider(
                    color: const Color(0xFF017C9B),
                    thickness: 1.6.h,
                    height: 2,
                  ),
                ),
              ),
              Expanded(
                child:
                CarouselSlider(
                  options: CarouselOptions(
                      height: 240,
                      aspectRatio: 16 / 16,
                      viewportFraction: 0.58,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, s) {
                        controller.indexRandomChalets.value = index;
                        // setState(() {
                        //   currentIndex = index;
                        //   print("object ${currentIndex}");
                        // });
                      }),
                  items:
                  controller.loading.value ? images2.map(
                    (item) {
                    return  SizedBox(
                      height: 230.h,
                      child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // controller.randomChalets
                            //     .value ==
                            //     images.indexOf(item)
                            //     ?
                            Align(
                              alignment: Alignment.topCenter,
                              child:
                              ShimmerLoadingWidget(
                                height: 20.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                    color:
                                    const Color(0xFFD9D3CD),
                                    borderRadius:
                                    BorderRadius.only(
                                      topRight:
                                      Radius.circular(8.r),
                                      topLeft:
                                      Radius.circular(8.r),
                                    )),
                              ),
                            ),
                            //  : Container(),
                            ShimmerLoadingWidget(
                              // margin: const EdgeInsets.only(top: 12),

                            height: double.infinity, width: double.infinity, margin: EdgeInsetsDirectional.only( bottom: 25.h, top: 12), decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(30.r)),),
                            // controller.indexRandomChalets.value ==
                            //     images.indexOf(item)
                            //     ?
                            Align(
                              alignment: Alignment.topCenter,
                              child: ShimmerLoadingWidget(
                                height: 40.h,
                                width: 140.w,
                               baseColor: primaryColor,
                               // alignment: Alignment.center,

                                margin:
                                EdgeInsetsDirectional.only(top: 4.h),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight:  Radius.circular(5), bottomLeft:  Radius.circular(15), bottomRight:  Radius.circular(15))
                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         "assets/images/newChaletPK.png"),
                                  //     fit: BoxFit.fill),
                                ),
                                // padding: EdgeInsets.only(
                                //     bottom: 4.h, left: 10.w, right: 10.w),
                              //  child: shimmerLoadingWidget(height: 40.h, width: 140.w)
                              ),
                            ),
                            // : Container(),
                            // controller.indexRandomChalets.value ==
                            //     images.indexOf(item)
                            //     ?
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ShimmerLoadingWidget(
                                width: 200.w,
                                height: 25.h,
                              baseColor:  Color(0xFFC9DCE1),
                              //  alignment: Alignment.center,
                                margin: EdgeInsetsDirectional.only(bottom: 35.h),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.only(
                                      bottomLeft: Radius
                                          .circular(10.r),
                                      bottomRight:
                                      Radius.circular(
                                          10.r),
                                      topRight:
                                      Radius.circular(
                                          2.r),
                                      topLeft:
                                      Radius.circular(
                                          2.r)),
                                  color: Color(0xFFC9DCE1),
                                ),
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 12.w),
                               // child: shimmerLoadingWidget(height: 25.h, width: 200.w)
                              ),
                            )
                            //  : Container(),
                          ],
                        ),
                    );
                      // return shimmerLoadingWidget(
                      //   height: 200, width: double.infinity, margin: EdgeInsets.symmetric( vertical: 25.h), decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius:
                      //     BorderRadius.circular(30.r)),);
                    },
                  ).toList():
                  controller.randomChalets.map(
                        (item) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsScreen(id: item.chaletsId,));//item.chaletsId
                        },
                        child: Stack(
                          children: [
                            Container(
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // f r o m L T R B
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0, 1, 1],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: SizedBox(
                                  height: 230.h,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      // controller.randomChalets
                                      //     .value ==
                                      //     images.indexOf(item)
                                      //     ?
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 20.h,
                                          width: 160.w,
                                          decoration: BoxDecoration(
                                              color:
                                              const Color(0xFFD9D3CD),
                                              borderRadius:
                                              BorderRadius.only(
                                                topRight:
                                                Radius.circular(8.r),
                                                topLeft:
                                                Radius.circular(8.r),
                                              )),
                                        ),
                                      ),
                                        //  : Container(),
                                      Container(
                                        margin: const EdgeInsets.only(top: 12),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30.r)),
                                        child: Container(
                                          height: double.infinity,
                                          child: CachedNetworkImage(
                                            imageUrl: item.chaletImages.isNotEmpty
                                                ? item.chaletImages[0].image
                                                : images2[1],
                                            placeholder: (context, url) =>
                                                ShimmerLoadingWidget(
                                                    height: 228,
                                                    width: double.infinity),
                                            errorWidget: (context, url, error) =>
                                                ShimmerLoadingWidget(
                                                    height: 228,
                                                    width: double.infinity),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // controller.indexRandomChalets.value ==
                                      //     images.indexOf(item)
                                      //     ?
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 40.h,
                                          width: 140.w,
                                          alignment: Alignment.center,

                                          margin:
                                          EdgeInsets.only(top: 4.h),
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/newChaletPK.png"),
                                                fit: BoxFit.fill),
                                          ),
                                          padding: EdgeInsets.only(
                                              bottom: 4.h, left: 10.w, right: 10.w),
                                          child: Text(
                                            item.name,
                                            style: GoogleFonts.inter(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                         // : Container(),
                                      // controller.indexRandomChalets.value ==
                                      //     images.indexOf(item)
                                      //     ?
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: 200.w,
                                          height: 25.h,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 18.w,
                                              vertical: 12.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomLeft: Radius
                                                    .circular(10.r),
                                                bottomRight:
                                                Radius.circular(
                                                    10.r),
                                                topRight:
                                                Radius.circular(
                                                    2.r),
                                                topLeft:
                                                Radius.circular(
                                                    2.r)),
                                            color: Color(0xFFC9DCE1),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          child: Text(
                                            item.name,
                                            style: GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                fontWeight:
                                                FontWeight.w600,
                                                color: primaryColor),
                                          ),
                                        ),
                                      )
                                        //  : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          );
          //  }
          // if (snapShot.connectionState == ConnectionState.waiting) {
          //   controller.loading.value = true;
          //   sign++;
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (snapShot.hasData && snapShot.data!.object != null) {
          //   ChaletHome chaletHome = snapShot.data!.object;
          //   // List<RandomChaletsHaveDiscount> randomChaletsHaveDiscount = chaletHome.randomChaletsHaveDiscount;
          //   // List<RandomChalets> randomChalets = chaletHome.randomChalets;
          //
          //   return Column(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(30.w),
          //         child: Row(
          //           children: [
          //             Container(
          //               height: 60.w,
          //               width: 60.w,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(555555.r),
          //                   image: const DecorationImage(
          //                       fit: BoxFit.cover,
          //                       image: AssetImage(
          //                           'assets/images/anas.png'))),
          //             ),
          //             SizedBox(
          //               width: 14.w,
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 RichText(
          //                     text: TextSpan(
          //                         text: 'txtWelcomeHome'.tr(),
          //                         style: GoogleFonts.inter(
          //                           fontSize: 14.sp,
          //                           color: Colors.black,
          //                         ),
          //                         children: [
          //                       TextSpan(
          //                         text: "Anas Raed",
          //                         style: GoogleFonts.inter(
          //                           fontSize: 14.sp,
          //                           fontWeight: FontWeight.bold,
          //                           color: primaryColor,
          //                         ),
          //                       )
          //                     ])),
          //                 SizedBox(
          //                   height: 4.h,
          //                 ),
          //                 Text(
          //                   'weWishYouHappyTimesWithUs'.tr(),
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .bodySmall!
          //                       .copyWith(
          //                         color: const Color(0xFFABABAB),
          //                       ),
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //       CarouselSlider(
          //         options: CarouselOptions(
          //           height: 260,
          //           aspectRatio: 16 / 9,
          //           viewportFraction: 0.85,
          //           initialPage: 0,
          //           enableInfiniteScroll: true,
          //           reverse: false,
          //           // autoPlay: true,
          //           autoPlayInterval: const Duration(seconds: 3),
          //           autoPlayAnimationDuration:
          //               const Duration(milliseconds: 800),
          //           autoPlayCurve: Curves.fastOutSlowIn,
          //           enlargeCenterPage: true,
          //           enlargeFactor: 0.3,
          //           scrollDirection: Axis.horizontal,
          //         ),
          //         items: chaletHome.randomChaletsHaveDiscount.map(
          //           (item) {
          //             return GestureDetector(
          //               onTap: () {},
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     clipBehavior: Clip.hardEdge,
          //                     decoration: BoxDecoration(
          //                         borderRadius:
          //                             BorderRadius.circular(30.r)),
          //                     child: ShaderMask(
          //                       shaderCallback: (rect) {
          //                         return const LinearGradient(
          //                           begin: Alignment.topCenter,
          //                           end: Alignment.bottomCenter,
          //                           colors: [
          //                             // fromLTRB
          //                             Colors.transparent,
          //                             Colors.black,
          //                             Colors.black,
          //                             Colors.transparent,
          //                           ],
          //                           stops: [0, 0, 1, 1],
          //                         ).createShader(
          //                           Rect.fromLTRB(
          //                               0, 0, rect.width, rect.height),
          //                         );
          //                       },
          //                       blendMode: BlendMode.dstIn,
          //                       child: Stack(
          //                         alignment: Alignment.centerRight,
          //                         children: [
          //                           CachedNetworkImage(
          //                             height: 228.0,
          //                             imageUrl:
          //                                 item.chaletImages.isNotEmpty
          //                                     ? item.chaletImages[0].image
          //                                     : images[0],
          //                             placeholder: (context, url) => Center(
          //                                 child:
          //                                     CircularProgressIndicator()),
          //                             errorWidget:
          //                                 (context, url, error) =>
          //                                     Container(),
          //                             fit: BoxFit.cover,
          //                           ),
          //                           Container(
          //                             height: 140.h,
          //                             width: 115.w,
          //                             margin: EdgeInsets.all(25.w),
          //                             decoration: BoxDecoration(
          //                               color: const Color(0x99017C9B),
          //                               borderRadius:
          //                                   BorderRadius.circular(16.r),
          //                             ),
          //                             child: Column(
          //                               children: [
          //                                 Padding(
          //                                   padding:
          //                                       const EdgeInsets.only(
          //                                           left: 8.0,
          //                                           top: 8,
          //                                           right: 3),
          //                                   child: Row(
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment
          //                                             .center,
          //                                     children: [
          //                                       Text(
          //                                         item
          //                                             .chaletPrices[0]
          //                                             .chaletPriceDiscountCodes[
          //                                                 0]
          //                                             .percent,
          //                                         style: Theme.of(context)
          //                                             .textTheme
          //                                             .headlineLarge!
          //                                             .copyWith(
          //                                                 fontSize: 40.sp,
          //                                                 fontWeight:
          //                                                     FontWeight
          //                                                         .w700,
          //                                                 color: Colors
          //                                                     .white),
          //                                       ),
          //                                       SizedBox(
          //                                         width: 4.w,
          //                                       ),
          //                                       Column(
          //                                         children: [
          //                                           Text(
          //                                             'discount'.tr(),
          //                                             style: Theme.of(
          //                                                     context)
          //                                                 .textTheme
          //                                                 .headlineLarge!
          //                                                 .copyWith(
          //                                                     fontSize:
          //                                                         8.sp,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .w400,
          //                                                     color: Colors
          //                                                         .white),
          //                                           ),
          //                                           Text(
          //                                             "%",
          //                                             style: Theme.of(
          //                                                     context)
          //                                                 .textTheme
          //                                                 .headlineLarge!
          //                                                 .copyWith(
          //                                                     fontSize:
          //                                                         25.sp,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .w400,
          //                                                     color: Colors
          //                                                         .white),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Padding(
          //                                   padding:
          //                                       const EdgeInsets.only(
          //                                           left: 8.0,
          //                                           right: 8.0),
          //                                   child: Text(
          //                                     "On the Most Beautiful Chalets in Gaza",
          //                                     textAlign: TextAlign.center,
          //                                     style: GoogleFonts.inter(
          //                                         fontSize: 8.sp,
          //                                         fontWeight:
          //                                             FontWeight.w400,
          //                                         color: Colors.white),
          //                                   ),
          //                                 ),
          //                                 SizedBox(
          //                                   height: 2.h,
          //                                 ),
          //                                 Container(
          //                                   height: 22.h,
          //                                   width: 70.w,
          //                                   decoration: BoxDecoration(
          //                                       borderRadius:
          //                                           BorderRadius.circular(
          //                                               5.r),
          //                                       color: Colors.white),
          //                                   child: Row(
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment
          //                                             .center,
          //                                     children: [
          //                                       Expanded(
          //                                         flex: 2,
          //                                         child: Container(
          //                                           alignment:
          //                                               Alignment.center,
          //                                           child: Text(
          //                                             "2689",
          //                                             style: GoogleFonts.inter(
          //                                                 color:
          //                                                     primaryColor,
          //                                                 fontSize: 12.sp,
          //                                                 fontWeight:
          //                                                     FontWeight
          //                                                         .w700),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                       Container(
          //                                         height: double.infinity,
          //                                         width: 2.w,
          //                                         color: primaryColor,
          //                                       ),
          //                                       Expanded(
          //                                         flex: 1,
          //                                         child: Container(
          //                                           alignment:
          //                                               Alignment.center,
          //                                           child: Text(
          //                                             "Code",
          //                                             style: GoogleFonts.inter(
          //                                                 color:
          //                                                     primaryColor,
          //                                                 fontSize: 8.sp,
          //                                                 fontWeight:
          //                                                     FontWeight
          //                                                         .w400),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         ).toList(),
          //       ),
          //       Container(
          //         height: 125.h,
          //         margin: EdgeInsets.symmetric(horizontal: 16.w),
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 fit: BoxFit.fill,
          //                 image: AssetImage(
          //                     "assets/images/unknownSape.png"))),
          //         child: Container(
          //           height: double.infinity,
          //           width: double.infinity,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               SizedBox(
          //                 height: 13.h,
          //               ),
          //               Text(
          //                 'detailedSearch'.tr(),
          //                 style: GoogleFonts.inter(
          //                   fontSize: 20.sp,
          //                   fontWeight: FontWeight.w700,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 13.h,
          //               ),
          //               Container(
          //                 height: 55.h,
          //                 margin: EdgeInsets.symmetric(horizontal: 12.w),
          //                 decoration: const BoxDecoration(
          //                     image: DecorationImage(
          //                         fit: BoxFit.cover,
          //                         image: AssetImage(
          //                             "assets/images/serchTFF.png"))),
          //                 padding: EdgeInsets.symmetric(horizontal: 40.w),
          //                 child: Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceAround,
          //                   children: [
          //                     Container(),
          //                     Text(
          //                       'txtSearch'.tr(),
          //                       style: GoogleFonts.inter(
          //                           color: primaryColor,
          //                           fontSize: 15.sp,
          //                           fontWeight: FontWeight.w500),
          //                     ),
          //                     Icon(
          //                       Icons.search_rounded,
          //                       color: primaryColor,
          //                       size: 27.r,
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(
          //             left: 40.w, right: 40.w, top: 22.h, bottom: 10.h),
          //         child: ClipOval(
          //           child: Divider(
          //             color: const Color(0xFF017C9B),
          //             thickness: 1.6.h,
          //             height: 2,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: CarouselSlider(
          //           options: CarouselOptions(
          //               height: 240,
          //               aspectRatio: 16 / 16,
          //               viewportFraction: 0.58,
          //               initialPage: 0,
          //               enableInfiniteScroll: true,
          //               reverse: false,
          //               autoPlay: true,
          //               autoPlayInterval: Duration(seconds: 3),
          //               autoPlayAnimationDuration:
          //                   Duration(milliseconds: 800),
          //               autoPlayCurve: Curves.fastOutSlowIn,
          //               enlargeCenterPage: true,
          //               enlargeFactor: 0.4,
          //               scrollDirection: Axis.horizontal,
          //               onPageChanged: (index, s) {
          //                 controller.indexRandomChalets.value = index;
          //                 // setState(() {
          //                 //   currentIndex = index;
          //                 //   print("object ${currentIndex}");
          //                 // });
          //               }),
          //           items: images2.map(
          //             (item) {
          //               return GestureDetector(
          //                 onTap: () {
          //                   Get.to(() => DetailsScreen());
          //                 },
          //                 child: Stack(
          //                   children: [
          //                     Container(
          //                       child: ShaderMask(
          //                         shaderCallback: (rect) {
          //                           return const LinearGradient(
          //                             begin: Alignment.topCenter,
          //                             end: Alignment.bottomCenter,
          //                             colors: [
          //                               // f r o m L T R B
          //                               Colors.transparent,
          //                               Colors.black,
          //                               Colors.black,
          //                               Colors.transparent,
          //                             ],
          //                             stops: [0, 0, 1, 1],
          //                           ).createShader(
          //                             Rect.fromLTRB(
          //                                 0, 0, rect.width, rect.height),
          //                           );
          //                         },
          //                         blendMode: BlendMode.dstIn,
          //                         child: SizedBox(
          //                           height: 230.h,
          //                           child: Stack(
          //                             alignment: Alignment.bottomCenter,
          //                             children: [
          //                               controller.indexChaletsHaveDiscount
          //                                           .value ==
          //                                       images.indexOf(item)
          //                                   ? Align(
          //                                       alignment:
          //                                           Alignment.topCenter,
          //                                       child: Container(
          //                                         height: 20.h,
          //                                         width: 120.w,
          //                                         decoration:
          //                                             BoxDecoration(
          //                                                 color: const Color(
          //                                                     0xFFD9D3CD),
          //                                                 borderRadius:
          //                                                     BorderRadius
          //                                                         .only(
          //                                                   topRight: Radius
          //                                                       .circular(
          //                                                           8.r),
          //                                                   topLeft: Radius
          //                                                       .circular(
          //                                                           8.r),
          //                                                 )),
          //                                       ),
          //                                     )
          //                                   : Container(),
          //                               Container(
          //                                 margin: const EdgeInsets.only(
          //                                     top: 12),
          //                                 clipBehavior: Clip.hardEdge,
          //                                 decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(
          //                                             30.r)),
          //                                 child: Container(
          //                                   height: double.infinity,
          //                                   child: CachedNetworkImage(
          //                                     imageUrl: item,
          //                                     fit: BoxFit.cover,
          //                                   ),
          //                                 ),
          //                               ),
          //                               controller.indexRandomChalets
          //                                           .value ==
          //                                       images.indexOf(item)
          //                                   ? Align(
          //                                       alignment:
          //                                           Alignment.topCenter,
          //                                       child: Container(
          //                                         height: 25.h,
          //                                         width: 100.w,
          //                                         alignment:
          //                                             Alignment.center,
          //                                         margin: EdgeInsets.only(
          //                                             top: 4.h),
          //                                         decoration:
          //                                             const BoxDecoration(
          //                                           image: DecorationImage(
          //                                               image: AssetImage(
          //                                                   "assets/images/newChaletPK.png"),
          //                                               fit: BoxFit.fill),
          //                                         ),
          //                                         padding:
          //                                             EdgeInsets.only(
          //                                                 bottom: 3.h),
          //                                         child: Text(
          //                                           'newChalet'.tr(),
          //                                           style:
          //                                               GoogleFonts.inter(
          //                                             fontSize: 10.sp,
          //                                             fontWeight:
          //                                                 FontWeight.w500,
          //                                             color: Colors.white,
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     )
          //                                   : Container(),
          //                               controller.indexRandomChalets
          //                                           .value ==
          //                                       images.indexOf(item)
          //                                   ? Align(
          //                                       alignment: Alignment
          //                                           .bottomCenter,
          //                                       child: Container(
          //                                         width: 200.w,
          //                                         height: 25.h,
          //                                         alignment:
          //                                             Alignment.center,
          //                                         margin: EdgeInsets
          //                                             .symmetric(
          //                                                 horizontal:
          //                                                     18.w,
          //                                                 vertical: 12.h),
          //                                         decoration:
          //                                             BoxDecoration(
          //                                           borderRadius: BorderRadius.only(
          //                                               bottomLeft: Radius
          //                                                   .circular(
          //                                                       10.r),
          //                                               bottomRight:
          //                                                   Radius
          //                                                       .circular(
          //                                                           10.r),
          //                                               topRight: Radius
          //                                                   .circular(
          //                                                       2.r),
          //                                               topLeft: Radius
          //                                                   .circular(
          //                                                       2.r)),
          //                                           color:
          //                                               Color(0xFFC9DCE1),
          //                                         ),
          //                                         padding: EdgeInsets
          //                                             .symmetric(
          //                                                 horizontal:
          //                                                     12.w),
          //                                         child: Text(
          //                                           "IUG Chalet",
          //                                           style: GoogleFonts.inter(
          //                                               fontSize: 15.sp,
          //                                               fontWeight:
          //                                                   FontWeight
          //                                                       .w600,
          //                                               color:
          //                                                   primaryColor),
          //                                         ),
          //                                       ),
          //                                     )
          //                                   : Container(),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             },
          //           ).toList(),
          //         ),
          //       )
          //     ],
          //   );
          // } else {
          //   return Center(
          //     child: Text(
          //       'NO DATA',
          //       style: GoogleFonts.poppins(
          //           fontSize: 30.sp,
          //           fontWeight: FontWeight.w700,
          //           color: Colors.black),
          //     ),
          //   );
          // }
          // });
        });
  }
  //
  // Widget shimmerLoadingWidget(
  //     {required double height,
  //     required double width,
  //       Color? baseColor,
  //       Color? highlightColor,
  //     EdgeInsets? margin,
  //     BoxDecoration? decoration}) {
  //   return Shimmer.fromColors(
  //     baseColor: baseColor ?? Colors.grey[300]!,
  //     highlightColor: highlightColor ?? Colors.grey[100]!,
  //     child: Container(
  //       margin: margin ?? EdgeInsets.all(0),
  //       width: width, // Adjust the size based on your preference
  //       height: height,
  //
  //       decoration: decoration ??
  //           const BoxDecoration(
  //             color: Colors.white,
  //           ),
  //
  //     ),
  //   );
  // }
}
