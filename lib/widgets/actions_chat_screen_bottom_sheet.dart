import 'dart:ui';

import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionsChatScreenBottomSheet extends StatefulWidget {
  bool isArchive;
  bool isFavoriteChalet;
  bool isBlocked;

  bool clickedOnReport = false;

  ActionsChatScreenBottomSheet(
      {required this.isArchive,
      required this.isFavoriteChalet,
      required this.isBlocked});

  @override
  State<ActionsChatScreenBottomSheet> createState() =>
      _ActionsChatScreenBottomSheetState();
}

class _ActionsChatScreenBottomSheetState
    extends State<ActionsChatScreenBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 360.h,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // border: Border.all(color: Colors.black, width: 1),
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Anas Chalet',
                      style: GoogleFonts.inter(
                          fontSize: 27.5.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  widget.isFavoriteChalet
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          MyFlutterApp.heart_outlined,
                          color: Colors.white,
                        )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SvgPicture.asset('assets/images/custom_line.svg'),
            SizedBox(
              height: 22.5.h,
            ),
            widget.clickedOnReport ?
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 65.w),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 182.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Colors.grey[300]!,
                                //       blurRadius: 19,
                                //       offset: const Offset(0, 4)),
                                // ]
                            ),
                          ),
                          TextFormField(
                            //readOnly: !isEnable,
                            //enabled: isEnable,

                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            //controller: controller,
                            validator: (value) {
                              // if (value!.isEmpty) return lang!.password;
                              return null;
                            },
                            maxLines: 1,
                          //  keyboardType: keyboardType,
                          //  obscureText: hint == 'Password' ? true : false,

                            //maxLength: maxLength,
                            decoration: InputDecoration(

                              suffixIconConstraints: BoxConstraints(minHeight: 40, minWidth: 40),
                              hintText: 'type_your_complaint_here'.tr(),
                              hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: const Color(0x80ABABAB)),
                              counter: Container(),
                              fillColor: Colors.white,
                              isDense: true,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.clickedOnReport = false;
                                });
                              },
                              child: Text(
                                'cancle'.tr(),
                                style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Color(0xFFD9D9D9),
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r))),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.clickedOnReport = false;
                                });
                              },
                              child: Text(
                                'report'.tr(),
                                style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Color(0xFFDC9A9A),
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                :Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'view_chalet'.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFD9D9D9),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      widget.isArchive
                          ? 'remove_from_archive'.tr()
                          : 'go_to_archive'.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFD9D9D9),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      widget.isBlocked ? 'un_block'.tr() : 'block'.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: widget.isBlocked
                            ? Color(0xFF4ECB70)
                            : Color(0xFFDC9A9A),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.clickedOnReport = true;
                      });
                    },
                    child: Text(
                      'report'.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFDC9A9A),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
