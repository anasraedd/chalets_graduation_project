import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/detailed_search_getx_controller.dart';
import 'package:chalets/widgets/PriceSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';

class DetailedSearchScreen extends StatefulWidget {
  const DetailedSearchScreen({Key? key}) : super(key: key);

  @override
  State<DetailedSearchScreen> createState() => _DetailedSearchScreenState();
}

class CityCheck {
  late String city;
  bool isCheck = false;

  // CityCheck({required this.name, this.isCheck = false});
  CityCheck.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }
}

class _DetailedSearchScreenState extends State<DetailedSearchScreen> {


  // @override
  // void initState() {
  //   super.initState();
  //   startPriceController = TextEditingController();
  //   startPriceController.text = '0\$'; // Set the initial value here
  //   endPriceController = TextEditingController();
  //   endPriceController.text = '800\$';
  //   // _startValue =  double.parse('${startPriceController.text}');
  //   // _endValue =  double.parse('${endPriceController.text}');
  // }
  //
  // @override
  // void dispose() {
  //   startPriceController.dispose();
  //   endPriceController.dispose();
  //   super.dispose();
  // }

  // double _value = 0.0;
  // final TextEditingController userNameController =
  //     TextEditingController(text: 'anasdrfeel');
  // bool _isExpanded = false;
  // bool _pickCitiesIsExpanded = false;
  // bool _neighborhoodIsExpanded = false;
  // bool _priceRangeIsExpanded = false;
  // bool _isPickRatingExpanded = false;

  // String _countrySelected = 'Pick Country';
  // String _PriceRange = 'Price Range / Half Day';

  // String _pickCities = "Pick Desired Cities";
  String _pickNeighborhood = 'Pick Desired Neighborhood';

  // String _ratingSelected = 'Pick Rating';

  // List<String> _countries = [
  //   "United States",
  //   "Canada",
  //   "Mexico",
  //   "Brazil",
  //   "Argentina",
  //   "Chile",
  //   "United Kingdom",
  //   "France",
  //   "Germany",
  //   "Spain",
  //   "Italy",
  //   "Japan",
  //   "China",
  //   "South Korea",
  //   "Australia",
  //   "New Zealand"
  // ];

  List<String> _citiesSelected = [];

  // List<CityCheck> cities = [
  //   CityCheck(name: 'Jerusalem'),
  //   CityCheck(name: 'Hebron'),
  //   CityCheck(name: 'Ramallah'),
  //   CityCheck(name: 'Gaza'),
  //   CityCheck(name: 'Nablus'),
  //   CityCheck(name: 'Bethlehem'),
  //   CityCheck(name: 'Jenin'),
  //   CityCheck(name: 'Tulkarm'),
  //   CityCheck(name: 'Qalqilya'),
  //   CityCheck(name: 'Jericho'),
  //   CityCheck(name: 'Jenin'),
  //   CityCheck(name: 'Jenin'),
  // ];

  // List<String> _neighborhoodSelected = [];
  // List<CityCheck> neighborhood = [
  //   CityCheck(name: 'AL-Bireh'),
  //   CityCheck(name: 'Al Balou'),
  //   CityCheck(name: 'Moria'),
  //   CityCheck(name: 'Remal'),
  // ];

