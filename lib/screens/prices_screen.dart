import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/featuers/Auth/presentation/widgets/custom_text_field.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet/chalet_prices.dart';
import 'package:chalets/models/prices_in_am_and_pm.dart';
import 'package:chalets/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_admin/add_facilities_chalet_screen.dart';

class PricesScreen extends StatefulWidget {
  late bool isAdmin;
  late ChaletPrices? chaletPrices;
  late bool isEdit;
  late bool isAdd;


  PricesScreen({this.isAdmin = true,this.chaletPrices, this.isEdit = false, this.isAdd =false});

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> with Helpers{
  final createChaletGetxController = Get.lazyPut<CreateChaletGetxController>(
          () => CreateChaletGetxController());


  // late TextEditingController saturdayAmTextController;
  // late TextEditingController saturdayPmTextController;
  // late TextEditingController sundayAmTextController;
  // late TextEditingController sundayPmTextController;

  // late ChaletPrices chaletPrices;

  List<PricesOfAMAndPM> listPricesOfAMAndPM = [];


  void initState() {
    // chaletPrices = widget.chaletPrices;
    if(widget.chaletPrices != null ){
      CreateChaletGetxController.to.listPricesOfAMAndPM.value = [ PricesOfAMAndPM(
          dayName: lang.tr('saturday'),
          priceInAM: TextEditingController(text: widget.chaletPrices!.saturdayAm),
          priceInPM: TextEditingController(text: widget.chaletPrices!.saturdayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('sunday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.sundayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.sundayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('monday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.mondayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.mondayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('thesday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.thursdayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.thursdayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('wednesday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.wednesdayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.saturdayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('thursday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.tuesdayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.tuesdayPm)),
        PricesOfAMAndPM(
            dayName: lang.tr('friday'),
            priceInAM: TextEditingController(text: widget.chaletPrices!.fridayAm),
            priceInPM: TextEditingController(text: widget.chaletPrices!.fridayPm)),
      ];
    }

    // saturdayAmTextController =
    //     TextEditingController(text: widget.chaletPrices.saturdayAm);
    //
    //
    // saturdayPmTextController =
    //     TextEditingController(text: widget.chaletPrices.saturdayPm);
    //
    // sundayAmTextController =
    //     TextEditingController(text: widget.chaletPrices.sundayAm);
    // sundayPmTextController =
    //     TextEditingController(text: widget.chaletPrices.sundayPm);
    super.initState();
    // CreateChaletGetxController.to.listPricesOfAMAndPM.value.addAll(listPricesOfAMAndPM);
    // CreateChaletGetxController.to.listPricesOfAMAndPM.value = listPricesOfAMAndPM.map((e) => e).toList();
    // listPricesOfAMAndPM.forEach((element) {
    //   if(element.dayName == 'saturday'){
    //
    //   }
    // });
  }



  @override
  Widget build(BuildContext context) {
    // context.settingsStatusBarInScreen(isDark: false, color: Colors.transparent);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
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
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            MyFlutterApp.back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Stack(
        children: [

          Padding(
            padding: EdgeInsets.only(top: 80.h, right: 45.w, left: 45.w),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                          // widget.isAdmin
                          //     ?
                          CreateChaletGetxController
                              .to.listPricesOfAMAndPM.length,
                              //: listPricesOfAMAndPM.length,
                          itemBuilder: (context, index) {
                            //  if(CreateChaletGetxController.to.listPricesOfAMAndPM.value[index].priceInAM != null){
                            return
                              // widget.chaletPrices == null
                              //   ?
                              Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: PricesInAMAndPM(
                                pricesInAMAndPM: CreateChaletGetxController
                                    .to.listPricesOfAMAndPM.value[index],
                                isAdmin: widget.isAdmin,
                                isAdd: widget.isAdd,
                                isEdit: widget.isEdit,
                                folowIndex: index,

                              ),
                            );
                            //     : Padding(
                            //   padding: EdgeInsets.only(bottom: 5.h),
                            //   child: GestureDetector(
                            //     onTap: () {},
                            //     child: PricesInAMAndPM(
                            //       pricesInAMAndPM: listPricesOfAMAndPM[index],
                            //       folowIndex: index,
                            //       isEdit: widget.isEdit,
                            //
                            //     ),
                            //   ),
                            // );
                            //   }else{
                            //     return AddNewImageWidget();
                            //  }
                          }),
                    ),
                    SizedBox(height: 30,),
                    // Stack(
                    //   children: [
                    //
                    //   ],
                    // )


                    // CustomTextField(hint: 'Enter price', keyboardType: TextInputType.number, context: context, controller: CreateChaletGetxController.to.listPricesOfAMAndPM[CreateChaletGetxController.to.indexFocus.value].priceInAM)
                  ],
                ),
              ),
            ),
          ),
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

          // widget.isAdmin ?  Align(
          //   // bottom: 25.h,
          //   alignment: AlignmentDirectional.bottomStart,
          //
          //   child: GestureDetector(
          //     onTap: () {
          //       print('prev');
          //       Get.back();
          //     },
          //     child: Container(
          //       margin: EdgeInsetsDirectional.only(bottom: 25.h, start: 25.w),
          //       decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("assets/icons/FTBPK.png"),
          //               fit: BoxFit.cover)),
          //       padding: EdgeInsets.only(bottom: 8.h),
          //       height: 70.h,
          //       width: 70.w,
          //       child: Icon(
          //         Icons.arrow_back_outlined,
          //         size: 33.r,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ):Container(),
          // widget.isAdmin ? Align(
          //   // bottom: 25.h,
          //   alignment: AlignmentDirectional.bottomEnd,
          //
          //   child: GestureDetector(
          //     onTap: () {
          //       print('next');
          //       _performSetPrices();
          //     },
          //     child: Container(
          //       margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
          //       decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("assets/icons/FTBPK.png"),
          //               fit: BoxFit.cover)),
          //       padding: EdgeInsets.only(bottom: 8.h),
          //       height: 70.h,
          //       width: 70.w,
          //       child: Transform.flip(
          //         child: Icon(
          //           Icons.arrow_back_outlined,
          //           size: 33.r,
          //           color: Colors.white,
          //         ),
          //         flipX: true,
          //       ),
          //     ),
          //   ),
          // ):Container(),
          widget.isEdit ? Align(
            // bottom: 25.h,
            alignment: AlignmentDirectional.bottomEnd,

            child: GestureDetector(
              onTap: () {
                print('next');
                _performEditPrices();
                // _editImages();
              },
              child: Padding(
                padding:  EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
                child: SvgPicture.asset('assets/icons/btn_go.svg'),
              ),
            ),
          ): Container(),
        ],
      ),

