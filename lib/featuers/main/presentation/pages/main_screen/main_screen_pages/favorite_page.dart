import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/models/FavoriteChalet.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../widgets/custom_button_material.dart';
import '../../../widgets/favourites_widget_item.dart';

class FavoriteScreen extends StatefulWidget with Helpers {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<UserGetxController>(() => UserGetxController());
    if (!UserGetxController.to.isGetFavoriteChalets.value) {
      UserGetxController.to.getFavoriteChaltes();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var lang = AppLocalizations.of(context)!;
    return GetX<UserGetxController>(
        init: UserGetxController(),
        builder: (UserGetxController controller) {
           if(controller.loadingGetFavoriteChalets.isTrue) {
             //  // showLoadingDialog(context);
             //   return Center(
             //     child: CircularProgressIndicator(),
             //   );
             //   //return const Center( child: CircularProgressIndicator(),);
             // }else

            return ListView(
              children: [
                FavouritesWidgetItem(),
                FavouritesWidgetItem(),
              ],
            );
           }else if (controller.favoriteChalets.isNotEmpty) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FavouritesWidgetItem(
                    controller.favoriteChalets[
                    index]); //Text(controller.favoriteChalets.value[0].name);
              },
              itemCount: controller.favoriteChalets.length
              ,
            );

          } else {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localization.tr('noFavoriteSoFar'),
                      style: GoogleFonts.inter(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      localization.tr('youCanExplore'),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFABABAB),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Image(
                      image:
                      const AssetImage("assets/images/favoriteImage.png"),
                      height: 230.h,
                      width: 280.w,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                        width: 150.w,
                        child: CustomButtonMaterial(
                            buttonText: localization.tr('exploreNow'),
                            onTab: () {})),
                  ],
                ),
              ),
            );

          }


        });
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