  @override
  Widget build(BuildContext context) {
    context.settingsStatusBarInScreen(isDark: true, color: Colors.transparent);
    //  var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 96.h,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/appbar_for_detailed_search_screen.png",
                ),
              )),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Detailed Search',
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: GetX<DetailedSearchGetxController>(
                    init: DetailedSearchGetxController(),
                    builder: (DetailedSearchGetxController controller) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                            "${controller.countrySelected}"),
                                        trailing: Icon(controller
                                                    .isExpanded.value &&
                                                controller.countries.isNotEmpty
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down),
                                        onTap: () {
                                          // setState(() {
                                          controller.isExpanded.value =
                                              !controller.isExpanded.value;
                                          if (controller.isExpanded.value &&
                                              controller.countries.isNotEmpty) {
                                            if (controller.countrySelected ==
                                                'Pick Country') {
                                              controller.countrySelected.value =
                                                  '';
                                            }
                                          } else {
                                            if (controller.countrySelected ==
                                                '') {
                                              controller.countrySelected.value =
                                                  'Pick Country';
                                            }
                                          }
                                          // });
                                        },
                                      ),
                                    ),
                                    if (controller.isExpanded.value &&
                                        controller.countries.isNotEmpty)
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        color: Color(0xFFF5F8FF),
                                        child: Text('Pick Country'),
                                      ),
                                  ]),
                                  if (controller.isExpanded.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      height: 200,
                                      child: controller.loadingGetCounties.isFalse ? ScrollConfiguration(
                                        behavior: MyBehavior(),
                                        child: ListView.builder(
                                          itemCount:
                                          controller.countries.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(
                                              title: Text(controller
                                                  .countries[index].country),
                                              onTap: () {
                                                // setState(() {
                                                controller
                                                    .countrySelected.value =
                                                    controller
                                                        .countries[index].country;
                                                controller.isoCodeSelected.value = controller.countries[index].country;
                                                controller.getCitiesOfCountry(
                                                    country: controller
                                                        .countries[index]
                                                        .country);

                                                controller.cities.clear();
                                                // });
                                                // Do something when a country is tapped
                                              },
                                            );
                                          },
                                        ),
                                      ): Center(child: CircularProgressIndicator()),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            //  margin: EdgeInsets.only(top: 10.h, bottom: 10.h, ),

                                            // padding: EdgeInsets.all(5),
                                            child: Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                margin: EdgeInsets.only(
                                                    top: 10.h, bottom: 10.h),
                                                child: controller.citiesSelected
                                                        .isNotEmpty
                                                    ? ScrollConfiguration(
                                                        behavior: MyBehavior(),
                                                        child: GridView.count(
                                                          shrinkWrap: true,
                                                          crossAxisCount: 3,
                                                          childAspectRatio: 3,
                                                          children: controller
                                                              .citiesSelected
                                                              .map((choice) {
                                                            return Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[500],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.r),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  choice.city,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(controller
                                                            .pickCities.value),
                                                      ),
                                              ),
                                            ),
                                          ),

                                          Visibility(
                                            visible: controller
                                                .citiesSelected.isNotEmpty,
                                            child: GestureDetector(
                                                onTap: () {
                                                  // setState(() {
                                                  controller.citiesSelected
                                                      .clear();
                                                  for (var i
                                                      in controller.cities) {
                                                    i.isCheck = false;
                                                  }

                                                  controller.pickCities.value =
                                                      '';
                                                  // });
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.red,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: SizedBox(
                                                  height: 50,
                                                  child: VerticalDivider(
                                                    width: 1,
                                                    color: Colors.black,
                                                  ))),
                                          //     Container(width: 10,  child: ,),
                                          Container(
                                            // margin: EdgeInsets.only(left: 340.w, top: 8.h),

                                            child: Center(
                                              child: GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    if (controller
                                                            .countrySelected
                                                            .value
                                                            .isNotEmpty &&
                                                        controller
                                                                .countrySelected
                                                                .value !=
                                                            'Pick Country') {
                                                      controller.isExpanded
                                                          .value = false;
                                                      controller
                                                              .pickCitiesIsExpanded
                                                              .value =
                                                          !controller
                                                              .pickCitiesIsExpanded
                                                              .value;
                                                      if (controller
                                                          .pickCitiesIsExpanded
                                                          .value) {
                                                        controller.pickCities
                                                            .value = '';
                                                      } else {
                                                        controller.pickCities
                                                                .value =
                                                            'Pick Desired Cities';
                                                      }
                                                    }

                                                    //  });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Icon(controller
                                                            .pickCitiesIsExpanded
                                                            .value
                                                        ? Icons.arrow_drop_up
                                                        : Icons
                                                            .arrow_drop_down),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (controller.pickCitiesIsExpanded.value )
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        color: Color(0xFFF5F8FF),
                                        child: Text('Multiline Cities Picked'),
                                      ),
                                  ]),
                                  if (controller.pickCitiesIsExpanded.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      height: 200,
                                      child: controller.loadingGetCities.isFalse ? ScrollConfiguration(
                                        behavior: MyBehavior(),
                                        child: ListView.builder(
                                          itemCount: controller.cities.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(

                                              leading: Checkbox(
                                                value: controller.cities[index].isCheck,
                                                //controller.cities[index].isCheck,
                                                onChanged: (bool? value) {

                                                },
                                              ),
                                              title: Text(controller
                                                  .cities[index].city),
                                              onTap: () {
                                                setState(() {
                                                  setState(() {
                                                    controller.cities[index]
                                                        .isCheck =
                                                    !controller
                                                        .cities[index]
                                                        .isCheck;
                                                    if (controller
                                                        .citiesSelected
                                                        .contains(controller
                                                        .cities[index]
                                                    )) {
                                                      //_citiesSelected.add(CityChech(name: cities[index], isChech: false));
                                                      // _citiesSelected.map((e) {
                                                      //   if(e.name ==  cities[index]){
                                                      //
                                                      //   }
                                                      // });

                                                      controller.citiesSelected
                                                          .removeWhere(
                                                              (element) =>
                                                          element.city ==
                                                              controller
                                                                  .cities[
                                                              index].city);
                                                    } else {
                                                      if (controller
                                                          .cities[index]
                                                          .isCheck)
                                                        controller
                                                            .citiesSelected
                                                            .add(controller
                                                            .cities[index]);
                                                    }
                                                  });
                                                  // cities.map((e) {
                                                  //   if(e == cities[index]){
                                                  //
                                                  //   }
                                                  // });
                                                });
                                                // Do something when a country is tapped
                                              },
                                            );
                                          },
                                        ),
                                      ): Center(child: CircularProgressIndicator()),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                                "${controller.PriceRange}"),
                                            trailing: Container(
                                              width: controller
                                                          .PriceRange.value ==
                                                      'Price Range / Half Day'
                                                  ? 27.w
                                                  : 55.w,
                                              child: Row(
                                                children: [
                                                  Visibility(
                                                    visible: controller
                                                                .PriceRange
                                                                .value !=
                                                            'Price Range / Half Day' &&
                                                        !controller
                                                            .priceRangeIsExpanded
                                                            .value,
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          // setState(() {
                                                          controller.PriceRange
                                                                  .value =
                                                              'Price Range / Half Day';
                                                          // });
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: Colors.red,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // setState(() {
                                                      controller
                                                              .priceRangeIsExpanded
                                                              .value =
                                                          !controller
                                                              .priceRangeIsExpanded
                                                              .value;
                                                      if (controller
                                                          .priceRangeIsExpanded
                                                          .value) {
                                                        // if (_PriceRange == 'Price Range / Half Day') {
                                                        controller.PriceRange
                                                            .value = '';
                                                        // }
                                                      } else {
                                                        // if (_PriceRange == '') {
                                                        controller.PriceRange
                                                                .value =
                                                            '${controller.startPriceController.text} - ${controller.endPriceController.text}';
                                                        // }
                                                      }
                                                      // });
                                                    },
                                                    child: Icon(controller
                                                            .priceRangeIsExpanded
                                                            .value
                                                        ? Icons.arrow_drop_up
                                                        : Icons
                                                            .arrow_drop_down),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                          if (controller
                                              .priceRangeIsExpanded.value)
                                            PriceRangeSlider(
                                                controller.startPriceController,
                                                controller.endPriceController)
                                        ],
                                      ),
                                    ),
                                    if (controller.priceRangeIsExpanded.value)
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        color: Color(0xFFF5F8FF),
                                        child: Text('Price Range / Half Day'),
                                      ),
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  /*
                                Stack(children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text("${controller.ratingSelected}"),
                                          trailing: Icon(controller.isPickRatingExpanded.value
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down),
                                          onTap: () {
                                            // setState(() {
                                              controller.isPickRatingExpanded.value =
                                              !controller.isPickRatingExpanded.value;

                                              if (controller.isPickRatingExpanded.value) {
                                                if (controller.ratingSelected ==
                                                    'Pick Rating') {
                                                  controller.ratingSelected.value == 'All';
                                                }
                                              }
                                            // });
                                          },
                                        ),
                                        if (controller.isPickRatingExpanded.value)
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 25,
                                                right: 30,
                                                left: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                      controller.ratingSelected.value = '+6';
                                                    // });
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.w,
                                                          vertical: 5.h),
                                                      child: Text(
                                                        '+6',
                                                        style:
                                                        GoogleFonts.inter(
                                                          color: Color(
                                                              0xFF262626),
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 4,
                                                        color:
                                                        controller.ratingSelected.value ==
                                                            '+6'
                                                            ? primaryColor
                                                            : Color(
                                                            0xFF262626),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7.5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                      controller.ratingSelected.value = '+7';
                                                    // });
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.w,
                                                          vertical: 5.h),
                                                      child: Text(
                                                        '+7',
                                                        style:
                                                        GoogleFonts.inter(
                                                          color: Color(
                                                              0xFF262626),
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 4,
                                                        color:
                                                        controller.ratingSelected.value ==
                                                            '+7'
                                                            ? primaryColor
                                                            : Color(
                                                            0xFF262626),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7.5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                      controller.ratingSelected.value = '+8';
                                                   // });
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.w,
                                                          vertical: 5.h),
                                                      child: Text(
                                                        '+8',
                                                        style:
                                                        GoogleFonts.inter(
                                                          color: Color(
                                                              0xFF262626),
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 4,
                                                        color:
                                                        controller.ratingSelected.value ==
                                                            '+8'
                                                            ? primaryColor
                                                            : Color(
                                                            0xFF262626),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7.5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                      controller.ratingSelected.value = '+9';
                                                    // });
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.w,
                                                          vertical: 5.h),
                                                      child: Text(
                                                        '+9',
                                                        style:
                                                        GoogleFonts.inter(
                                                          color: Color(
                                                              0xFF262626),
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 4,
                                                        color:
                                                        controller.ratingSelected.value ==
                                                            '+9'
                                                            ? primaryColor
                                                            : Color(
                                                            0xFF262626),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7.5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                      controller.ratingSelected.value = 'All';
                                                    // });
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.w,
                                                          vertical: 5.h),
                                                      child: Text(
                                                        'All',
                                                        style:
                                                        GoogleFonts.inter(
                                                          color: Color(
                                                              0xFF262626),
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 4,
                                                        color: controller.ratingSelected.value ==
                                                            'Pick Rating' ||
                                                            controller.ratingSelected.value ==
                                                                'All'
                                                            ? primaryColor
                                                            : Color(
                                                            0xFF262626),
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  if (controller.isPickRatingExpanded.value)
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: Color(0xFFF5F8FF),
                                      child: Text('Pick Rating'),
                                    ),
                                ]),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: (){
            Get.toNamed('result_research');
          },
          child: SvgPicture.asset('assets/images/polygon_btn_go.svg')),
      // if(controller.status.value){
      //
      // }
      // else{
      //   return Center(child: CircularProgressIndicator(),);
      // }
    );
  }
}

/*
 GetX<ChaletsHomeGetxController>(
        init: ChaletsHomeGetxController(),
        builder: (ChaletsHomeGetxController controller) {
          // if( controller.loading.value) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }else {
          return
 */