      persistentFooterAlignment: AlignmentDirectional.bottomCenter,

      persistentFooterButtons:   [
        !widget.isAdd ? Container() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print('prev');
                Get.back();
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 25.h, start: 25.w),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/FTBPK.png"),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.only(bottom: 8.h),
                height: 70.h,
                width: 70.w,
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 33.r,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('next');
                _performSetPrices();
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/FTBPK.png"),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.only(bottom: 8.h),
                height: 70.h,
                width: 70.w,
                child: Transform.flip(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 33.r,
                    color: Colors.white,
                  ),
                  flipX: true,
                ),
              ),
            ),
          ],
        )  ,



      ],
    );
  }

 void _performSetPrices(){
    if(checkData()){
// Get.toNamed('add_facilities_chalet_screen');
    Get.to(AddFacilitiesChaletScreen());
    }
 }

  void _performEditPrices() async {
    if(checkData()){
      showLoadingDialog(context);
      ApiResponse result = await AdminChaletsApiController().edaitPricesChalet(chaletId: AdminChaletsGetxController.to.chaletForManage.value.id,
        pricesSaturdayAm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[0].priceInAM!.text}'),
        pricesSaturdayPm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[0].priceInPM!.text}'),
        pricesSundayAm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[1].priceInAM!.text}'),
        pricesSundayPm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[1].priceInPM!.text}'),
        pricesMondayAm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[2].priceInAM!.text}'),
        pricesMondayPm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[2].priceInPM!.text}'),
        pricesTuesdayAm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[3].priceInAM!.text}'),
        pricesTuesdayPm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[3].priceInPM!.text}'),
        pricesWednesdayAm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[4].priceInAM!.text}'),
        pricesWednesdayPm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[4].priceInPM!.text}'),
        pricesThursdayAm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[5].priceInAM!.text}'),
        pricesThursdayPm:
        double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[5].priceInPM!.text}'),
        pricesFridayAm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[6].priceInAM!.text}'),
        pricesFridayPm: double.parse('${CreateChaletGetxController.to.listPricesOfAMAndPM[6].priceInPM!.text}'),);

      //edaitImagesChalet(chaletId: AdminChaletsGetxController.to.chaletForManage.value.id,imageFiles:CreateChaletGetxController.to.imageFiles);
      if(result.success){

        AdminChaletsGetxController.to.getchaletToManage(id: AdminChaletsGetxController.to.chaletForManage.value.id);

        Get.back();
        Get.back();

        showSnackBarByGet(title: result.message, error: !result.success);


      }else{
        Get.back();

        showSnackBarByGet(title: result.message, error: !result.success);

      }
// Get.toNamed('add_facilities_chalet_screen');
//       Get.to(AddFacilitiesChaletScreen());
    }
  }


 bool checkData(){
    // if(CreateChaletGetxController.to.listPricesOfAMAndPM.isNotEmpty){
      var result = true;
      for(int i =0; i<CreateChaletGetxController.to.listPricesOfAMAndPM.length; i++){

          if(!CreateChaletGetxController.to.listPricesOfAMAndPM[i].priceInAM!.text.isNotEmpty || !CreateChaletGetxController.to.listPricesOfAMAndPM[i].priceInPM!.text.isNotEmpty  ){
            result = false;
            break;

          }
        }
      if(!result){
        showSnackBarByGet(title: 'Enter the missing Price', error: true);
      }
        return result;
    //  }


   // return false;
 }

}

enum Period { AM, PM }

