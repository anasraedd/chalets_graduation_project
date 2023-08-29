import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/sub_facilities.dart';
import 'package:chalets/screens/app_admin/select_chalet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:image_picker/image_picker.dart';

class AddFacilitiesChaletScreen extends StatefulWidget {
  late bool edit;

  AddFacilitiesChaletScreen({this.edit = false});

  @override
  State<AddFacilitiesChaletScreen> createState() =>
      _AddFacilitiesChaletScreenState();
}

class _AddFacilitiesChaletScreenState extends State<AddFacilitiesChaletScreen>
    with Helpers {
  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
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
                      'Facilities',
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
          GetX<CreateChaletGetxController>(
              init: CreateChaletGetxController(),
              builder: (CreateChaletGetxController controller) {
                return Container(
                    margin: EdgeInsets.only(top: 100.h),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35.h,
                          ),
                          SvgPicture.asset(
                              'assets/images/icon-park-outline_protect.svg'),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            localization.tr('Reservation_of_chalet'),
                            style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            localization.tr('options_chalet_addition'),
                            style: GoogleFonts.inter(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w400,
                                color: secondaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    localization.tr('Main Facilities'),
                                    style: GoogleFonts.inter(
                                        fontSize: 14.5.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.mainFacilities
                                        .add(TextEditingController(text: ''));
                                    // insert(controller.mainFacilities.length-1, TextEditingController(text: ''));
                                    //
                                    controller.subFacilities
                                        .add(SubFacilities());
                                    controller.textTerms.add('');
                                    showSnackBarByGet(
                                        title:
                                            'To delete a specific item, drag it to the right until the delete icon appears');
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 65.w,
                                    decoration: BoxDecoration(
                                        color: customButtonColor,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Center(
                                      child: Text(
                                        localization.tr('add'),
                                        style: GoogleFonts.inter(
                                            fontSize: 12.5.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.mainFacilities.value.length,
                              itemBuilder: (context, index) {
                                return GetX<CreateChaletGetxController>(
                                    init: CreateChaletGetxController(),
                                    builder: (CreateChaletGetxController
                                        controller) {
                                      return Row(children: [
                                        Visibility(
                                            visible: controller.isSwipe.value &&
                                                controller.indexSwipe.value ==
                                                    index,
                                            child: Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      end: 50.w),
                                              child: IconButton(
                                                  onPressed: () {
                                                    controller.mainFacilities
                                                        .removeAt(index);
                                                    controller.textTerms
                                                        .removeAt(index);
                                                    controller.isSwipe.value =
                                                        false;
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  )),
                                            )),
                                        Expanded(
                                            child: GestureDetector(
                                          onHorizontalDragStart: (details) {
                                            controller.startX.value =
                                                details.localPosition.dx;
                                          },
                                          onHorizontalDragUpdate: (details) {
                                            final currentX =
                                                details.localPosition.dx;
                                            final deltaX = currentX -
                                                controller.startX.value;

                                            if (deltaX <
                                                -controller
                                                    .swipeThreshold.value) {
                                              controller.isSwipe.value = false;
                                              controller.indexSwipe.value =
                                                  index;
                                              // Swipe left detected
                                              //print('kldmvkldmsvkl');
                                              // setState(() {
                                              //   idMassageIsShow = widget.messages[index].idMessage;
                                              // });
                                              // widget.onSwipeLeft();
                                            }

                                            if (deltaX >
                                                controller
                                                    .swipeThreshold.value) {
                                              controller.indexSwipe.value =
                                                  index;
                                              controller.isSwipe.value = true;
                                            }
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsetsDirectional.symmetric(
                                                    horizontal: 25.w,
                                                    vertical: 10.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(7.r)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                // Icon(Icons.highlight_remove_sharp, color: Colors.red,),
                                                // Container(
                                                //   height: 27,
                                                //   width: 27,
                                                //   decoration: BoxDecoration(
                                                //       color: Colors.red,
                                                //       shape: BoxShape.circle),
                                                //   child: Center(
                                                //       child: Icon(
                                                //     Icons.clear,
                                                //     color: scaffoldBackGround,
                                                //   )),
                                                // ),
                                                Container(
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(top: 10.h),
                                                    child: CustomTextFormField(
                                                      controller: controller
                                                          .mainFacilities
                                                          .value[index],
                                                      onChanged: (value) {
                                                        controller.textTerms
                                                                .value[index] =
                                                            controller
                                                                .mainFacilities
                                                                .value[index]
                                                                .text;
                                                      },
                                                      hint:
                                                          // localization.tr('')
                                                          "There are many variations of passages of Lorem",
                                                      isEnable: true,
                                                      prefix: Icon(
                                                        Icons.circle,
                                                        color: Colors.black,
                                                        size: 10,
                                                      ),
                                                      context: context,
                                                      height: 40.h,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      hintStyle:
                                                          GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 13.sp,
                                                              color: const Color(
                                                                  0x80ABABAB)),
                                                    )),

                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          bottom: 10.w,
                                                          start: 30.w),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          localization
                                                              .tr('Sub-Facilities'),
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          //  controller.mainFacilities.add(TextEditingController(text: ''));
                                                          // insert(controller.mainFacilities.length-1, TextEditingController(text: ''));
                                                          //
                                                          controller
                                                              .subFacilities[
                                                                  index]
                                                              .listTextEditingControllers
                                                              .add(
                                                                  TextEditingController(
                                                                      text:
                                                                          ''));

                                                          controller.textTerms
                                                              .add('');
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          height: 25.h,
                                                          width: 65.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  customButtonColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r)),
                                                          child: Center(
                                                            child: Text(
                                                              localization
                                                                  .tr('add'),
                                                              style: GoogleFonts.inter(
                                                                  fontSize:
                                                                      12.5.sp,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    // height:
                                                    // controller.subFacilities
                                                    //         .value[index].length *
                                                    //     80.h,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(start: 45.w),
                                                    child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .subFacilities
                                                            .value[index]
                                                            .listTextEditingControllers
                                                            .length,
                                                        itemBuilder: (context,
                                                            subIndex) {
                                                          // if (subIndex == 0) {
                                                          //   return Padding(
                                                          //     padding: EdgeInsetsDirectional
                                                          //         .only(
                                                          //             bottom:
                                                          //                 10.w),
                                                          //     child: Row(
                                                          //       children: [
                                                          //         Expanded(
                                                          //           child: Text(
                                                          //             localization
                                                          //                 .tr('Sub-terms'),
                                                          //             style: GoogleFonts.inter(
                                                          //                 fontSize: 14.5
                                                          //                     .sp,
                                                          //                 fontWeight: FontWeight
                                                          //                     .w700,
                                                          //                 color:
                                                          //                     Colors.black),
                                                          //           ),
                                                          //         ),
                                                          //         InkWell(
                                                          //           onTap: () {
                                                          //             //  controller.mainFacilities.add(TextEditingController(text: ''));
                                                          //             // insert(controller.mainFacilities.length-1, TextEditingController(text: ''));
                                                          //             //
                                                          //             controller
                                                          //                 .subFacilities[
                                                          //                     index]
                                                          //                 .add(TextEditingController(
                                                          //                     text: ''));
                                                          //             controller
                                                          //                 .textTerms
                                                          //                 .add(
                                                          //                     '');
                                                          //             setState(
                                                          //                 () {});
                                                          //           },
                                                          //           child:
                                                          //               Container(
                                                          //             height:
                                                          //                 25.h,
                                                          //             width:
                                                          //                 65.w,
                                                          //             decoration: BoxDecoration(
                                                          //                 color:
                                                          //                     customButtonColor,
                                                          //                 borderRadius:
                                                          //                     BorderRadius.circular(5.r)),
                                                          //             child:
                                                          //                 Center(
                                                          //               child:
                                                          //                   Text(
                                                          //                 localization
                                                          //                     .tr('add'),
                                                          //                 style: GoogleFonts.inter(
                                                          //                     fontSize: 12.5.sp,
                                                          //                     color: Colors.white),
                                                          //               ),
                                                          //             ),
                                                          //           ),
                                                          //         ),
                                                          //       ],
                                                          //     ),
                                                          //   );
                                                          // } else {
                                                          return Row(children: [
                                                            Visibility(
                                                                visible: controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .isSwipeForSubFacilities
                                                                        .value &&
                                                                    controller
                                                                            .subFacilities[index]
                                                                            .indexSwipeForSubFacilities
                                                                            .value ==
                                                                        subIndex,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .only(
                                                                          end: 50
                                                                              .w),
                                                                  child:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              controller.subFacilities[index].listTextEditingControllers.removeAt(subIndex);
                                                                            });
                                                                            // controller
                                                                            //     .subFacilities
                                                                            //     .value[index].listTextEditingControllers.removeAt(subIndex);
                                                                            //[]
                                                                            // controller
                                                                            //     .subFacilities
                                                                            //     .value[index].removeAt(subIndex);
                                                                            // controller
                                                                            //     .subFacilities
                                                                            //     .removeAt(controller
                                                                            //     .subFacilities
                                                                            //     .value[index]
                                                                            // [subIndex]);
                                                                            // controller.textTerms
                                                                            //     .removeAt(index);
                                                                            controller.subFacilities[index].isSwipeForSubFacilities.value =
                                                                                false;
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            Icons.delete,
                                                                            color:
                                                                                Colors.red,
                                                                          )),
                                                                )),
                                                            Expanded(
                                                                child:
                                                                    GestureDetector(
                                                              onHorizontalDragStart:
                                                                  (details) {
                                                                controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .startXForSubFacilities
                                                                        .value =
                                                                    details
                                                                        .localPosition
                                                                        .dx;
                                                              },
                                                              onHorizontalDragUpdate:
                                                                  (details) {
                                                                final currentX =
                                                                    details
                                                                        .localPosition
                                                                        .dx;
                                                                final deltaX = currentX -
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .startXForSubFacilities
                                                                        .value;

                                                                if (deltaX <
                                                                    -controller
                                                                        .swipeThreshold
                                                                        .value) {
                                                                  setState(() {
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .isSwipeForSubFacilities
                                                                        .value = false;
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .indexSwipeForSubFacilities
                                                                        .value = subIndex;
                                                                  });

                                                                  // Swipe left detected
                                                                  //print('kldmvkldmsvkl');
                                                                  // setState(() {
                                                                  //   idMassageIsShow = widget.messages[index].idMessage;
                                                                  // });
                                                                  // widget.onSwipeLeft();
                                                                }

                                                                if (deltaX >
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .swipeThresholdForSubFacilities
                                                                        .value) {
                                                                  setState(() {
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .indexSwipeForSubFacilities
                                                                        .value = subIndex;
                                                                    controller
                                                                        .subFacilities[
                                                                            index]
                                                                        .isSwipeForSubFacilities
                                                                        .value = true;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  CustomTextFormField(
                                                                controller: controller
                                                                    .subFacilities
                                                                    .value[
                                                                        index]
                                                                    .listTextEditingControllers[subIndex],
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                          .textTerms
                                                                          .value[index] =
                                                                      controller
                                                                          .mainFacilities
                                                                          .value[
                                                                              index]
                                                                          .text;
                                                                },
                                                                hint:
                                                                    // localization.tr('')
                                                                    "There are many variations of passages of Lorem",
                                                                isEnable: true,
                                                                prefix: Icon(
                                                                  Icons.circle,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 10,
                                                                ),
                                                                context:
                                                                    context,
                                                                height: 40.h,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                hintStyle: GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: const Color(
                                                                        0x80ABABAB)),
                                                              ),
                                                            )),
                                                          ]);
                                                          // }
                                                        })),
                                                SizedBox(
                                                  height: 20.h,
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                      ]);
                                    });

                                // Dismissible(
                                //   direction: DismissDirection.startToEnd,
                                //
                                //     key: Key(terms[index]), // يجب توفير مفتاح فريد لكل عنصر في القائمة
                                //     background: Container(
                                //     color: scaffoldBackGround, // لون الخلفية عند السحب
                                //     child: Align(
                                //         alignment: AlignmentDirectional.centerStart,
                                //         child: Icon(Icons.delete, color: Colors.red,)), // أيقونة الحذف
                                //     ),
                                //     // onDismissed: (direction) {
                                //     // //  terms.removeAt(index);
                                //     //
                                //     // // تعامل مع حدث السحب والحذف هنا
                                //     // // يمكنك إزالة العنصر من القائمة أو اتخاذ أي إجراء آخر
                                //     // },
                                //     child:
                                //     ,

                                // });
                              }),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    )
                    // }),
                    );
              }),
          // Align(
          //   // bottom: 25.h,
          //   alignment: AlignmentDirectional.bottomEnd,
          //
          //   child: GestureDetector(
          //     onTap: () {
          //       print('next');
          //       // _performUpload();
          //       Get.toNamed('/add_images_chalet_screen');
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
          // ),
        ]),

        // Align(
        //   // bottom: 25.h,
        //   alignment: AlignmentDirectional.bottomEnd,
        //
        //   child: GestureDetector(
        //     onTap: (){
        //       print('next');
        //       _performUpload();
        //
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
        //
        //
        //       ),
        //     ),
        //   ),
        //
        // ),
        //   ],
        // ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.edit ? Container():  GestureDetector(
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
               if( widget.edit){
                 _performEditFacilitiesChalet();

               }else{
                 _performCreateChalet();

               }
              },
              child: Container(
                // height: 85.w,
                //  width: 80.w,
                   margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),child: SvgPicture.asset('assets/icons/btn_go.svg', ))

              // Container(
              //   margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
              //   decoration: const BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/icons/FTBPK.png"),
              //           fit: BoxFit.cover)),
              //   padding: EdgeInsets.only(bottom: 8.h),
              //   height: 70.h,
              //   width: 70.w,
              //   child: Transform.flip(
              //     child: Icon(
              //       Icons.arrow_back_outlined,
              //       size: 33.r,
              //       color: Colors.white,
              //     ),
              //     flipX: true,
              //   ),
              // ),
            ),
          ],
        ),
      ],
    );
  }

  void _performCreateChalet() async {
    if (checkData()) {
      showLoadingDialog(context);
      print('lat: ${CreateChaletGetxController.to.latitude.value}');
      print('lat: ${CreateChaletGetxController.to.longitude.value}');

      ApiResponse result = await CreateChaletGetxController.to.createChalet();
      // print('lat: ${CreateChaletGetxController.to.latitude.value}');

      if (result.success) {
        Get.offAll(SelectChaletScreen());
      }
// Get.toNamed('add_facilities_chalet_screen');
    }
  }

  void _performEditFacilitiesChalet() async {
    if (checkData()) {
      showLoadingDialog(context);
      ApiResponse result = await CreateChaletGetxController.to.updateFacilitiesChalet(icon: CreateChaletGetxController.to.imageFiles[0].path);

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
    }
  }

  bool checkData() {
    // if(CreateChaletGetxController.to.listPricesOfAMAndPM.isNotEmpty){

    if (CreateChaletGetxController.to.mainFacilities.isNotEmpty) {
      var result = true;
      for (int i = 0;
          i < CreateChaletGetxController.to.mainFacilities.length;
          i++) {
        if (!CreateChaletGetxController.to.mainFacilities[i].text.isNotEmpty) {
          showSnackBarByGet(
              title: 'Enter the missing main facilites', error: true);

          result = false;
          break;
        } else {
          for (int j = 0;
              j <
                  CreateChaletGetxController
                      .to.subFacilities[i].listTextEditingControllers.length;
              j++) {
            if (!CreateChaletGetxController.to.subFacilities.value[i]
                .listTextEditingControllers[j].text.isNotEmpty) {
              showSnackBarByGet(title: 'Enter the sub facilites', error: true);

              result = false;
              break;
            }
          }
        }
      }
      // if(!result){
      //
      // }
      return result;
    }

    showSnackBarByGet(title: 'Enter main facilites', error: true);

    //  }

    return false;
  }
}
