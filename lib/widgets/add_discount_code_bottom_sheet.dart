import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AddDiscountCodeBottomSheet extends StatelessWidget {
  const AddDiscountCodeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r))
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(

          height: 207.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))

          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 5.w),
                  child: Text('Add Discount Code', style: GoogleFonts.inter(
                    fontSize: 17.5.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),),
                ),
                SizedBox(height: 15.h,),

                TextField(
                  decoration: InputDecoration(

                    suffixIconConstraints: BoxConstraints(minHeight: 40, minWidth: 40),
                    hintText: 'eg: 2A8LR7',
                    hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: const Color(0x80ABABAB)),
                    counter: Container(),
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Colors.black, width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: SizedBox(
                      width: 270.w,
                      height: 47.h,
                      child: ElevatedButton(
                        onPressed: (){

                        }, child: Text('confirm'.tr(), style: GoogleFonts.inter(fontSize: 22.5.sp, fontWeight: FontWeight.w600, color: Colors.white),),

                        style: ElevatedButton.styleFrom(

                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(47.r)
                            )
                        ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
