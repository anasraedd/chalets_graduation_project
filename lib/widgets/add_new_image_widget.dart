import 'package:chalets/core/theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewImageWidget extends StatelessWidget {
  double sizeText;

  AddNewImageWidget({this.sizeText = 12.5});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,

        radius: Radius.circular(13.r),
        color: Colors.black,
        // strokeWidth: 1,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/bi_plus-square-dotted.svg'),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Add Photos of your chalet',
                style: GoogleFonts.inter(
                    fontSize: sizeText.sp,
                    fontWeight: FontWeight.w700,
                    color: textGray),
              )
            ],
          ),
        ),
      ),
    );
  }
}
