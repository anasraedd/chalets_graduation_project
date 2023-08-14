import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF2C8095);//Color(0xFF017C9B);
const primaryColorDisable = Color(0x5C017C9B);
const secondaryColor = Color(0xFFABABAB);
const scaffoldBackGround = Color(0xFFF5F8FF);
const color1 = Color(0xFFE5E5E5);

const textGray = Color(0xFF959595);

const customButtonColor = Color(0xFF2DC653);






final appTheme = ThemeData(

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
  buttonBarTheme: ButtonBarThemeData(
    buttonMinWidth: 0, // To remove the minimum width constraint on buttons
    alignment: MainAxisAlignment.spaceBetween, // To align buttons to the edges
    mainAxisSize: MainAxisSize.max, // To take the full width

  ),

    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: primaryColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )),


   textTheme: TextTheme(
     headline1: GoogleFonts.lato(
       fontSize: 20.sp,
       color: Colors.redAccent,
       fontWeight: FontWeight.normal
     ),


   ),







);


ThemeData  buildLightTheme() {

  final baseTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackGround,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(primaryColor),
      // crossAxisMargin: 50
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: primaryColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )),

    textTheme: TextTheme(
          headlineLarge: GoogleFonts.inter(
          fontSize: 35.sp,
          color:  primaryColor,
          fontWeight: FontWeight.normal
      ),

      //chat name
      headlineMedium: GoogleFonts.inter(
          fontSize: 30.sp,
          color:  Colors.black,
          fontWeight: FontWeight.normal
      ),
      headlineSmall: GoogleFonts.inter(
          fontSize: 20.sp,
          color:  primaryColor,
          fontWeight: FontWeight.normal
      ),


      // details
      bodyLarge:  GoogleFonts.inter(
          fontSize: 19.sp,
          color:  const Color(0xFF454545),
          fontWeight: FontWeight.normal
      ),
      bodyMedium:  GoogleFonts.inter(
          fontSize: 16.sp,
          color:  Colors.black,
          fontWeight: FontWeight.normal
      ),
      bodySmall:  GoogleFonts.inter(
          fontSize: 13.sp,
          color:  Colors.black,
          fontWeight: FontWeight.normal
      ),


      // bodyText1:   GoogleFonts.inter(
      //     fontSize: 15.sp,
      //     color: const Color(0xFF252525),
      //     fontWeight: FontWeight.w300,
      // ),




    ),






  );
  return baseTheme.copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[800],
      hintColor: Colors.grey[850]);
}