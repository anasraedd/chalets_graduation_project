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
      padding: EdgeInsetsDirectional.only(start: 25.w, top: 45.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('property_terms'.tr(),
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ), ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ), ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ), ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ), ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ), ),
          ),

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

          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
            child: Text('• lorem ipsum was popularized in the 1960s with letraset\'s dry-transfer sheets.',
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ), ),
          ),
        ],
      ),
    );
  }
}
