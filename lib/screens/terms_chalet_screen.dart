import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsChaletScreen extends StatefulWidget {
  const TermsChaletScreen({Key? key}) : super(key: key);

  @override
  State<TermsChaletScreen> createState() => _TermsChaletScreenState();
}

class _TermsChaletScreenState extends State<TermsChaletScreen> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 25.w, end:5, ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          SizedBox(
            height: 20.h,
          ),
            Text('property_terms'.tr(),
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ), ),



            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ChaletsGetxController.to.chalet.value.chaletTerms.length,
                padding: EdgeInsets.only(bottom: 10.h),
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
                    child: Text('• ${ChaletsGetxController.to.chalet.value.chaletTerms[index].term}',
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ), ),
                  );
                }),

            // ListView.builder(
            //   itemCount: items.length, // Replace with the total number of items in your list
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListTile(
            //       title: Text(items[index].title), // Replace with the title of the item at the current index
            //       subtitle: Text(items[index].subtitle), // Replace with the subtitle of the item at the current index
            //       // Other list tile properties
            //     );
            //   },
            // )

            SizedBox(height: 32.h,),
            Text('policty'.tr(),
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ), ),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ChaletsGetxController.to.chalet.value.chaletPolicies.length,
                padding: EdgeInsets.only(bottom: 10.h),
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
                    child: Text('• ${ChaletsGetxController.to.chalet.value.chaletPolicies[index].policy}',
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ), ),
                  );
                }),
            SizedBox(
              height: 20.h,
            ),

            // Padding(
            //   padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            //   child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
            //     style: GoogleFonts.inter(
            //       fontSize: 15.sp,
            //       fontWeight: FontWeight.w400,
            //       color: Colors.black,
            //     ), ),
            // ),
          ],
        ),
      ),
    );
  }
}
