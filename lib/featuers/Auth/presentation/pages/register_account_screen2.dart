import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen3.dart';
import 'package:chalets/get/auth_and_routing_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_theme.dart';

class RegisterAccountScreen2 extends StatefulWidget {
  RegisterAccountScreen2({Key? key}) : super(key: key);

  @override
  State<RegisterAccountScreen2> createState() => _RegisterAccountScreen2State();
}

class _RegisterAccountScreen2State extends State<RegisterAccountScreen2>
    with Helpers {
  final List<String> list = [
    "(+970) Palestine",
    "(+962) Jorden1",
    "(+971) Ema rat"
  ];

  final authGetxController = Get.lazyPut(
    () => AuthAndRoutingGetxController(),
  );

  var value = "(+970) Palestine";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE5E5E5),
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   // shadowColor: primaryColor,
        //
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //     // Status bar color
        //
        //     statusBarColor: primaryColor,
        //     // Status bar brightness (optional)
        //     statusBarIconBrightness: Brightness.light,
        //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
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
                        margin: EdgeInsetsDirectional.only(top: 70.h),
                        height: 310.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(35.r),
                                bottomLeft: Radius.circular(35.r))),
                        alignment: Alignment.topCenter,
                        child: Image(
                          height: 320.h,
                          image:
                              const AssetImage("assets/images/phoneNumber.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 440.h,
                      margin:
                          EdgeInsets.only(left: 26.w, right: 26.w, top: 200.h),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: 378.h,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 34.w, right: 34.w, top: 30.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // DropdownButton(
                                      //   items: list
                                      //       .map((e) =>
                                      //       DropdownMenuItem(
                                      //         value: e,
                                      //         child: Container(
                                      //           padding: EdgeInsets.symmetric(
                                      //               horizontal: 2.w),
                                      //           child: Text(
                                      //             e,
                                      //             style: Theme
                                      //                 .of(context)
                                      //                 .textTheme
                                      //                 .bodyMedium!
                                      //                 .copyWith(
                                      //               fontWeight:
                                      //               FontWeight.w500,
                                      //               fontSize: 18.sp,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ))
                                      //       .toList(),
                                      //   onChanged: (value) {},
                                      //   value: value,
                                      //   icon: const Icon(
                                      //     Icons.keyboard_arrow_down_rounded,
                                      //     color: Colors.black,
                                      //   ),
                                      //   underline: Container(
                                      //     width: double.infinity,
                                      //     height: 1.2.h,
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.black,
                                      //         borderRadius:
                                      //         BorderRadius.circular(55)),
                                      //   ),
                                      //   isExpanded: true,
                                      // ),
                                      InkWell(
                                          onTap: () {
                                            showCountryPicker(
                                                context: context,
                                                countryListTheme:
                                                    CountryListThemeData(
                                                  flagSize: 25,
                                                  backgroundColor: Colors.white,
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blueGrey),
                                                  // bottomSheetHeight: 500, // Optional. Country list modal height
                                                  //Optional. Sets the border radius for the bottomsheet.
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                  //Optional. Styles the search field.
                                                  inputDecoration:
                                                      InputDecoration(
                                                    labelText: 'Search',
                                                    hintText:
                                                        'Start typing to search',
                                                    prefixIcon: const Icon(
                                                        Icons.search),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: const Color(
                                                                0xFF8C98A8)
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onSelect: (Country country) {
                                                  getxController.nameCuontry
                                                      .value = country.name;
                                                  getxController
                                                          .phoneCodeCuontry
                                                          .value =
                                                      country.phoneCode;
                                                  getxController
                                                          .flagEmojiCuontry
                                                          .value =
                                                      country.flagEmoji;
                                                  print(
                                                      'displayName: ${country.displayName}\ countryCode: ${country.countryCode}\ phoneCode:  ${country.phoneCode} \ name: ${country.name}\ displayNameNoCountryCode: ${country.displayNameNoCountryCode}\ e164Key: ${country.e164Key} \ flagEmoji: ${country.flagEmoji}');
                                                });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            secondaryColor))),
                                            child: Row(
                                              children: [
                                                Text(
                                                    '(+${getxController.phoneCodeCuontry.value})'),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Expanded(
                                                  child: Text(getxController
                                                      .nameCuontry.value),
                                                ),
                                                Icon(Icons
                                                    .keyboard_arrow_down_outlined)
                                              ],
                                            ),
                                          )),
                                      //   //   DropdownButton(
                                      //   //     items: list
                                      //   //         .map((e) =>
                                      //   //         DropdownMenuItem(
                                      //   //           value: e,
                                      //   //           child: Container(
                                      //   //             padding: EdgeInsets.symmetric(
                                      //   //                 horizontal: 2.w),
                                      //   //             child: Text(
                                      //   //               e,
                                      //   //               style: Theme
                                      //   //                   .of(context)
                                      //   //                   .textTheme
                                      //   //                   .bodyMedium!
                                      //   //                   .copyWith(
                                      //   //                 fontWeight:
                                      //   //                 FontWeight.w500,
                                      //   //                 fontSize: 18.sp,
                                      //   //               ),
                                      //   //             ),
                                      //   //           ),
                                      //   //         ))
                                      //   //         .toList(),
                                      //   //     onChanged: (value) {},
                                      //   //     value: value,
                                      //   //     icon: const Icon(
                                      //   //       Icons.keyboard_arrow_down_rounded,
                                      //   //       color: Colors.black,
                                      //   //     ),
                                      //   //     underline: Container(
                                      //   //       width: double.infinity,
                                      //   //       height: 1.2.h,
                                      //   //       decoration: BoxDecoration(
                                      //   //           color: Colors.black,
                                      //   //           borderRadius:
                                      //   //           BorderRadius.circular(55)),
                                      //   //     ),
                                      //   //     isExpanded: true,
                                      //   //   ),
                                      //   ),
                                      // ),

                                      SizedBox(
                                        height: 26.h,
                                      ),
                                      Text(
                                        lang.tr('phoneNumber'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          border: Border.all(
                                            color: const Color(0xFFD9D9D9),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 9.w,
                                            ),
                                            // Text(
                                            //   getxController
                                            //       .flagEmojiCuontry.value,
                                            //   // Replace with your desired Emoji
                                            //   style: TextStyle(fontSize: 25),
                                            // ),
                                            Container(
                                              height: 35.r,
                                              width: 35.r,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(55555555.r),
                                                  // image: const DecorationImage(
                                                  //     fit: BoxFit.cover,
                                                  //     image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac')
                                                  // )

                                              ),
                                              child: Center(child: Text(getxController.flagEmojiCuontry.value, style: TextStyle(fontSize: 20))),
                                            ),
                                            SizedBox(
                                              width: 12.w,
                                            ),
                                            VerticalDivider(
                                              width: 1.w,
                                              color: Color(0xFFD9D9D9),
                                              thickness: 1.w,
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                top: 3.5.h,
                                                                start: 10,
                                                                end: 2),
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerStart,
                                                    child: Text(
                                                      // value.split(" ")[0],
                                                      '(+${getxController.phoneCodeCuontry.value})',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                      AlignmentDirectional
                                                          .topStart,
                                                      height: 80.h,
                                                      margin: EdgeInsetsDirectional.only(
                                                          end: 12.w),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        controller: controller,
                                                        onChanged: (a) {},
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize:
                                                                    15.3.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                height: 1.8),
                                                        cursorColor:
                                                            Colors.black,
                                                        cursorWidth: 1.4.w,
                                                        cursorRadius:
                                                            const Radius
                                                                .circular(555),
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(0),
                                                          fillColor: Colors
                                                              .redAccent
                                                              .withOpacity(.6),
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 165.w,
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
                                                          text: lang.tr('otp'),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        )
                                                      ])),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              lang.tr('txtCarrierRate'),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
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
                              height: 100.h,
                              width: 100.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E5E5),
                                borderRadius: BorderRadius.circular(555555.r),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _performVerifyMobile();

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

  Future<void> _performVerifyMobile() async {
    if (_checkDate()) {
      AuthAndRoutingGetxController.to.numberPhone.value =  AuthAndRoutingGetxController.to.phoneCodeCuontry.value+controller.text;
     // Get.offAllNamed('/code_verification_screen');

      await _VerifyNumberMobile();

    }
  }

  bool _checkDate() {
    if (controller.text.isNotEmpty) {
      return true;
    }

    showSnackBarByGet(title: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _VerifyNumberMobile() async {
    showLoadingDialog(context);

    // Future.delayed(Duration(seconds: 5), () {
    //   Get.back();
    // });
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    // print(fcmToken);
    ApiResponse apiResponse = await AuthApiController()
        .verifyNumberMobile(numberPhone: AuthAndRoutingGetxController.to.phoneCodeCuontry.value+controller.text);

    if (apiResponse.success) {
      AuthAndRoutingGetxController.to.requestId.value = apiResponse.requestId!;
      Get.offAllNamed('/code_verification_screen');
      //  Get.to( ()=> RegisterAccountScreen3());


    } else {
      Get.back();
      showSnackBarByGet(
          title: apiResponse.message, error: !apiResponse.success);
    }
  }
}
