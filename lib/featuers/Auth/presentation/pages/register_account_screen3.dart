import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';


class RegisterAccountScreen3 extends StatelessWidget {
  RegisterAccountScreen3({Key? key}) : super(key: key);

  var value = "(+970) Palestine";
  var controller = TextEditingController();
  var pinController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: primaryColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: 80.h,
        elevation: 0,
        title: Text(
          'phoneNumber'.tr(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 330.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35.r),
                        bottomLeft: Radius.circular(35.r))),
                alignment: Alignment.topCenter,
                child: Image(
                  height: 290.h,
                  width: 290.w,
                  image: const AssetImage("assets/images/register3.png"),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 360.h,
              margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 105.h),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 310.h,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 34.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 31.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: 'otpText'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: "\n${'otp'.tr()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!,
                                          ),
                                          TextSpan(
                                            text: " ${'on'.tr()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text: " +970 (566)266255",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: primaryColor,
                                            fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ])),
                              ),
                              // SizedBox(
                              //   height: 35.h,
                              // ),
                          Container(
                            margin: EdgeInsets.only(top: 35.h, bottom: 30.h, ),
                            child: Pinput(

                              focusedPinTheme: PinTheme(
                                width: 50.w,
                                height: 50.w,
                                textStyle: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                    color: const Color(0xFF6CAFBF)
                                ),
                              ),
                              defaultPinTheme: PinTheme(
                                width: 50.w,
                                height: 50.w,
                                textStyle: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.r),
                                    color: const Color(0xFF6CAFBF)
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 50.w,
                                height: 50.w,
                                textStyle: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                    color: const Color(0xFF6CAFBF)
                                 ),
                              ),
                              validator: (s) {
                                return s == '2222' ? null : 'pinIsIncorrect'.tr();
                              },
                              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            ),
                          ),



                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                          Text(
                                             'dontReceiveOTP'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                          ),
                                      SizedBox(width: 3.w,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        child: Text('resendOTP'.tr(),
                                        style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF2C8095)
                                        ),


                                        ),
                                      )
                                        ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(555555.r),
                      ),
                      child: InkWell(
                        child: Container(
                          height: 75.h,
                          width: 75.h,
                          margin: EdgeInsets.all(13.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55555.r),
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400]!,
                                blurRadius: 3,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 40.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.length <= 3) {
      return oldValue;
    }
    return newValue;
  }
}
//                                    Container(
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 12.w),
//                                        alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         value.split(" ")[0],
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineLarge!
//                                             .copyWith(
//                                             fontSize: 15.sp,
//                                             fontWeight:
//                                             FontWeight.bold),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         height: 50.h,
//                                         alignment: Alignment.center,
//                                         width: double.infinity,
//                                         margin: EdgeInsets.only(
//                                             right: 12.w),
//                                         child: TextFormField(
//                                           maxLength: 10,
//                                           maxLines: 1,
//                                           keyboardType: TextInputType.phone,
//                                           controller: controller,
//                                           onChanged: (a) {},
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyMedium!
//                                               .copyWith(
//                                                   fontSize: 15.3.sp,
//                                                   fontWeight: FontWeight.bold,),
//                                           cursorColor: Colors.black,
//                                           cursorWidth: 1.4.w,
//                                           cursorHeight: 20.h,
//                                           cursorRadius:
//                                               const Radius.circular(555),
//                                           decoration: InputDecoration(
//                                               counter: Container(),
//                                               focusedBorder: InputBorder.none,
//                                               border: InputBorder.none,
//                                               counterText: "",
// ),
//                                         ),
//                                       ),
//                                     )
