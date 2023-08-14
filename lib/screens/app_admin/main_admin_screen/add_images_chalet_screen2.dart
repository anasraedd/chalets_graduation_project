// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
// import 'package:chalets/core/my_flutter_app_icons.dart';
// import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
// import 'package:chalets/get/create_chalet_getx_controller.dart';
// import 'package:chalets/models/api_response.dart';
// import 'package:chalets/models/chalet/chalet_images.dart';
// import 'package:chalets/models/chalet/chalet_prices.dart';
// import 'package:chalets/models/image_dynamic.dart';
// import 'package:chalets/screens/app_admin/view_pictures_for_admin_screen.dart';
// import 'package:chalets/screens/prices_screen.dart';
// import 'package:chalets/screens/view_pictures_screen.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/route_manager.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
//
// import 'package:chalets/core/theme/app_theme.dart';
// import 'package:chalets/core/utils/context_extetion.dart';
// import 'package:chalets/core/utils/helpers.dart';
// import 'package:chalets/widgets/add_new_image_widget.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:easy_localization/easy_localization.dart' as localization;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class AddImagesChaletScreen2 extends StatefulWidget {
//
//   late List<ImageDynamic> images;
//   late int chaletId;
//
//
//   AddImagesChaletScreen2({required this.chaletId, required this.images});
//
//   @override
//   State<AddImagesChaletScreen2> createState() => _AddImagesChaletScreen2State();
// }
//
// class _AddImagesChaletScreen2State extends State<AddImagesChaletScreen2>
//     with Helpers {
//   late ImagePicker _imagePicker;
//   XFile? _pickedImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _imagePicker = ImagePicker();
//   }
//
//   // CreateChaletGetxController controller = Get.lazyPut<CreateChaletGetxController>(() => CreateChaletGetxController());
//
//   @override
//   Widget build(BuildContext context) {
//     context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);
//     return Scaffold(body:   WillPopScope(
//         onWillPop: () async {
//       // if (controller.isAllowSelect.value) {
//       //   controller.selectedImageFiles.clear();
//       //   controller.isAllowSelect.value = false;
//       //   return false;
//       // }
//       return true; // تعطيل العودة عند ظهور الـ dialog
//     },
//     child: SafeArea(
//       child: Stack(
//       children: [
//       // Container(
//       // color: primaryColor,
//       // height: 285.h,
//       // width: double.infinity,
//       // ),
//         Container(
//           clipBehavior: Clip.hardEdge,
//           height: 100.h,
//           margin: EdgeInsets.symmetric(
//             horizontal: 16.w,
//           ),
//           decoration:
//           BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
//           child: Stack(
//             children: [
//               SvgPicture.asset('assets/images/app_bar.svg'),
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 child: Center(
//                   child: Text(
//                     'Edit Pictures',
//                     style: GoogleFonts.inter(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       // Container(
//       // margin: EdgeInsets.only(top: 35.h),
//       // width: double.infinity,
//       // child: Text(
//       // localization.tr('pictures'),
//       // style: GoogleFonts.inter(
//       // fontWeight: FontWeight.w600,
//       // fontSize: 30.sp,
//       // color: Colors.white),
//       // textAlign: TextAlign.center,
//       // ),
//       // ),
//       // Padding(
//       // padding: EdgeInsets.only(top: 91.h, right: 20.w, left: 20.w),
//       // child: GestureDetector(
//       // onLongPress: () {
//       // //   int index = controller.selectedImageFiles.value.isEmpty ? 0 :  controller.selectedImageFiles.value.length-1;
//       // //     controller.indexFirstImage.value = 592982;//controller.imageFiles.value.length+1;
//       //
//       // // controller.selectedImageFiles.add(controller.imageFiles[0]);
//       // // controller.isAllowSelect.value = true;
//       // // controller.firstImageIsSelected.value = true;
//       // },
//       // onTap: () {
//       //
//       // //  int index = controller.selectedImageFiles.value.isEmpty ? 0 :  controller.selectedImageFiles.value.length-1;
//       // //   if (controller.isAllowSelect.value) {
//       // //     if (controller.selectedImageFiles.contains(controller.imageFiles[0])) {
//       // //
//       // //       controller.selectedImageFiles.remove(controller.imageFiles[0]);
//       // //       //At(controller.indexFirstImage.value);
//       // //       controller.firstImageIsSelected.value = false;
//       // //     } else {
//       // //      // controller.indexFirstImage.value = controller.selectedImageFiles.value.length;
//       // //       controller.selectedImageFiles.add(controller.imageFiles[0]);
//       // //       controller.firstImageIsSelected.value = true;
//       // //     }
//       // //   } else {
//       // //     controller.imageFiles.isEmpty ?  _pickImage() : GoViewOicturesScreen();
//       // //   }
//       // },
//       // child:
//       // widget.images.isNotEmpty
//       // ?
//       // Stack(children: [
//       // Container(
//       // height: 290.h,
//       // width: double.infinity,
//       // clipBehavior: Clip.hardEdge,
//       // decoration: BoxDecoration(
//       // color: Colors.white,
//       // borderRadius: BorderRadius.circular(17.r),
//       // boxShadow: [
//       // BoxShadow(color: Colors.black, blurRadius: 6),
//       // ]),
//       // child: Image.network(widget.images[0].chaletImages.image)
//       // // Image.file(
//       // //   File( AdminChaletsGetxController.to.chaletForManage.value.logo),//controller.imageFiles.value[0],
//       // //   fit: BoxFit.cover,
//       // // ),
//       // ),
//       // // Visibility(
//       // //   visible: controller.isAllowSelect.value,
//       // //   child: PositionedDirectional(
//       // //     end: 20.w,
//       // //     top: 20.w,
//       // //     child: Container(
//       // //       height:
//       // //           controller.selectedImageFiles.contains(controller.imageFiles[0])
//       // //               ? null
//       // //               : 20,
//       // //       width: controller.selectedImageFiles.contains(controller.imageFiles[0])
//       // //           ? null
//       // //           : 20,
//       // //       //  padding: EdgeInsets.all(5),
//       // //
//       // //       decoration: BoxDecoration(
//       // //           color: controller.selectedImageFiles
//       // //                   .contains(controller.imageFiles[0])
//       // //               ? Colors.white
//       // //               : Colors.transparent,
//       // //           shape: BoxShape.circle,
//       // //           border: Border.all(
//       // //               color: primaryColor,
//       // //               width: controller.selectedImageFiles
//       // //                       .contains(controller.imageFiles[0])
//       // //                   ? 0
//       // //                   : 2)),
//       // //
//       // //       child: controller.selectedImageFiles.contains(controller.imageFiles[0])
//       // //           ? Icon(
//       // //               Icons.check_circle,
//       // //               color: primaryColor,
//       // //             )
//       // //           : null,
//       // //     ),
//       // //   ),
//       // // ),
//       // // Visibility(
//       // //     visible: controller.selectedImageFiles.isNotEmpty && controller.selectedImageFiles.contains(0),
//       // //     child: PositionedDirectional(
//       // //         end: 20.w,
//       // //         top: 20.w,
//       // //         child: Icon(Icons.check_circle, color: primaryColor,)))
//       // ])
//       //     : AddNewImageWidget()),
//       // ),
//       Container(
//       margin: EdgeInsets.only(top: 120.h, right: 20.w, left: 20.w),
//       child: GridView.builder(
//       physics: BouncingScrollPhysics(
//       decelerationRate: ScrollDecelerationRate.fast,
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 10.w,
//       mainAxisSpacing: 10.w,
//       childAspectRatio: 1.3,
//       ),
//       itemBuilder: (context, index) {
//       if (widget.images.isNotEmpty) {
//       if (index == widget.images.length) {
//       return GestureDetector(
//       onTap: () {
//       _pickImage();
//       //  controller.indexFirstImage.value = controller.imageFiles.value.length+1;
//       },
//       child: AddNewImageWidget(
//       sizeText: 10,
//       ));
//       } else {
//       return Stack(children: [
//       GestureDetector(
//       onLongPress: () {
//       // if(!controller.firstImageIsSelected.value){
//       //   controller.indexFirstImage.value = controller.selectedImageFiles.value.length;
//       // }
//       //  controller.indexFirstImage.value = controller.imageFiles.length+1;
//       // controller.selectedImageFiles.add(controller.imageFiles[index+1]);
//       // controller.isAllowSelect.value = true;
//       },
//       onTap: () {
//
//         _pickImage(index: index);
//
//
//
//       // if (controller.isAllowSelect.value) {
//       //  // if(controller.selectedImageFiles.length == 1) {
//       //     if (controller.selectedImageFiles.contains(
//       //         controller.imageFiles[index+1])) {
//       //       controller.selectedImageFiles.remove(controller.imageFiles[index + 1]);
//       //      // controller.selectedImageFiles.removeAt(controller.imageFiles[index + 1] as int);
//       //     } else {
//       //       // if(!controller.firstImageIsSelected.value){
//       //       //   controller.indexFirstImage.value = controller.selectedImageFiles.value.length;
//       //       // }
//       //       controller.selectedImageFiles.add(
//       //           controller.imageFiles[index + 1]);
//       //     }
//       //
//       //   // else{
//       //   //   if (controller.selectedImageFiles.contains(index+1)) {
//       //   //     controller.selectedImageFiles.removeAt(index+1);
//       //   //   } else {
//       //   //     // if(!controller.firstImageIsSelected.value){
//       //   //     //   controller.indexFirstImage.value = controller.selectedImageFiles.value.length;
//       //   //     // }
//       //   //     controller.selectedImageFiles.add(index+1);
//       //   //   }
//       //   // }
//       //  // if(controller.firstImageIsSelected.value && index != controller.indexFirstImage.value){
//       //  //    if (controller.selectedImageFiles.contains(index+1)) {
//       //  //      controller.selectedImageFiles.removeAt(index+1);
//       //  //    } else {
//       //  //      // if(!controller.firstImageIsSelected.value){
//       //  //      //   controller.indexFirstImage.value = controller.selectedImageFiles.value.length;
//       //  //      // }
//       //  //      controller.selectedImageFiles.add(index+1);
//       //  //    }
//       //   // }else{
//       //   //   if (controller.selectedImageFiles.contains(index+1)) {
//       //   //     controller.selectedImageFiles.removeAt(index+1);
//       //   //   } else {
//       //   //     controller.selectedImageFiles.add(index+1);
//       //   //   }
//       //   // }
//       //
//       // } else {
//       //  Get.to(()=> ViewPicturesForAdminScreen(firstIndex: index+1,imagesChalet: controller.imageFiles.value));
//       // }
//       },
//       /*
//                             GestureDetector(
//                     onLongPress: () {
//                       controller.selectedImageFiles.add(0);
//                       controller.isAllowSelect.value = true;
//                     },
//                     onTap: () {
//                       if(controller.isAllowSelect.value){
//                        if( controller.selectedImageFiles.contains(0)){
//                          controller.selectedImageFiles.removeAt(0);
//                        }else{
//                          controller.selectedImageFiles.add(0);
//                        }
//
//                       }else{
//                         controller.imageFiles.isEmpty ? _pickImage() : null;
//
//                       }
//
//                     },
//                              */
//       child: ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child:  widget.images[index].pickedImage == null ?
//
//         CachedNetworkImage(
//         imageUrl:  widget.images[index].chaletImages!.image,//widget.images[index].chaletImages!.image,
//         fit: BoxFit.cover,
//         // fit: BoxFit.fill,
//         placeholder: (context, url) =>
//         SpinKitFadingCircle(
//         color: Colors.blue,
//         size: 50.0,
//         ),
//         )
//             :
//       Image.file(
//         widget.images[index].pickedImage!,
//           fit: BoxFit.cover,
//         )
//       //
//       ),
//       ),
//       // Visibility(
//       //   visible: controller.isAllowSelect.value,
//       //   child: PositionedDirectional(
//       //     end: 10.w,
//       //     top: 10.w,
//       //     child: Container(
//       //       height: controller.selectedImageFiles
//       //               .contains(controller.imageFiles[index+1])
//       //           ? null
//       //           : 20,
//       //       width: controller.selectedImageFiles.contains(controller.imageFiles[index+1])
//       //           ? null
//       //           : 20,
//       //       // padding: EdgeInsets.all(5),
//       //
//       //       decoration: BoxDecoration(
//       //           color: controller.selectedImageFiles
//       //                   .contains(controller.imageFiles[index+1])
//       //               ? Colors.white
//       //               : Colors.transparent,
//       //           shape: BoxShape.circle,
//       //           border: Border.all(
//       //               color: primaryColor,
//       //               width: controller.selectedImageFiles
//       //                       .contains(controller.imageFiles[index+1])
//       //                   ? 0
//       //                   : 2)),
//       //
//       //       child: controller.selectedImageFiles
//       //               .contains(controller.imageFiles[index+1])
//       //           ? Icon(
//       //               Icons.check_circle,
//       //               color: primaryColor,
//       //             )
//       //           : Container(),
//       //     ),
//       //   ),
//       // ),
//       // Visibility(
//       //     visible: controller.selectedImageFiles.isNotEmpty && controller.selectedImageFiles.contains(0),
//       //     child: PositionedDirectional(
//       //         end: 20.w,
//       //         top: 20.w,
//       //         child: Icon(Icons.check_circle, color: primaryColor,)))
//       ]);
//       }
//       } else {
//       return GestureDetector(
//       onTap: () => _pickImage(),
//       child: AddNewImageWidget(
//       sizeText: 10,
//       ));
//       }
//       },
//       itemCount: widget.images.length+1 ,
//       ),
//       ),
//
//       Align(
//       // bottom: 25.h,
//       alignment: AlignmentDirectional.bottomEnd,
//
//       child: GestureDetector(
//       onTap: () {
//       print('next');
//       _performEditImages();
//       },
//       child:  Padding(
//         padding:  EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
//         child: SvgPicture.asset('assets/icons/btn_go.svg'),
//       )
//       // Container(
//       // margin: EdgeInsetsDirectional.only(bottom: 25.h, end: 25.w),
//       // decoration: const BoxDecoration(
//       // image: DecorationImage(
//       // image: AssetImage("assets/icons/FTBPK.png"),
//       // fit: BoxFit.cover)),
//       // padding: EdgeInsets.only(bottom: 8.h),
//       // height: 70.h,
//       // width: 70.w,
//       // child: Transform.flip(
//       // child: Icon(
//       // Icons.arrow_back_outlined,
//       // size: 33.r,
//       // color: Colors.white,
//       // ),
//       // flipX: true,
//       // ),
//       // ),
//       ),
//       ),
//       // Visibility(
//       // visible: controller.selectedImageFiles.isNotEmpty && controller.imageFiles.isNotEmpty && controller.isAllowSelect.value,
//       // child: Align(
//       // // bottom: 25.h,
//       // alignment: AlignmentDirectional.bottomEnd,
//       //
//       // child: GestureDetector(
//       // onTap: () {},
//       // child: Container(
//       // // margin: EdgeInsetsDirectional.only(
//       // //     bottom: 25.h, end: 25.w),
//       // decoration: const BoxDecoration(boxShadow: [
//       // BoxShadow(color: Colors.black38, blurRadius: 1),
//       // ], color: scaffoldBackGround),
//       // // padding: EdgeInsets.only(bottom: 8.h),
//       // height: 100.h,
//       // width: double.infinity,
//       // child: Row(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       // children: [
//       // Expanded(
//       // child: IconButton(
//       // icon: Icon(
//       // Icons.delete,
//       // size: 33.r,
//       // color: Colors.red,
//       // ),
//       // onPressed: () {
//       // // controller.selectedImageFiles.map((element) {
//       // //   if(element.contains(controller.imageFiles[index+1]){
//       // //     controller.imageFiles.remove(controller.selectedImageFiles);
//       // //   }
//       // // } );
//       //
//       // controller.imageFiles.removeWhere((item) => controller.selectedImageFiles.contains(item));
//       // CreateChaletGetxController.to.isAllowSelect.value = false;
//       // CreateChaletGetxController.to.selectedImageFiles.clear();
//       // // controller.imageFiles.clear();
//       // // controller.imageFiles.addAll(updatedList as Iterable<File>);
//       // // print(updatedList);
//       // // element == controller.imageFiles);
//       //
//       // // controller.imageFiles.forEach((element) {
//       // //   if(element == controller.selectedImageFiles){
//       // //     controller.imageFiles.remove(element);
//       // //   }
//       // // });
//       // },
//       // ),
//       // ),
//       // Visibility(
//       // visible: controller.selectedImageFiles.length == 1,
//       // child: Expanded(
//       // child: IconButton(
//       // icon: Icon(
//       // Icons.edit_square,
//       // size: 33.r,
//       // color: primaryColor,
//       // ),
//       // onPressed: () {
//       // _pickImage(index: controller.imageFiles.indexOf(controller.selectedImageFiles[0]));
//       // },
//       // ),
//       // ),
//       // ),
//       // ],
//       // ),
//       // ),
//       // ),
//       // ),
//       // ),
//       ],
//       ),
//     ),
//     )
//     // GetX<CreateChaletGetxController>(
//     //     builder: (CreateChaletGetxController controller) {
//     //
//     // })
//     );
//   }
//
//   void _pickImage({int index = -1}) async {
//     final imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//     if (imageFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         aspectRatioPresets: [
//           //  CropAspectRatioPreset.square,
//           //CropAspectRatioPreset.ratio3x2,
//           // CropAspectRatioPreset.original,
//           CropAspectRatioPreset.ratio4x3,
//           // CropAspectRatioPreset.ratio16x9
//         ],
//         uiSettings: [
//           AndroidUiSettings(
//               toolbarTitle: 'Cropper',
//               toolbarColor: primaryColor,
//               toolbarWidgetColor: Colors.white,
//               // cropFrameColor: Colors.blue,
//               backgroundColor: scaffoldBackGround,
//               cropGridColor: secondaryColor,
//               activeControlsWidgetColor: primaryColor,
//               initAspectRatio: CropAspectRatioPreset.ratio3x2,
//               lockAspectRatio: true),
//           IOSUiSettings(
//             title: 'Cropper',
//           ),
//           WebUiSettings(
//             context: context,
//           ),
//         ],
//       );
//
//       final savedFile = File(croppedFile!.path);
//
//       //_pickedImage = imageFile;
//       // showReviewToAddImageDialog(croppedFile as File);
//       // if(index == -1){
//       //
//       //   CreateChaletGetxController.to.imageFiles.add(savedFile);
//       setState(() {
//         if(index == -1){
//           widget.images.add(ImageDynamic(pickedImage: savedFile));
//
//         }else{
//           widget.images[index].pickedImage = savedFile;
//
//         }
//       });
//       // }else{
//       //   CreateChaletGetxController.to.imageFiles[index] = savedFile;
//       //   CreateChaletGetxController.to.isAllowSelect.value = false;
//       //    CreateChaletGetxController.to.selectedImageFiles.clear();
//       // }
//
//     }
//   }
//
//   void _performEditImages() {
//     if (_checkDate()) {
//       // print( 'image 1: ${CreateChaletGetxController.to.imageFiles[0].path} image2: ${CreateChaletGetxController.to.imageFiles[1].path}');
//       // Get.to(()=> PricesScreen(isAdmin: true, chaletPrices: ChaletPrices(),));
//       _editImages();
//     }
//   }
//
//   bool _checkDate() {
//     if (widget.images.isNotEmpty) {
//       return true;
//     }
//     showSnackBarByGet(
//         title: localization.tr('pick_imames_to_upload'), error: true);
//     return false;
//   }
//
//   void _editImages() async {
//     showLoadingDialog(context);
//     // _updateChaletInformation();
//     // ApiResponse result = await AdminChaletsApiController().edaitImagesChalet(chaletId: widget.chaletId,imagesDynamic: widget.images);
//     if(result.success){
//       AdminChaletsGetxController.to.getchaletToManage(id: AdminChaletsGetxController.to.chaletForManage.value.id);
//
//       Get.back();
//       Get.back();
//
//       showSnackBarByGet(title: result.message, error: !result.success);
//
//
//     }else{
//       Get.back();
//
//       showSnackBarByGet(title: result.message, error: !result.success);
//
//     }
//   }
//
//   void GoViewOicturesScreen(){
//     Get.to(()=> ViewPicturesForAdminScreen(firstIndex: 0,imagesChalet:  CreateChaletGetxController.to.imageFiles.value,));
//
//
//   }
//
//
//
//
// }
