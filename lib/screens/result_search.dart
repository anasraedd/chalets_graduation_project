import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/featuers/main/presentation/widgets/favourites_widget_item.dart';
import 'package:chalets/get/detailed_search_getx_controller.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultResearch extends StatefulWidget {
  const ResultResearch({Key? key}) : super(key: key);

  @override
  State<ResultResearch> createState() => _ResultResearchState();
}

class _ResultResearchState extends State<ResultResearch> {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<DetailedSearchGetxController>(() => DetailedSearchGetxController());

    DetailedSearchGetxController.to.searchChalet();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black12, // Set status bar color to transparent
    ));
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           Container(
             height: 55.h,
             margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
             decoration: const BoxDecoration(
                 image: DecorationImage(
                     fit: BoxFit.cover,
                     image: AssetImage("assets/images/serchTFF.png"))),
             padding: EdgeInsets.symmetric(horizontal: 40.w),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
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

           Expanded(
             child:  ScrollConfiguration(
               behavior: MyBehavior(),
               child: ListView(
                 children: [
                   // FavouritesWidgetItem(),
                   //
                   // FavouritesWidgetItem()
                 ],
               ),
             ),
           ),
           SizedBox(height: 20.h,),

         ],
       ),
     ),
    );
  }
}
