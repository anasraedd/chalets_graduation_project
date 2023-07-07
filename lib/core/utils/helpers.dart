import 'dart:ui';

import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

mixin Helpers {
  void showSnackBar(
      {required BuildContext context,
      required String content,
      bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void bottomSheet({required context, required body}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      backgroundColor: Color(0xFFF5F8FF),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: body,
      ),
    );
  }

  void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  child,
                ],
              ));

  void showBlurredDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Stack(children: <Widget>[
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        16.0), // Set the desired radius here
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 300.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/logout_image.jpg"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('areYouSureLogout'.tr(), style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xFFD92C2C),
                        ),),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                          height: 3,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 40.h,
                                      child: Center(
                                        child: Text(
                                          'cancel'.tr(),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Color(0xFFD92C2C),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              VerticalDivider(
                                width: 3,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40.h,
                                    child: Center(
                                        child: Text(
                                      'logout'.tr(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: primaryColor,
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]));
        });
  }
}