/*
  Stack(children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          //  margin: EdgeInsets.only(top: 10.h, bottom: 10.h, ),

                                          // padding: EdgeInsets.all(5),
                                          child: Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              margin: EdgeInsets.only(
                                                  top: 10.h, bottom: 10.h),
                                              child: _neighborhoodSelected
                                                  .isNotEmpty
                                                  ? ScrollConfiguration(
                                                behavior: MyBehavior(),
                                                child: GridView.count(
                                                  shrinkWrap: true,
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 3,
                                                  children:
                                                  _neighborhoodSelected
                                                      .map(
                                                          (choice) {
                                                        return Container(
                                                          margin: EdgeInsets
                                                              .all(3),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .grey[500],
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              choice,
                                                              style:
                                                              TextStyle(
                                                                fontSize:
                                                                14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                ),
                                              )
                                                  : Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Text(
                                                    _pickNeighborhood),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Visibility(
                                          visible: _neighborhoodSelected
                                              .isNotEmpty,
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _neighborhoodSelected
                                                      .clear();
                                                  for (var i
                                                  in neighborhood) {
                                                    i.isCheck = false;
                                                  }

                                                  _pickNeighborhood = '';
                                                });
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: SizedBox(
                                                height: 50,
                                                child: VerticalDivider(
                                                  width: 1,
                                                  color: Colors.black,
                                                ))),
                                        //     Container(width: 10,  child: ,),
                                        Container(
                                          // margin: EdgeInsets.only(left: 340.w, top: 8.h),

                                          child: Center(
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _neighborhoodIsExpanded =
                                                    !_neighborhoodIsExpanded;
                                                    if (_neighborhoodIsExpanded) {
                                                      _pickNeighborhood = '';
                                                    } else {
                                                      _pickNeighborhood =
                                                      'Pick Desired Cities';
                                                    }
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 15),
                                                  child: Icon(
                                                      _neighborhoodIsExpanded
                                                          ? Icons
                                                          .arrow_drop_up
                                                          : Icons
                                                          .arrow_drop_down),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_neighborhoodIsExpanded)
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: Color(0xFFF5F8FF),
                                      child: Text(
                                          'Multiline Neighborhoods Picked'),
                                    ),
                                ]),
                                if (_neighborhoodIsExpanded)
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    height: 200,
                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.builder(
                                        itemCount: neighborhood.length,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return ListTile(
                                            leading: Checkbox(
                                              value:
                                              neighborhood[index].isCheck,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  neighborhood[index]
                                                      .isCheck =
                                                  !neighborhood[index]
                                                      .isCheck;
                                                  if (_neighborhoodSelected
                                                      .contains(
                                                      neighborhood[index]
                                                          .name)) {
                                                    _neighborhoodSelected
                                                        .removeWhere(
                                                            (element) =>
                                                        element ==
                                                            neighborhood[
                                                            index]
                                                                .name);
                                                  } else {
                                                    if (neighborhood[index]
                                                        .isCheck)
                                                      _neighborhoodSelected
                                                          .add(neighborhood[
                                                      index]
                                                          .name);
                                                  }
                                                });
                                              },
                                            ),
                                            title: Text(
                                                neighborhood[index].name),
                                            onTap: () {
                                              setState(() {
                                                // cities.map((e) {
                                                //   if(e == cities[index]){
                                                //
                                                //   }
                                                // });
                                              });
                                              // Do something when a country is tapped
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  height: 10,
                                ),
 */
