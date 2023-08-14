import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class PricesScreen2 extends StatelessWidget {
  final createChaletGetxController = Get.lazyPut<CreateChaletGetxController>(
      () => CreateChaletGetxController());

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: false, color: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: primaryColor,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: primaryColor,
        //   statusBarIconBrightness: Brightness.light,
        //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
        toolbarHeight: 80.h,
        title: RichText(
          text: TextSpan(
            text: 'Prices / Day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
            ),
            children: [
              TextSpan(
                text: ' / Half Day',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
        // Text(
        //   'Prices / Day/',
        //   style: GoogleFonts.inter(
        //     fontSize: 25.sp,
        //     fontWeight: FontWeight.w600,
        //     color: Colors.white,
        //   ),
        // ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            MyFlutterApp.back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: scaffoldBackGround,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/prices_in_days.svg',
                  height: 62.h,
                ),
                SizedBox(
                  width: 30.w,
                ),
                // SvgPicture.asset('assets/images/prices_in_days.svg'),
                // SvgPicture.asset('assets/images/prices_in_days.svg'),
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8.r)),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Text(
                              'AM',
                              style: GoogleFonts.indieFlower(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                text: '8:00',
                                style: GoogleFonts.kranky(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' am',
                                    style: GoogleFonts.kranky(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                  TextSpan(
                                    text: ' to 7:00',
                                    style: GoogleFonts.kranky(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                  TextSpan(
                                    text: ' pm',
                                    style: GoogleFonts.kranky(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(8.r)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Text(
                            'PM',
                            style: GoogleFonts.indieFlower(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                text: '8:00',
                                style: GoogleFonts.kranky(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' pm',
                                    style: GoogleFonts.kranky(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                  TextSpan(
                                    text: ' to 7:00',
                                    style: GoogleFonts.kranky(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                  TextSpan(
                                    text: ' am',
                                    style: GoogleFonts.kranky(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.h, right: 45.w, left: 45.w),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: PricesInAMAndPM2(
                        dayName: 'Saturday',
                        priceInAM: TextEditingController(
                            text: 'dd'),//CreateChaletGetxController.to.chaletPrices.value.saturdayAm
                        priceInPM: TextEditingController(
                            text: 'knmo')))

                // CustomTextField(hint: 'Enter price', keyboardType: TextInputType.number, context: context, controller: CreateChaletGetxController.to.listPricesOfAMAndPM[CreateChaletGetxController.to.indexFocus.value].priceInAM)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PricesInAMAndPM2 extends StatelessWidget {
  // final PricesOfAMAndPM pricesInAMAndPM;
  // Period? focusPeriod;
  // late bool isAdmin;
  // late int folowIndex;
  late String dayName;
  late TextEditingController? priceInAM;
  late TextEditingController? priceInPM;

  PricesInAMAndPM2(
      {required this.dayName,
      required this.priceInAM,
      required this.priceInPM});

  // bool exsistPriceInAM2 = false;

  // PricesInAMAndPM(
  //     {required this.pricesInAMAndPM,
  //       this.isAdmin = false,
  //       required this.folowIndex,});

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              Container(
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(8.r),
                      bottomEnd: Radius.circular(8.r)),
                ),
                child: Center(
                  child: Text(
                    dayName,
                    style: GoogleFonts.indieFlower(
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              // Container(
              //   height: 50.h,
              //   width: 100.w,
              //   decoration: BoxDecoration(
              //       color: scaffoldBackGround,
              //       borderRadius: BorderRadiusDirectional.only(
              //           bottomStart: Radius.circular(8.r),
              //           topEnd: Radius.circular(8.r)),
              //       border: Border.all(color: secondaryColor, width: 3)),
              //   child: Center(
              //     child:
              //     controller.statusPricesOfAMControllers[folowIndex] ||
              //         controller.listPricesOfAMAndPM[folowIndex]
              //             .priceInAM.text.isNotEmpty
              //         ? Stack(
              //       children: [
              //         TextFormField(
              //           controller: pricesInAMAndPM.priceInAM,
              //           //'${pricesInAMAndPM.priceInAM!.text} \$',
              //           textAlign: TextAlign.center,
              //           readOnly: !isAdmin,
              //           keyboardType: TextInputType.number,
              //           focusNode: pricesInAMAndPM.focusNodeAM,
              //
              //           decoration: InputDecoration(
              //             contentPadding: EdgeInsetsDirectional.only(top: -5, end: 18),
              //             // contentPadding: EdgeInsetsDirectional.all(15),
              //             enabledBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                     color: scaffoldBackGround, width: 0)),
              //             focusedBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                     color: scaffoldBackGround, width: 0)),
              //           ),
              //           style: GoogleFonts.indieFlower(
              //               fontSize: 17.5.sp,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.black),
              //         ),
              //         Container(
              //           margin: EdgeInsetsDirectional.only(top: 7),
              //
              //           alignment: AlignmentDirectional.centerEnd,
              //           child: Text('\$ ', style: GoogleFonts.indieFlower(
              //               fontSize: 17.5.sp,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.black),
              //             textAlign: TextAlign.start,
              //           ),
              //         ),
              //
              //       ],
              //     )
              //         : GestureDetector(
              //       onTap: () {
              //         Get.focusScope!.unfocus();
              //         controller.statusPricesOfAMControllers[
              //         folowIndex] = true;
              //         //Get.focusScope!.unfocus();
              //         Future.delayed(Duration(milliseconds: 10), (){
              //           // Get.focusScope!.requestFocus(controller.listPricesOfAMAndPM[folowIndex].focusNode);
              //           Get.focusScope!.requestFocus(pricesInAMAndPM.focusNodeAM);
              //
              //         });
              //         // FocusScope.of(context).requestFocus(pricesInAMAndPM.focusNode);
              //
              //         for (int i = 0;
              //         i <
              //             controller
              //                 .statusPricesOfAMControllers.length;
              //         i++) {
              //           if (i != folowIndex) {
              //             controller.statusPricesOfAMControllers[i] =
              //             false;
              //           }
              //           controller.statusPricesOfPMControllers[i] = false;
              //         }
              //       },
              //       child: SvgPicture.asset(
              //         'assets/images/bi_plus-square-dotted.svg',
              //         height: 20,
              //         width: 20,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 10.w,
              // ),
              // Container(
              //   height: 50.h,
              //
              //   width: 100.w,
              //   decoration: BoxDecoration(
              //       color: scaffoldBackGround,
              //       borderRadius: BorderRadiusDirectional.only(
              //           bottomStart: Radius.circular(8.r),
              //           topEnd: Radius.circular(8.r)),
              //       border: Border.all(color: secondaryColor, width: 3)),
              //   child: Center(
              //     child:
              //     //  exsistPriceInPM ?
              //     controller.statusPricesOfPMControllers[folowIndex] ||
              //         controller.listPricesOfAMAndPM[folowIndex]
              //             .priceInPM.text.isNotEmpty
              //         ? //priceInPM.text.isNotEmpty?
              //     Stack(
              //       children: [
              //         TextFormField(
              //           controller: pricesInAMAndPM.priceInPM,
              //           textAlign: TextAlign.center,
              //           readOnly: !isAdmin,
              //           keyboardType: TextInputType.number,
              //
              //
              //           focusNode: pricesInAMAndPM.focusNodePM,
              //           decoration: InputDecoration(
              //
              //             //  suffixText: '\$', // رمز الدولار
              //             //  suffixIcon: Icon(Icons.dangerous_sharp),
              //             //   suffix: Text('\$', style: GoogleFonts.indieFlower(
              //             //       fontSize: 17.5.sp,
              //             //       fontWeight: FontWeight.w400,
              //             //       color: Colors.black),),
              //
              //
              //
              //             //suffixIcon: Icon(FontAwesome5.shekel_sign),,
              //             contentPadding: EdgeInsetsDirectional.only(top: -5, end: 20),
              //             //                      contentPadding: EdgeInsetsDirectional.all(15),
              //
              //
              //             enabledBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                     color: scaffoldBackGround, width: 0)),
              //             focusedBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                     color: scaffoldBackGround, width: 0)),
              //           ),
              //           // '${pricesInAMAndPM.priceInPM!.text} \$',
              //           style: GoogleFonts.indieFlower(
              //               fontSize: 17.5.sp,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.black),
              //         ),
              //         Container(
              //           margin: EdgeInsetsDirectional.only(top: 7),
              //
              //           alignment: AlignmentDirectional.centerEnd,
              //           child: Text('\$ ', style: GoogleFonts.indieFlower(
              //               fontSize: 17.5.sp,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.black),
              //             textAlign: TextAlign.start,
              //           ),
              //         ),
              //       ],
              //     )
              //         : GestureDetector(
              //       onTap: () {
              //         Get.focusScope!.unfocus();
              //         controller.statusPricesOfPMControllers[
              //         folowIndex] = true;
              //         //Get.focusScope!.unfocus();
              //         Future.delayed(Duration(milliseconds: 10), (){
              //           // Get.focusScope!.requestFocus(controller.listPricesOfAMAndPM[folowIndex].focusNode);
              //           Get.focusScope!.requestFocus(pricesInAMAndPM.focusNodePM);
              //
              //         });
              //         // FocusScope.of(context).requestFocus(pricesInAMAndPM.focusNode);
              //
              //         for (int i = 0;
              //         i <
              //             controller
              //                 .statusPricesOfPMControllers.length;
              //         i++) {
              //           if (i != folowIndex) {
              //             controller.statusPricesOfPMControllers[i] =
              //             false;
              //           }
              //           controller.statusPricesOfAMControllers[i] =
              //           false;
              //         }
              //
              //       },
              //       child: SvgPicture.asset(
              //         'assets/images/bi_plus-square-dotted.svg',
              //         height: 20,
              //         width: 20,
              //       ),
              //     ),
              //   ),
              // ),
              CustonInputForPrice(isAdmin: true, priceTextEditingController: priceInAM!, focusNode: FocusNode(),),
              SizedBox(
                width: 10.w,
              ),
              CustonInputForPrice(isAdmin: true, priceTextEditingController: priceInPM!, focusNode: FocusNode(),)
            ],
          );

  }
}

class CustonInputForPrice extends StatefulWidget {
  late bool isAdmin;

  late TextEditingController priceTextEditingController;
  late FocusNode focusNode;

  CustonInputForPrice(
      {this.isAdmin = false, required this.priceTextEditingController, required this.focusNode});



  @override
  State<CustonInputForPrice> createState() => _CustonInputForPriceState();
}

class _CustonInputForPriceState extends State<CustonInputForPrice> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: scaffoldBackGround,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(8.r), topEnd: Radius.circular(8.r)),
          border: Border.all(color: secondaryColor, width: 3)),
      child: Center(
        child:
            // controller.statusPricesOfAMControllers[folowIndex] ||
            //     controller.listPricesOfAMAndPM[folowIndex]
            //         .priceInAM.text.isNotEmpty
            //     ?
            !show
                ? Stack(
                    children: [
                      TextFormField(
                        controller: widget.priceTextEditingController,
                        //'${pricesInAMAndPM.priceInAM!.text} \$',
                        textAlign: TextAlign.center,
                        readOnly: !widget.isAdmin,
                        keyboardType: TextInputType.number,
                        // focusNode: pricesInAMAndPM.focusNodeAM,
                        onChanged: (value){
                          setState(() {

                          });
                        },

                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsetsDirectional.only(top: -5, end: 18),
                          // contentPadding: EdgeInsetsDirectional.all(15),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: scaffoldBackGround, width: 0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: scaffoldBackGround, width: 0)),
                        ),
                        style: GoogleFonts.indieFlower(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 7),
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          '\$ ',
                          style: GoogleFonts.indieFlower(
                              fontSize: 17.5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      Get.focusScope!.unfocus();
                      // controller.statusPricesOfAMControllers[
                      // folowIndex] = true;
                      //Get.focusScope!.unfocus();
                      Future.delayed(Duration(milliseconds: 10), () {
                        // Get.focusScope!.requestFocus(controller.listPricesOfAMAndPM[folowIndex].focusNode);
                        // Get.focusScope!.requestFocus(widget.focusNode);


                        setState(() {
                          show = !show;
                        });
                        //FocusScope.of(context).requestFocus(widget.focusNode);
                        // setState(() {
                        //   // show = true;
                        // });
                      });
                      Get.focusScope!.requestFocus(widget.focusNode);
                    },
                    // FocusScope.of(context).requestFocus(pricesInAMAndPM.focusNode);

                    // for (int i = 0;
                    // i <
                    //     controller
                    //         .statusPricesOfAMControllers.length;
                    // i++) {
                    //   if (i != folowIndex) {
                    //     controller.statusPricesOfAMControllers[i] =
                    //     false;
                    //   }
                    //   controller.statusPricesOfPMControllers[i] = false;
                    // }
                    // },
                    child: SvgPicture.asset(
                      'assets/images/bi_plus-square-dotted.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
      ),
    );
  }
}
