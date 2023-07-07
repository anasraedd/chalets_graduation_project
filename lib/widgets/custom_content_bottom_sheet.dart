import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContentBottomSheet extends StatelessWidget {
  final String titleAction;
  final Widget child;
  final TextEditingController controller;
  final void Function()? onClicked;

  CustomContentBottomSheet(
      {required this.titleAction,
      required this.child,
      required this.controller,
        this.onClicked
      });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 52.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Change ${this.titleAction}',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                ),

                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 17.w,
                )
              ],
            ),
          ),
          child,
          Container(
            margin: EdgeInsets.only(bottom: 30.h),
            child: ElevatedButton(
              onPressed: () async {
                if(onClicked != null){
                  onClicked!();
                }

                Navigator.pop(context);
              },
              child: Text(
                'Confirm',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22.5.sp,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 47.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  )),
            ),
          )
        ]));
  }
}
