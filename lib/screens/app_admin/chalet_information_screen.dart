import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/create_chalet.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChaletInformationScreen extends StatefulWidget  {
  late bool edit;


  ChaletInformationScreen({this.edit = false});

  @override
  State<ChaletInformationScreen> createState() => _ChaletInformationScreenState();
}

class _ChaletInformationScreenState extends State<ChaletInformationScreen> with Helpers{
  // TextEditingController nameChaletController = TextEditingController();
  late ImagePicker _imagePicker;

  XFile? _pickedImage;

  @override
  void initState() {
    _imagePicker = ImagePicker();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 100.h,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/app_bar.svg'),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Information',
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
            Container(
              margin: EdgeInsets.only(top: 100.h),
              child: GetX<CreateChaletGetxController>(
                  init: CreateChaletGetxController(),
                  builder: (CreateChaletGetxController controller) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 21.h,
                          ),

                          Container(
                            height: 97.w,
                            width: 97.w,
                            child: Stack(
                              children: [
                                Container(
                                  // margin: EdgeInsetsDirectional.symmetric(
                                  //     horizontal: 10.w),
                                  clipBehavior: Clip.hardEdge,
                                  height: 85.w,
                                  width: 85.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                  controller.isPickedImage.isTrue
                                      ?
                                  Image.file(
                                    controller.pickedImage!.value,
                                    height: 85.w,
                                    width: 85.w,
                                    fit: BoxFit.cover,

                                  ): controller.logo.isNotEmpty ?  CachedNetworkImage(
                                      height: 75.w,
                                      width: 75.w,
                                      // height: 228.0,
                                      imageUrl:  '${controller.logo}' ,//'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
                                      //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                                      fit: BoxFit.fill,

                                      placeholder: (context, url) =>
                                          SpinKitFadingCircle(
                                            color: Colors.grey.shade500,
                                            size: 50.0,
                                          ),
                                      errorWidget: (context, url, error) =>  Center(child: Icon(Icons.account_circle, size: 75.w, color: primaryColor,))
                                  )
                                     : Center(child: Icon(Icons.account_circle, size: 85.w, color: primaryColor,))
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                    height: 34,
                                    width: 34,
                                    alignment: AlignmentDirectional.bottomEnd,
                                    margin:
                                     EdgeInsetsDirectional.only(top: 45, start: 43),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: CustomTextFormField(
                              controller: controller.nameChaletController,
                              hint: localization.tr('name_of_your_chalet'),
                              isEnable: true,
                              context: context,
                              keyboardType: TextInputType.text,
                              hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: const Color(0x80ABABAB)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: CustomTextFormField(
                              controller: controller.descriptionChaletController,
                              hint:
                                  localization.tr('description_of_your_chalet'),
                              height: 124,
                              isEnable: true,
                              context: context,
                              keyboardType: TextInputType.text,
                              hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: const Color(0x80ABABAB)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 25.w, left: 25.w, top: 9.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: controller.spaceChaletController,
                                    hint: localization
                                        .tr('chalet_space_by_meter'),
                                    isEnable: true,
                                    context: context,
                                    keyboardType: TextInputType.number,
                                    hintStyle: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        color: const Color(0x80ABABAB)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.5.w,
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: controller.addressChaletController,
                                    hint: localization.tr('chalet_address'),
                                    isEnable: true,
                                    prefix: Icon(
                                      Icons.gps_fixed,
                                      color: primaryColor,
                                    ),
                                    context: context,
                                    keyboardType: TextInputType.text,
                                    hintStyle: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        color: const Color(0x80ABABAB)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    localization.tr('property_terms'),
                                    style: GoogleFonts.inter(
                                        fontSize: 14.5.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.textEditingControllerTerms
                                        .add(TextEditingController(text: ''));
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
                            height: 10.h,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                  .textEditingControllerTerms.value.length,
                              itemBuilder: (context, index) {
                                return GetX<CreateChaletGetxController>(
                                    init: CreateChaletGetxController(),
                                    builder: (CreateChaletGetxController
                                        controller) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.w),
                                        child: Row(
                                          children: [
                                            Visibility(
                                                visible:
                                                    controller.isSwipe.value &&
                                                        controller.indexSwipe
                                                                .value ==
                                                            index,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(end: 50.w),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .textEditingControllerTerms
                                                            .removeAt(index);
                                                        controller.textTerms
                                                            .removeAt(index);
                                                        controller.isSwipe
                                                            .value = false;
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )),
                                                )),
                                            Expanded(
                                              child: GestureDetector(
                                                onHorizontalDragStart:
                                                    (details) {
                                                  controller.startX.value =
                                                      details.localPosition.dx;
                                                },
                                                onHorizontalDragUpdate:
                                                    (details) {
                                                  final currentX =
                                                      details.localPosition.dx;
                                                  final deltaX = currentX -
                                                      controller.startX.value;

                                                  if (deltaX <
                                                      -controller.swipeThreshold
                                                          .value) {
                                                    controller.isSwipe.value =
                                                        false;
                                                    controller.indexSwipe
                                                        .value = index;
                                                    // Swipe left detected
                                                    //print('kldmvkldmsvkl');
                                                    // setState(() {
                                                    //   idMassageIsShow = widget.messages[index].idMessage;
                                                    // });
                                                    // widget.onSwipeLeft();
                                                  }

                                                  if (deltaX >
                                                      controller.swipeThreshold
                                                          .value) {
                                                    controller.indexSwipe
                                                        .value = index;
                                                    controller.isSwipe.value =
                                                        true;
                                                  }
                                                },
                                                child: CustomTextFormField(
                                                  controller: controller
                                                      .textEditingControllerTerms
                                                      .value[index],
                                                  onChanged: (value) {
                                                    // controller.textTerms
                                                    //         .value[index] =
                                                    //     controller
                                                    //         .textEditingControllerTerms
                                                    //         .value[index]
                                                    //         .text;
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
                                                  hintStyle: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13.sp,
                                                      color: const Color(
                                                          0x80ABABAB)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

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
                                      );
                                    });
                              }),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    localization.tr('policis'),
                                    style: GoogleFonts.inter(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.textEditingControllerPolicy
                                        .add(TextEditingController(text: ''));
                                    controller.textPolicy.add('');
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
                            height: 10.h,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                  .textEditingControllerPolicy.value.length,
                              itemBuilder: (context, index) {
                                return GetX<CreateChaletGetxController>(
                                    init: CreateChaletGetxController(),
                                    builder: (CreateChaletGetxController
                                        controller) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.w),
                                        child: Row(
                                          children: [
                                            Visibility(
                                                visible: controller
                                                        .isSwipePolicy.value &&
                                                    controller.indexSwipePolicy
                                                            .value ==
                                                        index,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(end: 50.w),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .textEditingControllerPolicy
                                                            .removeAt(index);
                                                        controller.textPolicy
                                                            .removeAt(index);
                                                        controller.isSwipePolicy
                                                            .value = false;
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )),
                                                )),
                                            Expanded(
                                              child: GestureDetector(
                                                onHorizontalDragStart:
                                                    (details) {
                                                  controller
                                                          .startXPolicy.value =
                                                      details.localPosition.dx;
                                                },
                                                onHorizontalDragUpdate:
                                                    (details) {
                                                  final currentX =
                                                      details.localPosition.dx;
                                                  final deltaX = currentX -
                                                      controller
                                                          .startXPolicy.value;

                                                  if (deltaX <
                                                      -controller
                                                          .swipeThresholdPolicy
                                                          .value) {
                                                    controller.isSwipePolicy
                                                        .value = false;
                                                    controller.indexSwipePolicy
                                                        .value = index;
                                                    // Swipe left detected
                                                    //print('kldmvkldmsvkl');
                                                    // setState(() {
                                                    //   idMassageIsShow = widget.messages[index].idMessage;
                                                    // });
                                                    // widget.onSwipeLeft();
                                                  }

                                                  if (deltaX >
                                                      controller
                                                          .swipeThresholdPolicy
                                                          .value) {
                                                    controller.indexSwipePolicy
                                                        .value = index;
                                                    controller.isSwipePolicy
                                                        .value = true;
                                                  }
                                                },
                                                child: CustomTextFormField(
                                                  controller: controller
                                                      .textEditingControllerPolicy
                                                      .value[index],
                                                  onChanged: (value) {
                                                    controller.textPolicy
                                                            .value[index] =
                                                        controller
                                                            .textEditingControllerPolicy
                                                            .value[index]
                                                            .text;
                                                  },
                                                  hint:
                                                      // localization.tr('There are many variations of passages of Lorem'),
                                                      'There are many variations of passages of Lorem',
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
                                                  hintStyle: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13.sp,
                                                      color: const Color(
                                                          0x80ABABAB)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

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
                                      );
                                    });
                              }),
                        ],
                      ),
                    );
                  }),
            ),
            widget.edit ?  Align(
              // bottom: 25.h,
              alignment: AlignmentDirectional.bottomEnd,

              child: GestureDetector(
                  onTap: () {
                    print('next');
                    _performEditChaletInformation();
                  },
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
                    child: SvgPicture.asset('assets/icons/btn_go.svg'),
                  )
                // Container(
                //   margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
                //   decoration: const BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/icons/FTBPK.png"),
                //           fit: BoxFit.cover)),
                //   padding: EdgeInsets.only(bottom: 8.h),
                //   height: 70.h,
                //   width: 70.w,
                //   child: Icon(
                //     Icons.check_sharp,
                //     size: 33.r,
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ): Align(
              // bottom: 25.h,
              alignment: AlignmentDirectional.bottomEnd,

              child: GestureDetector(
                onTap: () {
                  print('next');
                  _performNextStepOfCreateChalet();
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
            ),



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
          ],
        ),
      ),
    );
  }

  void _performNextStepOfCreateChalet(){
    if(checkDate()){

      Get.toNamed('/add_images_chalet_screen');
    }

  }

  void _performEditChaletInformation() async {
    if(checkDate()){
      showLoadingDialog(context);
      // _updateChaletInformation();
      ApiResponse result = await CreateChaletGetxController.to.updateChaletInformation();
      if(result.success){
        AdminChaletsGetxController.to.getchaletToManage(id: AdminChaletsGetxController.to.chaletForManage.value.id);

        Get.back();
        Get.back();

        showSnackBarByGet(title: result.message, error: !result.success);


      }else{
        Get.back();

        showSnackBarByGet(title: result.message, error: !result.success);

      }

    }

  }


  bool checkDate(){
    if(CreateChaletGetxController.to.nameChaletController.text.isNotEmpty &&
        CreateChaletGetxController.to.descriptionChaletController.text.isNotEmpty &&
    CreateChaletGetxController.to.spaceChaletController.text.isNotEmpty &&
        CreateChaletGetxController.to.addressChaletController.text.isNotEmpty &&
        CreateChaletGetxController.to.textEditingControllerTerms.isNotEmpty &&
        CreateChaletGetxController.to.textEditingControllerPolicy.isNotEmpty

    ){
      if(CreateChaletGetxController.to.isPickedImage.isTrue || widget.edit){


        return true;
      }else{
        showSnackBarByGet(title: 'Enter logo for this chalet' , error: true);
        return false;
      }


    }
    showSnackBarByGet(title: 'Required data' , error: true);
    return false;
  }

  // void createChalet() async {
  void pickImage() async {
    final imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          //CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: primaryColor,
              toolbarWidgetColor: Colors.white,
              // cropFrameColor: Colors.blue,
              backgroundColor: scaffoldBackGround,
              cropGridColor: secondaryColor,
              activeControlsWidgetColor: primaryColor,
              initAspectRatio: CropAspectRatioPreset.ratio3x2,

              lockAspectRatio: true),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      // setState(() {
      CreateChaletGetxController.to.pickedImage!.value = File(croppedFile!.path);
      CreateChaletGetxController.to.isPickedImage.value = true;
      // });
      // _upload(path: croppedFile!.path);

      // final savedFile = File(croppedFile!.path);

      //_pickedImage = imageFile;
      // showReviewToAddImageDialog(croppedFile as File);
      // if(index == -1){
      //   CreateChaletGetxController.to.imageFiles.add(savedFile);
      // }else{
      //   CreateChaletGetxController.to.imageFiles[index] = savedFile;
      //   CreateChaletGetxController.to.isAllowSelect.value = false;
      //   CreateChaletGetxController.to.selectedImageFiles.clear();
      // }
    }
  }




}
