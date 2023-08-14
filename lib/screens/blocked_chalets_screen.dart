
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/user_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/main/presentation/widgets/favourites_widget_item.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/models/FavoriteChalet.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../widgets/custom_button_material.dart';


class BlockedChaletsScreen extends StatefulWidget with Helpers {
  BlockedChaletsScreen({Key? key}) : super(key: key);

  @override
  State<BlockedChaletsScreen> createState() => _BlockedChaletsScreenState();
}

class _BlockedChaletsScreenState extends State<BlockedChaletsScreen> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<UserGetxController>(() => UserGetxController());

      UserGetxController.to.getBlockedChaltes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var lang = AppLocalizations.of(context)!;
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
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                MyFlutterApp.back,
                color: Colors.white,
                size: 30,
              ),
            ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
              bottomLeft: Radius.circular(35.r),
            ),
          ),
          title: Text(
            lang.tr('chalet_blocked'),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25.sp,
            ),

          ),
        ),
      body: GetX<UserGetxController>(
          init: UserGetxController(),
          builder: (UserGetxController controller) {
            if(controller.loadingGetBlockedChalets.isTrue) {
              //  // showLoadingDialog(context);
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              //   //return const Center( child: CircularProgressIndicator(),);
              // }else

              return Center(child: CircularProgressIndicator());
              // return ListView(
              //   children: [
              //     FavouritesWidgetItem(),
              //     FavouritesWidgetItem(),
              //   ],
              // );
            }else {
              if (controller.blockedChalets.isNotEmpty) {
                return Padding(
                  padding:  EdgeInsets.only(top: 15.h),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        // height: 130.h,
                        // width: double.infinity,
                        //  clipBehavior: Clip.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h, bottom: 5.h),

                        child: Row(
                          children: [
                            Container(
                              height: 102.w,
                              width: 102.w,
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsetsDirectional.only(start: 5.w, top: 5.w, bottom: 5.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8.r),
                                //
                                // border:  Border.all(
                                //     strokeAlign: BorderSide.strokeAlignOutside,
                                //     color: Colors.white)
                              ),
                              child: CachedNetworkImage(
                                imageUrl: controller.blockedChalets.value[index].logo,

                                fit: BoxFit.cover,
                                // fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    SpinKitFadingCircle(
                                      color: Colors.blue,
                                      size: 50.0,
                                    ),
                              ),
                            ),
                            SizedBox(width: 10,),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(end: 10.w),
                                child: SizedBox(
                                  height: 102.h,
                                  child: Stack(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Text(
                                          controller.blockedChalets.value[index].name,
                                          style: GoogleFonts.inter(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 17.5.sp,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.bottomCenter,
                                        child: Container(
                                          width: double.infinity,


                                          child: ElevatedButton(
                                            onPressed: () async {

                                              showLoadingDialog(context);
                                                ApiResponse result = await UserApiController().unBlockChalet(id: controller.blockedChalets.value[index].id);
                                                if(result.success){

                                                  controller.blockedChalets.removeWhere((element) => element.id ==  controller.blockedChalets.value[index].id);
                                                 Get.back();
                                                  showSnackBarByGet(title: 'UnBlocked Chalet');
                                              //   }
                                               }
                                            },
                                            child: Text(
                                            localization.tr('un_block'),
                                              style: GoogleFonts.inter(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                     Color(0xFF4ECB70),

                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5.r))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            /*
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
                             */
                          ],
                        ),
                      ); //Text(controller.favoriteChalets.value[0].name);
                    },
                    itemCount: controller.blockedChalets.value.length
                    ,
                  ),
                );
              } else {
                return
                  Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   localization.tr('noFavoriteSoFar'),
                        //   style: GoogleFonts.inter(
                        //     fontSize: 22.sp,
                        //     fontWeight: FontWeight.w700,
                        //     color: const Color(0xFFABABAB),
                        //   ),
                        // ),
                        //
                        // SizedBox(
                        //   height: 80.h,
                        // ),
                        Icon(Icons.warning,size: 80,
                          color: Colors.orange,),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          localization.tr('no_data'),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFABABAB),
                          ),
                        ),
                        // SizedBox(
                        //   height: 25.h,
                        // ),
                        // SizedBox(
                        //     width: 150.w,
                        //     child: CustomButtonMaterial(
                        //         buttonText: localization.tr('exploreNow'),
                        //         onTab: () {})),
                      ],
                    ),
                  ),
                );
              }
            }


          }),
    );
    // !isExsistFavorite
    //     ? Padding(
    //   padding: const EdgeInsets.all(30.0),
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           'noFavoriteSoFar'.tr(),
    //           style: GoogleFonts.inter(
    //             fontSize: 22.sp,
    //             fontWeight: FontWeight.w700,
    //             color: const Color(0xFFABABAB),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 3.h,
    //         ),
    //         Text(
    //           'youCanExplore'.tr(),
    //           textAlign: TextAlign.center,
    //           style: GoogleFonts.inter(
    //             fontSize: 20.sp,
    //             fontWeight: FontWeight.w400,
    //             color: const Color(0xFFABABAB),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 80.h,
    //         ),
    //         Image(
    //           image: const AssetImage("assets/images/favoriteImage.png"),
    //           height: 230.h,
    //           width: 280.w,
    //         ),
    //         SizedBox(
    //           height: 25.h,
    //         ),
    //         SizedBox(
    //             width: 150.w,
    //             child: CustomButtonMaterial(
    //                 buttonText: 'exploreNow'.tr(), onTab: () {})),
    //       ],
    //     ),
    //   ),
    // )
    //     : FavouritesWidgetItem();
  }
}

