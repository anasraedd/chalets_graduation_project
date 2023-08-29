import 'dart:io';
import 'dart:math';

import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/models/chalet/chalet_images.dart';
import 'package:chalets/models/image_dynamic.dart';
import 'package:chalets/screens/app_admin/add_facilities_chalet_screen.dart';
import 'package:chalets/screens/app_admin/add_images_chalet_screen.dart';
import 'package:chalets/screens/app_admin/chalet_information_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/add_images_chalet_screen2.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/coupon_screen.dart';
import 'package:chalets/screens/chalet_pictures_screen.dart';
import 'package:chalets/screens/details_screen.dart';
import 'package:chalets/screens/prices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ControlWidget extends StatelessWidget with Helpers {
  late String title;
  late int numberPage;

  ControlWidget({required this.title, this.numberPage = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: 96.w,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (numberPage == 0) {
                        Get.to(DetailsScreen(
                          id: AdminChaletsGetxController
                              .to.chaletForManage.value.id,
                          isAdmin: true,
                        ));
                      } else if (numberPage == 1) {
                        Get.to(() => ChaletPicturesScreen(
                              images: AdminChaletsGetxController
                                  .to.chaletForManage.value.chaletImages,
                            ));
                      } else if (numberPage == 2) {
                        Get.to(PricesScreen(
                          isAdmin: true,
                          chaletPrices: AdminChaletsGetxController
                              .to.chaletForManage.value.chaletPrices[0],
                        ));

                        // Get.to(DetailsScreen(id: AdminChaletsGetxController.to.chaletForManage.value.id ,));
                      } else if (numberPage == 3) {
                        Get.to(DetailsScreen(
                          id: AdminChaletsGetxController
                              .to.chaletForManage.value.id,
                          //numberPage: 3,
                          isAdmin: true,
                        ));
                      } else if (numberPage == 4) {
                        Get.to(CouponScreen());
                      }
                    },
                    child: Container(
                      height: 77.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(15.r),
                              bottomStart: Radius.circular(15.r))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Review',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 10.sp, color: primaryColor),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Get.lazyPut<CreateChaletGetxController>(
                          () => CreateChaletGetxController());

                      if (numberPage == 0) {
                        CreateChaletGetxController.to.editChaletInformation(
                            chalet: AdminChaletsGetxController
                                .to.chaletForManage.value);
                        Get.to(ChaletInformationScreen(
                          edit: true,
                        ));
                      } else if (numberPage == 1) {
                        // CreateChaletGetxController.to.editChaletInformation(chalet: AdminChaletsGetxController.to.chaletForManage.value);

                        // File file =

                        CreateChaletGetxController
                            .to.loadingPickedImages.value = true;
                        Get.to(AddImagesChaletScreen(
                          isEdit: true,
                          lenghtList: AdminChaletsGetxController
                              .to.chaletForManage.value.chaletImages.length,
                        ));

                        if (!CreateChaletGetxController
                            .to.imageFiles.isNotEmpty) {
                          await urlToFile(
                              chaletImages: AdminChaletsGetxController
                                  .to.chaletForManage.value.chaletImages);
                        }
                        CreateChaletGetxController
                            .to.loadingPickedImages.value = false;

                        // showReviewToAddImageDialog(file);

                        // Get.to(AddImagesChaletScreen2(chaletId: AdminChaletsGetxController.to.chaletForManage.value.id ,images: AdminChaletsGetxController.to.chaletForManage.value.chaletImages.map((e) =>  ImageDynamic(chaletImages: e)).toList(),));
                      } else if (numberPage == 2) {
                        Get.to(PricesScreen(
                          isAdmin: true,
                          isEdit: true,
                          chaletPrices: AdminChaletsGetxController
                              .to.chaletForManage.value.chaletPrices[0],
                        ));

                        // Get.to(DetailsScreen(id: AdminChaletsGetxController.to.chaletForManage.value.id ,));
                      } else if (numberPage == 3) {

                        CreateChaletGetxController.to.editChaletFacility(
                            chalet: AdminChaletsGetxController
                                .to.chaletForManage.value);

                        Get.to(AddFacilitiesChaletScreen(edit: true,));
                        // Get.to(DetailsScreen(
                        //   id: AdminChaletsGetxController
                        //       .to.chaletForManage.value.id,
                        //   numberPage: 3,
                        //   isAdmin: true,
                        // ));
                      } else if (numberPage == 4) {
                        Get.to(CouponScreen());
                      }
                    },
                    child: Container(
                      height: 77.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF6CAFBF),
                          borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(15.r),
                              bottomEnd: Radius.circular(15.r))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Edit',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 10.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            SvgPicture.asset(
                              'assets/icons/edit-square-outline.svg',
                              height: 30,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> urlToFile({required List<ChaletImages> chaletImages}) async {
    chaletImages.forEach((element) async {
      var rng = new Random();
// get temporary directory of device.
      Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
      String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
      File file =
          new File('$tempPath' + (rng.nextInt(100)).toString() + '.jpg');

// call http.get method and pass imageUrl into it to get response.
      http.Response response = await http.get(Uri.parse(element.image));
// write bodyBytes received in response to file.
      await file.writeAsBytes(response.bodyBytes);
      CreateChaletGetxController.to.imageFiles.add(file);
    });
    // CreateChaletGetxController.to.loadingPickedImages.value = false;

// generate random number.

// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
//     return file;
  }
}
