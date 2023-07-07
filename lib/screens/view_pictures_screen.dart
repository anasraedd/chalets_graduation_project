import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class TestViewImage extends StatefulWidget {
  const TestViewImage({Key? key}) : super(key: key);

  @override
  State<TestViewImage> createState() => _TestViewImageState();
}

class _TestViewImageState extends State<TestViewImage> {
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
  ];

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_pageControllerListener);
  }

  void _pageControllerListener() {
    setState(() {
      _currentIndex = _pageController.page!.toInt();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness:
          Brightness.light, // For iOS (dark icons)
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
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: Text('${_currentIndex+1}/${images.length}', style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ) ,)
//profileReplace.png
              ),
              SizedBox(
                width: 30.w,
              ),
            ],
          )
        ],




      ),
      body: Center(
        child: GalleryWidget(urlImages: images, pageController: _pageController,),
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

class GalleryWidget extends StatefulWidget {
  final List<String> urlImages;
  final PageController pageController;


  GalleryWidget({required this.urlImages, required this.pageController});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: PhotoViewGallery.builder(

          backgroundDecoration: BoxDecoration(color: Colors.white),
          itemCount: widget.urlImages.length,
          builder: (context, index) {

            final urlImage = widget.urlImages[index];
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                urlImage,

              ),

              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained * 4,
            );

          },

        onPageChanged: (int index) {
          // This callback will be called when the viewed image changes
          // You can perform additional logic here if needed
        },
        pageController: widget.pageController,
      ),
    );
  }
}

//   late TransformationController controller;
//   late AnimationController animationController;
//   Animation<Matrix4>? animation;
//
//
//   @override
//   void initState(){
//     super.initState();
//
//     controller = TransformationController();
//     animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200))..addListener(() {
//       controller.value = animation!.value;
//     });
//   }
//
//   @override
//   void dispose(){
//     controller.dispose();
//     animationController.dispose();
//     super.dispose();
//   }
//
//   List<String> imades = [
//     // Add your image URLs here
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//
//   final double minScale = 1;
//   final double maxScale = 4;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onDoubleTap: (){
//             final double scalse = 3;
//             final zoomed = Matrix4.identity()..scale(scalse);
//             final value = zoomed;
//             controller.value = value;
//           },
//           child: InteractiveViewer(
//             transformationController:  controller,
//             clipBehavior: Clip.none,
//               minScale: minScale,
//               maxScale: maxScale,
//               onInteractionEnd: (details){
//               resetAnimation();
//               },
//               panEnabled: false,
//               scaleEnabled: false,
//               child: AspectRatio(
//             aspectRatio: 1,
//             child: Image.network(
//               imades[0],
//               fit: BoxFit.cover,
//             ),
//           )),
//         ),
//       ),
//     );
//   }
//
//   void resetAnimation(){
//     animation = Matrix4Tween(
//       begin: controller.value,
//       end: Matrix4.identity(),
//     ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
//     animationController.forward(from: 0);
//   }
// }

