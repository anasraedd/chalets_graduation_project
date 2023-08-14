import 'dart:io';

import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/create_chalet_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';

class ViewPicturesForAdminScreen extends StatefulWidget {
  late int firstIndex;
  late List<File> imagesChalet;

  ViewPicturesForAdminScreen({this.firstIndex = 0, required this.imagesChalet});

  @override
  State<ViewPicturesForAdminScreen> createState() =>
      _ViewPicturesForAdminScreenState();
}

class _ViewPicturesForAdminScreenState
    extends State<ViewPicturesForAdminScreen> {

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.firstIndex,
    );
    // _pageController.addListener(_pageControllerListener);

    //_pageController.animateToPage(widget.firstIndex, duration: Duration(milliseconds: 5), curve: Curves.decelerate.flipped);
  }

  void _pageControllerListener() {
    // setState(() {
    //   _currentIndex = _pageController.page!.toInt();
    // CreateChaletGetxController.to.currentIndex.value = _pageController.page!.toInt();
    // });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CreateChaletGetxController.to.currentIndex.value = widget.firstIndex;
    // TODO: implement build
    return Scaffold(
      backgroundColor: scaffoldBackGround,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 80.h,
        title: Text(
          'Pictures',
          style: GoogleFonts.inter(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            MyFlutterApp.back,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          Row(
            children: [
              GetX<CreateChaletGetxController>(
                  init: CreateChaletGetxController(),
                  builder: (CreateChaletGetxController controller) {
                    return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        child: Text(
                          // widget.isAdmin
                          // ?
                          '${controller.currentIndex.value + 1}/${controller.imageFiles.value.length}',
                          //    : '${controller.currentIndex.value + 1}/${images.length}',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
//profileReplace.png

                        );
                  }),
              SizedBox(
                width: 30.w,
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: GalleryWidget(
          urlImages: widget.imagesChalet,
          pageController: _pageController,

        ),
        // child: InkWell(
        //   onTap: openGallery,
        //   child: Ink.image(
        //     image: NetworkImage(images.first),
        //     height: 300,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }

// void openGallery() => Navigator.of(context).push(MaterialPageRoute(
//     builder: (_) => GalleryWidget(
//           urlImages: images,
//         )));
}

class GalleryWidget extends StatelessWidget {
  final List<File> urlImages;
  final PageController pageController;

  GalleryWidget(
      {required this.urlImages,
      required this.pageController,});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child:
//           GetX<CreateChaletGetxController>(
// init: CreateChaletGetxController(),
//               builder: (CreateChaletGetxController controller) {
//             return
          PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(color: scaffoldBackGround),
        itemCount: //controller.imageFiles.length,
            urlImages.length,
        builder: (context, index) {
          final urlImage = urlImages[index];
          // if (isAdmin) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(urlImage),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained * 4,
          );
          // } else {
          //   return PhotoViewGalleryPageOptions(
          //     imageProvider: NetworkImage(
          //       urlImage,
          //     ),
          //     minScale: PhotoViewComputedScale.contained,
          //     maxScale: PhotoViewComputedScale.contained * 4,
          //   );
          // }
        },
        onPageChanged: (int index) {
          // This callback will be called when the viewed image changes
          // You can perform additional logic here if needed
           CreateChaletGetxController.to.currentIndex.value = index;
        },
        pageController: pageController,
      ),
      //})
      //   }),
    );
  }
}

