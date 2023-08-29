import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/models/FavoriteChalet.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/screens/calender_chalet_screen.dart';
import 'package:chalets/screens/chalet_pictures_screen.dart';
import 'package:chalets/screens/chat_screen.dart';
import 'package:chalets/screens/choose_your_reservation_date.dart';
import 'package:chalets/screens/description_chalet_screen.dart';
import 'package:chalets/screens/map_chalet_screen.dart';
import 'package:chalets/screens/prices_screen.dart';
import 'package:chalets/screens/terms_chalet_screen.dart';
import 'package:chalets/screens/view_pictures_screen.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  // const DetailsScreen({Key? key}) : super(key: key);
  late int id;
  late int  numberPage;
  late bool isAdmin;

  DetailsScreen({required this.id, this.numberPage =0, this.isAdmin = false});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin, Helpers {

  int currentIndex = 0;
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet1.jpg?alt=media&token=e72ecc96-79e0-48a9-b0d5-33102a82b457",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet2.jpg?alt=media&token=fb87af8c-f320-4f03-90b1-4f25ae0ed8aa",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet3.jpg?alt=media&token=95ee211f-f8e5-49f4-8656-07ce926b3d45",
    "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2Fchalet4.jpg?alt=media&token=015d023e-05b9-425e-89ef-ec883fba2c47"
  ];
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,

  );

  late TabController _tabController;

  @override
  void initState() {
    super.initState();


    final getxController =
        Get.put<ChaletsGetxController>(ChaletsGetxController());
    //getxController.call();
    ChaletsGetxController.to.read(id: widget.id);
    Get.lazyPut<UserGetxController>(() => UserGetxController());

    // if (!UserGetxController.to.isGetFavoriteChalets.value) {
    //   UserGetxController.to.getFavoriteChaltes();
    // }
    // print(getxController.call().chalet);

    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.numberPage);

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    ChaletsGetxController.to.page.value = _tabController.index;
    print("Current tab index: ${_tabController.index}");
  }

  @override
  void dispose() {
    // _animationController.dispose();
    // _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: false, color: Colors.transparent);
    return Scaffold(
        backgroundColor: scaffoldBackGround,
        body: GetX<ChaletsGetxController>(
            init: ChaletsGetxController(),
            builder: (ChaletsGetxController getxController) {
              if (getxController.loading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Stack(
                  children: [
                    SizedBox(
                      height: 350.h,
                      child: Stack(
                        children: [
                          getxController.chalet.value.chaletImages.isNotEmpty
                              ? ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    pageSnapping: true,
                                    controller: controller,
                                    itemCount: getxController
                                        .chalet.value.chaletImages.length,
                                    itemBuilder: (_, index) {
                                      return SizedBox(
                                        height: double.infinity,
                                        child: CachedNetworkImage(
                                          imageUrl: getxController.chalet.value
                                              .chaletImages[index].image,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              ShimmerLoadingWidget(
                                                  height: 350.h,
                                                  width: double.infinity),
                                          errorWidget: (context, url, error) =>
                                              ShimmerLoadingWidget(
                                                  height: double.infinity,
                                                  width: double.infinity),
                                          // placeholder: (context, url) =>
                                          //     SpinKitFadingCircle(
                                          //       color: Colors.blue,
                                          //       size: 50.0,
                                          //     ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : ShimmerLoadingWidget(
                                  height: 350.h, width: double.infinity),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 50.h),
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: getxController
                                    .chalet.value.chaletImages.length,
                                effect: ExpandingDotsEffect(
                                    dotHeight: 8.w,
                                    dotWidth: 8.w,
                                    dotColor: Colors.white,
                                    spacing: 5.w,
                                    activeDotColor: Colors.white),
                                onDotClicked: (index) {
                                  controller.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                              ),
                            ),
                          ),
                          PositionedDirectional(
                           bottom: 40.h,
                            start: 30.w,
                            child: GestureDetector(
                                onTap: (){
                                  Get.to(()=>ChaletPicturesScreen());
                                },
                                child: SvgPicture.asset('assets/icons/galery_icon.svg')),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 40.h, right: 30.w, left: 30.w),
                            child: Container(
                              height: 50.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Transform.flip(
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(
                                              MyFlutterApp.back,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          flipX: context.locale.languageCode ==
                                              'ar',
                                        )

                                        // Image(
                                        //   image: AssetImage("assets/icons/back.png"),
                                        //   height: 30.h,
                                        //   width: 30.h,
                                        // ),
                                        ),
                                  ),
                                  Container(
                                      alignment: AlignmentDirectional.topEnd,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Icon(
                                        MyFlutterApp.circle_share,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        if (getxController.isFavorite.value) {
                                          getxController.isFavorite.value =
                                              false;

                                          ChaletsGetxController.to
                                              .deleteChaletFromFavorite(
                                                  chaletId:
                                                      '${getxController.chalet.value.id}');

                                          UserGetxController.to.favoriteChalets.removeWhere((element) => element.id == getxController.chalet.value.id);
                                        } else {
                                          getxController.isFavorite.value =
                                              true;

                                          ChaletsGetxController.to
                                              .addChaletInFavorite(
                                                  chaletId:
                                                      '${getxController.chalet.value.id}');
                                          FavoriteChalet favoriteChalet = FavoriteChalet();
                                          favoriteChalet.id = getxController.chalet.value.id;
                                          favoriteChalet.name = getxController.chalet.value.name;
                                          favoriteChalet.location = getxController.chalet.value.location;
                                          favoriteChalet.space = getxController.chalet.value.space;
                                          favoriteChalet.chaletImages = getxController.chalet.value.chaletImages;

                                          UserGetxController.to.favoriteChalets.add(favoriteChalet);

                                        }
                                        // getxController.chalet.value.isFavorite = !getxController.chalet.value.isFavorite;
                                        // getxController.isFavorite.value =
                                        // !getxController.isFavorite.value;
                                      },
                                      child: Container(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          child: getxController.isFavorite
                                                  .isFalse // !getxController.chalet.value.isFavorite //getxController.isFavorite.isTrue
                                              ? Icon(
                                                  MyFlutterApp
                                                      .circle_heart_outlined,
                                                  color: Colors.white,
                                                  size: 30,
                                                )
                                              : SvgPicture.asset(
                                                  'assets/icons/favorite_fill.svg')
                                          // : Icon(
                                          //     MyFlutterApp.circle_heart_outlined,
                                          //     color: Colors.red,
                                          //     size: 30,
                                          //   ),
                                          )), //;
                                  //  })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: scroll(),
                    ),
              widget.isAdmin ? Container() : PositionedDirectional(
                      bottom: 30.h,
                      end: 110.w,
                      child: Visibility(
                        visible: ChaletsGetxController.to.showChoices.value,
                        child: Row(
                          children: [
                            // SvgPicture.asset('assets/icons/btn_go.svg'),

                            Visibility(
                                visible:
                                    ChaletsGetxController.to.page.value == 1,
                                child: GestureDetector(
                                  onTap: (){
                                    showInfoOfCalender(context);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/polygon_info.svg'),
                                )),

                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(PricesScreen(isAdmin: false, chaletPrices: ChaletsGetxController.to.chalet.value.chaletPrices[0],));
                              },
                              child: SvgPicture.asset(
                                  'assets/images/polygon_date_time.svg'),
                            ),

                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(ChatScreen(id: ChaletsGetxController.to.chalet.value.id, name: ChaletsGetxController.to.chalet.value.name, logo: ChaletsGetxController.to.chalet.value.logo,));

                              },
                              child: SvgPicture.asset(
                                  'assets/images/polygon_message.svg'),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                                onTap: () => Get.toNamed('choose_your_reservation_date'),
                                child: SvgPicture.asset('assets/images/polygon_date.svg')),
                          ],
                        ),
                      ),
                    ),

                    widget.isAdmin ? Container() :  PositionedDirectional(
                      bottom: 30.h,
                      end: 30.w,
                      child: GestureDetector(
                          onTap: () {
                            ChaletsGetxController.to.showChoices.value =
                                !ChaletsGetxController.to.showChoices.value;
                          },
                          child: ChaletsGetxController.to.showChoices.value
                              ? SvgPicture.asset(
                                  'assets/images/polygon_close.svg')
                              : SvgPicture.asset(
                                  'assets/images/polygon_more.svg')),
                    )

                    // buttonArrow(),
                  ],
                );
              }
            }));
  }

  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.8.h,
      maxChildSize: 1.1.h,
      minChildSize: 0.8.h,
      // expand: true,

      builder: (context, scrllController) {
        return Container(
          //  padding: EdgeInsets.symmetric(horizontal: 20.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: scaffoldBackGround,
          ),

          child: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(primaryColor),
                  labelColor: primaryColor,
                  unselectedLabelColor: Color(0xFF454545),
                  //indicatorWeight: 0,
                  indicatorColor: Colors.transparent,

                  //labelPadding: EdgeInsets.symmetric(horizontal: 0),
                  labelStyle:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  onTap: (int selectedTabIndex) {},
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                      child: Tab(
                        text: localization.tr('description'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                      child: Tab(
                        text: localization.tr('calendar'), //'calendar'.tr(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                      child: Tab(
                        text: localization.tr('map'), //'map'.tr(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                      child: Tab(text: localization.tr('terms') //'terms'.tr(),
                          ),
                    ),
                  ]),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: TabBarView(controller: _tabController, children: [
                    DescriptionChaletScreen(
                      scrllController,
                    ),
                    CalendarChaletScreen(),
                    MapChaletScreen(latitude:  double.parse(ChaletsGetxController.to.chalet.value.latitude), longitude: double.parse(ChaletsGetxController.to.chalet.value.longitude)),
                    TermsChaletScreen(),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
// Widget buttonArrow(){
//   return Container(
//     height: 55,
//     w
//   );
// }
}
