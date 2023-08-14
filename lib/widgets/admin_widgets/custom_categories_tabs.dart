
import 'package:chalets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomCategoriesTab extends StatelessWidget {
  late String title;
  bool isSelected;

  CustomCategoriesTab({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.inter(
              fontSize: 12.5.sp, fontWeight: FontWeight.w500, color: isSelected ? Colors.white: Colors.black),
        ),
      ),
    );
  }
}