// class ZoomableImageGallery extends StatefulWidget {
//   @override
//   _ZoomableImageGalleryState createState() => _ZoomableImageGalleryState();
// }
//
// class _ZoomableImageGalleryState extends State<ZoomableImageGallery> {
//   List<String> imageUrls = [
//     // Add your image URLs here
//     'https://example.com/image1.jpg',
//     'https://example.com/image2.jpg',
//     'https://example.com/image3.jpg',
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onHorizontalDragEnd: (DragEndDetails details) {
//                   if (details.primaryVelocity! > 0) {
//                     // Swiped from left to right
//                     setState(() {
//                       if (currentIndex > 0) currentIndex--;
//                     });
//                   } else if (details.primaryVelocity! < 0) {
//                     // Swiped from right to left
//                     setState(() {
//                       if (currentIndex < imageUrls.length - 1) currentIndex++;
//                     });
//                   }
//                 },
//                 child: GestureZoomBox(
//                   maxScale: 5.0, // Adjust the maximum zoom level as needed
//                   doubleTapScale: 2.0, // Adjust the zoom level on double tap as needed
//                   child: Image.network(
//                     imageUrls[currentIndex],
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             SizedBox(
//               height: 100.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: imageUrls.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.0),
//                       width: 100.0,
//                       height: 100.0,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: currentIndex == index
//                               ? Colors.blue
//                               : Colors.transparent,
//                           width: 2.0,
//                         ),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Image.network(
//                         imageUrls[index],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// class ZoomableImageGallery extends StatefulWidget {
//   @override
//   _ZoomableImageGalleryState createState() => _ZoomableImageGalleryState();
// }
//
// class _ZoomableImageGalleryState extends State<ZoomableImageGallery> {
//   List<String> imageUrls = [
//     // Add your image URLs here
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: InteractiveViewer(
//                 boundaryMargin: EdgeInsets.all(20.0),
//                 minScale: 0.5,
//                 maxScale: 4.0,
//                 child: Image.network(
//                   imageUrls[currentIndex],
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             SizedBox(
//               height: 100.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: imageUrls.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.0),
//                       width: 100.0,
//                       height: 100.0,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: currentIndex == index
//                               ? Colors.blue
//                               : Colors.transparent,
//                           width: 2.0,
//                         ),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Image.network(
//                         imageUrls[index],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// class ImageViewerScreen extends StatefulWidget {
//   @override
//   _ImageViewerScreenState createState() => _ImageViewerScreenState();
// }
//
// class _ImageViewerScreenState extends State<ImageViewerScreen> {
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
// //
//
//   int currentIndex = 0;
//   bool isZoomed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Viewer'),
//       ),
//       body: GestureDetector(
//         onHorizontalDragEnd: (details) {
//           if (!isZoomed) {
//             if (details.primaryVelocity! < 0) {
//               // Swipe left
//               if (currentIndex < images.length - 1) {
//                 setState(() {
//                   currentIndex++;
//                 });
//               }
//             } else if (details.primaryVelocity! > 0) {
//               // Swipe right
//               if (currentIndex > 0) {
//                 setState(() {
//                   currentIndex--;
//                 });
//               }
//             }
//           }
//         },
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: images.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: currentIndex == index
//                               ? Colors.blue
//                               : Colors.transparent,
//                           width: 2,
//                         ),
//                       ),
//                       child: Image.network(
//                         images[index],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '${currentIndex + 1}/${images.length}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               flex: 2,
//               child: Stack(
//                 children: [
//                   PhotoView(
//                     imageProvider: NetworkImage(images[currentIndex]),
//                     backgroundDecoration: BoxDecoration(color: Colors.black),
//                     minScale: PhotoViewComputedScale.contained,
//                     maxScale: 2.0,
//                     onTapUp: (context, details, value) {
//                       setState(() {
//                         isZoomed = !isZoomed;
//                       });
//                     },
//                   ),
//                   Positioned(
//                     top: 20,
//                     left: 0,
//                     right: 0,
//                     child: Text(
//                       '${currentIndex + 1}/${images.length}',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ImageViewerScreen extends StatefulWidget {
//   @override
//   _ImageViewerScreenState createState() => _ImageViewerScreenState();
// }
//
// class _ImageViewerScreenState extends State<ImageViewerScreen> {
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//
//   int currentIndex = 0;
//   bool isZoomed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Viewer'),
//       ),
//       body: GestureDetector(
//         onHorizontalDragEnd: (details) {
//           if (!isZoomed) {
//             if (details.primaryVelocity! < 0) {
//               // Swipe left
//               if (currentIndex < images.length - 1) {
//                 setState(() {
//                   currentIndex++;
//                 });
//               }
//             } else if (details.primaryVelocity! > 0) {
//               // Swipe right
//               if (currentIndex > 0) {
//                 setState(() {
//                   currentIndex--;
//                 });
//               }
//             }
//           }
//         },
//         child: Stack(
//           children: [
//             PhotoView(
//               imageProvider: NetworkImage(images[currentIndex]),
//               backgroundDecoration: BoxDecoration(color: Colors.black),
//               minScale: PhotoViewComputedScale.contained,
//               maxScale: 5.0,
//               onTapUp: (context, details, value) {
//                 setState(() {
//                   isZoomed = !isZoomed;
//                 });
//               },
//             ),
//             Positioned(
//               top: 20,
//               left: 0,
//               right: 0,
//               child: Text(
//                 '${currentIndex + 1}/${images.length}',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// class ImageViewerScreen extends StatefulWidget {
//   @override
//   _ImageViewerScreenState createState() => _ImageViewerScreenState();
// }
//
// class _ImageViewerScreenState extends State<ImageViewerScreen> {
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Viewer'),
//       ),
//       body: GestureDetector(
//         onHorizontalDragEnd: (details) {
//           if (details.primaryVelocity! < 0) {
//             // Swipe left
//             if (currentIndex < images.length - 1) {
//               setState(() {
//                 currentIndex++;
//               });
//             }
//           } else if (details.primaryVelocity! > 0) {
//             // Swipe right
//             if (currentIndex > 0) {
//               setState(() {
//                 currentIndex--;
//               });
//             }
//           }
//         },
//         child: PageView.builder(
//           itemCount: images.length,
//           controller: PageController(initialPage: currentIndex),
//           onPageChanged: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           itemBuilder: (context, index) {
//             return Image.network(
//               images[index],
//               fit: BoxFit.contain,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ViewPicturesScreen extends StatefulWidget {
//   const ViewPicturesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ViewPicturesScreen> createState() => _ViewPicturesScreenState();
// }
//
// class _ViewPicturesScreenState extends State<ViewPicturesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
//
// class ViewPicturesScreen extends StatefulWidget {
//   @override
//   _ViewPicturesScreenState createState() => _ViewPicturesScreenState();
// }
//
// class _ViewPicturesScreenState extends State<ViewPicturesScreen> {
//   late PageController _pageController;
//   double _scale = 1.0;
//   bool _isZoomed = false;
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Viewer'),
//       ),
//       body:Center(
//         child: InteractiveViewer(
//          // boundaryMargin: EdgeInsets.all(20.0),
//           minScale: 0.1,
//           maxScale: 5.1,
//           child: Image.network(
//            images[0],
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//       // GestureDetector(
//       //   onScaleStart: (_) {
//       //     setState(() {
//       //       _isZoomed = true;
//       //     });
//       //   },
//       //   onScaleEnd: (_) {
//       //     setState(() {
//       //       _isZoomed = false;
//       //     });
//       //   },
//       //   onScaleUpdate: (ScaleUpdateDetails details) {
//       //     setState(() {
//       //       _scale = details.scale.clamp(1.0, 5.0); // Limit scale between 1.0 and 5.0
//       //     });
//       //   },
//       //   child: PageView.builder(
//       //     physics: _isZoomed ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
//       //     controller: _pageController,
//       //     itemCount: images.length,
//       //     itemBuilder: (BuildContext context, int index) {
//       //       return PhotoView(
//       //         imageProvider: NetworkImage(images[index]),
//       //         minScale: 0.5,
//       //         maxScale: 5.0,
//       //         scaleStateController: PhotoViewScaleStateController(),
//       //         initialScale: _scale,
//       //       );
//       //     },
//       //   ),
//       // ),
//     );
//   }
// }

//
// class ViewPicturesScreen extends StatefulWidget {
//   @override
//   _ViewPicturesScreenState createState() => _ViewPicturesScreenState();
// }
//
// class _ViewPicturesScreenState extends State<ViewPicturesScreen> {
//   late PageController _pageController;
//   double _scale = 1.0;
//   List<String> images = [
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
//     "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Viewer'),
//       ),
//       body: GestureDetector(
//         onScaleUpdate: (ScaleUpdateDetails details) {
//           setState(() {
//             _scale = details.scale.clamp(1.0, 5.0); // Limit scale between 1.0 and 5.0
//           });
//         },
//         child: PageView.builder(
//           controller: _pageController,
//           itemCount: 3, // Replace with your image count
//           itemBuilder: (BuildContext context, int index) {
//             return PhotoView(
//               imageProvider: NetworkImage(images[index],
//
//               ), // Replace with your image path
//               minScale: 0.0,
//               maxScale: 5.0,
//               scaleStateController: PhotoViewScaleStateController(),
//               initialScale: _scale,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
