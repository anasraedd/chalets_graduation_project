import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../widgets/custom_button_material.dart';
import '../../../widgets/favourites_widget_item.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);

  bool isExsistFavorite = false;

  @override
  Widget build(BuildContext context) {
   // var lang = AppLocalizations.of(context)!;
    return !isExsistFavorite?Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'noFavoriteSoFar'.tr(),
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
              'youCanExplore'.tr(),
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
              image: const AssetImage("assets/images/favoriteImage.png"),
              height: 230.h,
              width: 280.w,
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
                width: 150.w,
                child: CustomButtonMaterial(
                    buttonText: 'exploreNow'.tr(), onTab: () {})),
          ],
        ),
      ),
    ):FavouritesWidgetItem() ;
  }
}
