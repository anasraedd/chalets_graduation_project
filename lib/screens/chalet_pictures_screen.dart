import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:chalets/models/chalet/chalet_images.dart';
import 'package:chalets/screens/view_pictures_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChaletPicturesScreen extends StatefulWidget {

    List<ChaletImages>? images;
   ChaletPicturesScreen({this.images});

  @override
  State<ChaletPicturesScreen> createState() => _ChaletPicturesScreenState();
}

class _ChaletPicturesScreenState extends State<ChaletPicturesScreen> {
  // final controllerGetx = Get.put(CreateChaletGetxController);
  // List<String> images = [
  //   "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
  //   "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
  //   "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
  //   "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
  // ];
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );



  CreateChaletGetxController controllerGetx = Get.put(CreateChaletGetxController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: false, color: Colors.transparent);

    return Scaffold(
      body: Stack(
          children: [
            CustomAppBar(),

            Padding(
              padding: EdgeInsets.only(top: 95.h, left: 20.w, right: 20.w),

              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                    Get.to(()=>ViewPicturesScreen(firstIndex: 0,imagesChalets: widget.images == null ? ChaletsGetxController.to.chalet.value.chaletImages : widget.images!,));
                    },
                    child: Container(
                        height: 290.h,
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 6),
                            ]),

                        child: SizedBox(
                          height: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: widget.images == null ? ChaletsGetxController.to.chalet.value.chaletImages[0].image : widget.images![0].image,//images[0]
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                SpinKitFadingCircle(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                          ),
                        )

                    ),
                  ),
                  //SizedBox(height: 22.h,),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.w,
                            childAspectRatio: 1.3,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                               Get.to(()=>ViewPicturesScreen(firstIndex: index+1,imagesChalets: widget.images == null ?ChaletsGetxController.to.chalet.value.chaletImages : widget.images!,));
                              },
                              child: Container(
                                margin: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(16.r)
                                  // ),
                                //height: 120,
                                //width: 200.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),

                                    // boxShadow: [
                                    //   BoxShadow(color: Colors.black, blurRadius: 6),
                                    // ]
                              ),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.images == null ? ChaletsGetxController.to.chalet.value.chaletImages[index+1].image : widget.images![index+1].image,
                                    fit: BoxFit.cover,
                                   // fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        SpinKitFadingCircle(
                                          color: Colors.blue,
                                          size: 50.0,
                                        ),
                                  ),
                              ),
                            );
                          },
                          itemCount: widget.images == null ? ChaletsGetxController.to.chalet.value.chaletImages.length-1 : widget.images!.length-1,),
                      ),
                    ),
                  )
                ],
              ),
            ),


          ]

      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(285.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      //color: primaryColor,
      child: AppBar(
        title: Text(
          'Pictures',
          style: GoogleFonts.inter(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
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
        elevation: 0,

        // Customize other properties of the AppBar as needed
      ),
    );
  }
}