class PricesInAMAndPM extends StatelessWidget {
  final PricesOfAMAndPM pricesInAMAndPM;
  Period? focusPeriod;
  late bool isAdmin;
  late int folowIndex;
  late bool isEdit;
  late bool isAdd;


  bool exsistPriceInAM2 = false;

  PricesInAMAndPM({required this.pricesInAMAndPM,
    this.isAdmin = false,
    this.isEdit = false,
    this.isAdd = false,
    required this.folowIndex,});

  @override
  Widget build(BuildContext context) {
    return GetX<CreateChaletGetxController>(
        init: CreateChaletGetxController(),
        builder: (CreateChaletGetxController controller) {
          return Row(
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
                    pricesInAMAndPM.dayName,
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
              Container(
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: scaffoldBackGround,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(8.r),
                        topEnd: Radius.circular(8.r)),
                    border: Border.all(color: secondaryColor, width: 3)),
                child: Center(
                  child:
                  controller.statusPricesOfAMControllers[folowIndex] ||
                      controller.listPricesOfAMAndPM[folowIndex]
                          .priceInAM!.text.isNotEmpty || !isAdmin
                      ? Stack(
                    children: [
                      TextFormField(
                        controller: pricesInAMAndPM.priceInAM,
                        //'${pricesInAMAndPM.priceInAM!.text} \$',
                        textAlign: TextAlign.center,
                        readOnly: isEdit ? !isEdit : isAdd ? !isAdd: true,
                        keyboardType: TextInputType.number,
                        focusNode: pricesInAMAndPM.focusNodeAM,

                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(
                              top: -5, end: 18),
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
                        child: Text('\$ ', style: GoogleFonts.indieFlower(
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
                      controller.statusPricesOfAMControllers[
                      folowIndex] = true;
                      //Get.focusScope!.unfocus();
                      Future.delayed(Duration(milliseconds: 10), () {
                        // Get.focusScope!.requestFocus(controller.listPricesOfAMAndPM[folowIndex].focusNode);
                        Get.focusScope!.requestFocus(pricesInAMAndPM
                            .focusNodeAM);
                      });
                      // FocusScope.of(context).requestFocus(pricesInAMAndPM.focusNode);

                      for (int i = 0;
                      i <
                          controller
                              .statusPricesOfAMControllers.length;
                      i++) {
                        if (i != folowIndex) {
                          controller.statusPricesOfAMControllers[i] =
                          false;
                        }
                        controller.statusPricesOfPMControllers[i] = false;
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/images/bi_plus-square-dotted.svg',
                      height: 20,
                      width: 20,
                    ),
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
                    color: scaffoldBackGround,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(8.r),
                        topEnd: Radius.circular(8.r)),
                    border: Border.all(color: secondaryColor, width: 3)),
                child: Center(
                  child:
                  //  exsistPriceInPM ?
                  controller.statusPricesOfPMControllers[folowIndex] ||
                      controller.listPricesOfAMAndPM[folowIndex]
                          .priceInPM!.text.isNotEmpty || !isAdmin
                      ? //priceInPM.text.isNotEmpty?
                  Stack(
                    children: [
                      TextFormField(
                        controller: pricesInAMAndPM.priceInPM,
                        textAlign: TextAlign.center,
                        readOnly: isEdit ? !isEdit : isAdd ? !isAdd: true ,
                        keyboardType: TextInputType.number,


                        focusNode: pricesInAMAndPM.focusNodePM,
                        decoration: InputDecoration(

                          //  suffixText: '\$', // رمز الدولار
                          //  suffixIcon: Icon(Icons.dangerous_sharp),
                          //   suffix: Text('\$', style: GoogleFonts.indieFlower(
                          //       fontSize: 17.5.sp,
                          //       fontWeight: FontWeight.w400,
                          //       color: Colors.black),),


                          //suffixIcon: Icon(FontAwesome5.shekel_sign),,
                          contentPadding: EdgeInsetsDirectional.only(
                              top: -5, end: 20),
                          //                      contentPadding: EdgeInsetsDirectional.all(15),


                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: scaffoldBackGround, width: 0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: scaffoldBackGround, width: 0)),
                        ),
                        // '${pricesInAMAndPM.priceInPM!.text} \$',
                        style: GoogleFonts.indieFlower(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 7),

                        alignment: AlignmentDirectional.centerEnd,
                        child: Text('\$ ', style: GoogleFonts.indieFlower(
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
                      controller.statusPricesOfPMControllers[
                      folowIndex] = true;
                      //Get.focusScope!.unfocus();
                      Future.delayed(Duration(milliseconds: 10), () {
                        // Get.focusScope!.requestFocus(controller.listPricesOfAMAndPM[folowIndex].focusNode);
                        Get.focusScope!.requestFocus(pricesInAMAndPM
                            .focusNodePM);
                      });
                      // FocusScope.of(context).requestFocus(pricesInAMAndPM.focusNode);

                      for (int i = 0;
                      i <
                          controller
                              .statusPricesOfPMControllers.length;
                      i++) {
                        if (i != folowIndex) {
                          controller.statusPricesOfPMControllers[i] =
                          false;
                        }
                        controller.statusPricesOfAMControllers[i] =
                        false;
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/images/bi_plus-square-dotted.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
