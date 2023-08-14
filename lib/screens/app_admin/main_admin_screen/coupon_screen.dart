import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/widgets/admin_widgets/DashedLine.dart';
import 'package:chalets/widgets/admin_widgets/custom_categories_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart' as lang;

class CouponScreen extends StatelessWidget with Helpers {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 100.h,
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
          child: Stack(
            children: [
              SvgPicture.asset('assets/images/app_bar.svg'),
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    lang.tr('coupon'),
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          padding: EdgeInsetsDirectional.all(3),
          width: double.infinity,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 35.w),
          decoration: BoxDecoration(
              color: Color(0xFFEFF0F4),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomCategoriesTab(
                  title: 'Active Coupons',
                  isSelected: true,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(child: CustomCategoriesTab(title: 'Expired Coupons')),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 160.h),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    showCouponDialog(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        // height: 130.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 9.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 6.w),
                              child: RichText(
                                text: TextSpan(
                                  text: '15',
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                  ),

                                  children: [
                                      TextSpan(
                                        text: 'Day',
                                        style: GoogleFonts.indieFlower(
                                          fontSize: 8.sp
                                        )
                                        // TextStyle(
                                        //     color: Colors.black,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 14.sp),
                                        // recognizer: TapGestureRecognizer()
                                        //   ..onTap = () {
                                        //     setState(() {
                                        //       expanded = true;
                                        //     });

                                      ),

                                      TextSpan(
                                        text: ': 23 ',
                                        style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    TextSpan(
                                      text: 'Hour',
                                      style: GoogleFonts.indieFlower(
                                        color: Colors.black,
                                          fontSize: 8.sp
                                       // fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    TextSpan(
                                      text: ': 46 ',
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Min',
                                      style: GoogleFonts.indieFlower(
                                        color: Colors.black,
                                          fontSize: 8.sp
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    TextSpan(
                                      text: ': 57 ',
                                      style: GoogleFonts.inter(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Sec',
                                      style: GoogleFonts.indieFlower(
                                        color: Colors.black,
                                          fontSize: 8.sp
                                       // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h,),
                           DashedLine(),
                           SizedBox(height: 15.h,),
                           Stack(
                             children: [
                               Center(child: SvgPicture.asset('assets/images/box_coupon.svg')),
                               Center(child: Text('15', style: GoogleFonts.knewave(fontWeight: FontWeight.normal, fontSize: 19.sp, color: Colors.white),))
                             ,PositionedDirectional(
                                 end: 42.w,
                               child: Text('%', style: GoogleFonts.jollyLodger(
                                   fontSize: 19.sp,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.orange
                                 ),),
                             ),

                               PositionedDirectional(
                                 end: 40.w,
                      top:20.h,
                      child: Text('off', style: GoogleFonts.jollyLodger(
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                      ),),
                      ),
                             ],
                           ),
                           SizedBox(height: 10.h,),
                           Text('RF31COKQ', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15.sp, color: primaryColor),),
                           SizedBox(height: 11.5.h,),
                           Container(
                             height: 30.h,
                             margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w, vertical: 3.h),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(20)),
                                       color: Colors.green
                                     ),
                                     child: Padding(
                                       padding:  EdgeInsetsDirectional.only(start: 15.w),
                                       child: Align(
                                           alignment: AlignmentDirectional.centerStart,
                                           child: Icon(Icons.edit_square, size: 15,color: Colors.white,)),
                                     ),

                                   ),
                                 ),
                                 Expanded(
                                   child: Container(
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20)),
                                         color: Colors.red
                                     ),
                                     child: Padding(
                                       padding:  EdgeInsetsDirectional.only(end: 15.w),
                                       child: Align(
                                           alignment: AlignmentDirectional.centerEnd,
                                           child: Icon(Icons.delete, size: 15,color: Colors.white,)),
                                     ),

                                   ),
                                 ),
                                 // Expanded(child: ElevatedButton(onPressed: (){}, child:Align(
                                 //     alignment: AlignmentDirectional.centerStart,
                                 //     child: Icon(Icons.edit_square, size: 15,)), style: ElevatedButton.styleFrom(
                                 //     backgroundColor: Colors.green
                                 // ))),
                  //                Expanded(child: ElevatedButton(onPressed: (){}, child: Align(
                  // alignment: AlignmentDirectional.centerEnd,child: Icon(Icons.delete, size: 15,)), style: ElevatedButton.styleFrom(
                  //                  backgroundColor: Colors.red
                  //                ),))
                               ],
                             ),
                           )

                           //  Divider(
                           //    height: 2,
                           //    color: Colors.black,
                           //
                           //  )

                          ],
                        ),
                      ),
                      PositionedDirectional(
                        //alignment: AlignmentDirectional.bottomCenter,
                        top: 125.h,
                        start: 40,
                        end:40,
                        child: Container(
                         // margin: EdgeInsetsDirectional.only(bottom: -20.h),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: scaffoldBackGround,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(5555),
border: Border.all(width: 3, color: Colors.white)
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 6,
            ),
          ),
        )
      ])),
    );
  }
}






