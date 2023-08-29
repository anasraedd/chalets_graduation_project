import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen.dart';
import 'package:chalets/models/api_response.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../get/auth_and_routing_controller.dart';

class RegisterAccountScreen3 extends StatefulWidget {
  late String requestId;
  late String numberPhone;

  RegisterAccountScreen3({required this.requestId, required this.numberPhone});

  @override
  State<RegisterAccountScreen3> createState() => _RegisterAccountScreen3State();
}

class _RegisterAccountScreen3State extends State<RegisterAccountScreen3>
    with Helpers {
  var value = "(+970) Palestine";

  var controller = TextEditingController();

  var pinController = TextEditingController();



  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
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
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   shadowColor: primaryColor,
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //     // Status bar color
        //     statusBarColor: primaryColor,
        //     // Status bar brightness (optional)
        //     statusBarIconBrightness: Brightness.light,
        //     statusBarBrightness: Brightness.light,
        //   ),
        //   toolbarHeight: 80.h,
        //   elevation: 0,
        //   title: Text(
        //     lang.tr('phoneNumber'),
        //     style: GoogleFonts.inter(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 25.sp,
        //     ),
        //   ),
        // ),

        body: GetX<AuthAndRoutingGetxController>(
            init: AuthAndRoutingGetxController(),
            builder: (AuthAndRoutingGetxController getxController) {
              return Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 110.h,
                      color: primaryColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Text(
                            lang.tr('phoneNumber'),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: 80.h ),

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
                          image:
                              const AssetImage("assets/images/register3.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 360.h,
                      margin:
                          EdgeInsets.only(left: 26.w, right: 26.w, top: 150.h),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                text: lang.tr('otpText'),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text: "\n${lang.tr('otp')}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!,
                                                  ),
                                                  TextSpan(
                                                    text: " ${lang.tr('on')} ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        getxController.numberPhone.value,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ])),
                                      ),
                                      // SizedBox(
                                      //   height: 35.h,
                                      // ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 35.h,
                                          bottom: 30.h,
                                        ),
                                        child: Pinput(
                                          controller: pinController,
                                          focusedPinTheme: PinTheme(
                                            width: 50.w,
                                            height: 50.w,
                                            textStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.r),
                                                color: const Color(0xFF6CAFBF)),
                                          ),
                                          defaultPinTheme: PinTheme(
                                            width: 50.w,
                                            height: 50.w,
                                            textStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.r),
                                                color: const Color(0xFF6CAFBF)),
                                          ),
                                          submittedPinTheme: PinTheme(
                                            width: 50.w,
                                            height: 50.w,
                                            textStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.r),
                                                color: const Color(0xFF6CAFBF)),
                                          ),
                                          validator: (s) {
                                            //return s == '2222' ? null : 'pinIsIncorrect'.tr();
                                          },
                                          pinputAutovalidateMode:
                                              PinputAutovalidateMode.onSubmit,
                                          showCursor: true,
                                          onCompleted: (pin) {
                                            // AuthAndRoutingGetxController
                                            //     .to.checkCode.value = pin;
                                            // print('pin: $pin');
                                            //   _performVerifyCheckCode();
                                          },
                                        ),
                                      ),

                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(lang.tr('dontReceiveOTP'),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                focusColor: Colors.transparent,
                                                child: Text(
                                                  lang.tr('resendOTP'),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xFF2C8095)),
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
                                onTap: () {
                                  _performVerifyCheckCode();
                                },
                                child: Container(
                                  height: 75.h,
                                  width: 75.h,
                                  margin: EdgeInsets.all(13.r),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(55555.r),
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
              );
            }));
  }

  Future<void> _performVerifyCheckCode() async {
    if (_checkDate()) {
      await _VerifyCheckCode();
    }
  }

  bool _checkDate() {
    if (pinController.text.isNotEmpty) {
      return true;
    }

    showSnackBarByGet(title: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _VerifyCheckCode() async {
    showLoadingDialog(context);

    // Future.delayed(Duration(seconds: 5), () {
    //   Get.back();
    // });
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    // print(fcmToken);
    ApiResponse apiResponse = await AuthApiController().verifyCheckCode(
        requestId: widget.requestId,
        verifyCode: pinController.text);

    if (apiResponse.success) {
      // AuthAndRoutingGetxController.to.requestId.value = apiResponse.object;
      // Get.back();
      Get.offAll(RegisterAccountScreen(numberPhone: widget.numberPhone));
      showSnackBarByGet(
          title: apiResponse.message, error: !apiResponse.success);
    } else {
      Get.back();
      showSnackBarByGet(
          title: apiResponse.message, error: !apiResponse.success);
    }
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
