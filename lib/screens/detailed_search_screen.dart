import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/widgets/PriceSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';

class DetailedSearchScreen extends StatefulWidget {
  const DetailedSearchScreen({Key? key}) : super(key: key);

  @override
  State<DetailedSearchScreen> createState() => _DetailedSearchScreenState();
}

class CityCheck {
  late String name;
  late bool isCheck;

  CityCheck({required this.name, this.isCheck = false});
}

class _DetailedSearchScreenState extends State<DetailedSearchScreen> {
  late TextEditingController startPriceController;
  late TextEditingController endPriceController;

  @override
  void initState() {
    super.initState();
    startPriceController = TextEditingController();
    startPriceController.text = '0\$'; // Set the initial value here
    endPriceController = TextEditingController();
    endPriceController.text = '800\$';
    // _startValue =  double.parse('${startPriceController.text}');
    // _endValue =  double.parse('${endPriceController.text}');
  }

  @override
  void dispose() {
    startPriceController.dispose();
    endPriceController.dispose();
    super.dispose();
  }

  double _value = 0.0;
  final TextEditingController userNameController =
      TextEditingController(text: 'anasdrfeel');
  bool _isExpanded = false;
  bool _pickCitiesIsExpanded = false;
  bool _neighborhoodIsExpanded = false;
  bool _priceRangeIsExpanded = false;
  bool _isPickRatingExpanded = false;

  String _countrySelected = 'Pick Country';
  String _PriceRange = 'Price Range / Half Day';

  String _pickCities = "Pick Desired Cities";
  String _pickNeighborhood = 'Pick Desired Neighborhood';

  String _ratingSelected = 'Pick Rating';

  List<String> _countries = [
    "United States",
    "Canada",
    "Mexico",
    "Brazil",
    "Argentina",
    "Chile",
    "United Kingdom",
    "France",
    "Germany",
    "Spain",
    "Italy",
    "Japan",
    "China",
    "South Korea",
    "Australia",
    "New Zealand"
  ];

  List<String> _citiesSelected = [];
  List<CityCheck> cities = [
    CityCheck(name: 'Jerusalem'),
    CityCheck(name: 'Hebron'),
    CityCheck(name: 'Ramallah'),
    CityCheck(name: 'Gaza'),
    CityCheck(name: 'Nablus'),
    CityCheck(name: 'Bethlehem'),
    CityCheck(name: 'Jenin'),
    CityCheck(name: 'Tulkarm'),
    CityCheck(name: 'Qalqilya'),
    CityCheck(name: 'Jericho'),
    CityCheck(name: 'Jenin'),
    CityCheck(name: 'Jenin'),
  ];

  List<String> _neighborhoodSelected = [];
  List<CityCheck> neighborhood = [
    CityCheck(name: 'AL-Bireh'),
    CityCheck(name: 'Al Balou'),
    CityCheck(name: 'Moria'),
    CityCheck(name: 'Remal'),
  ];

  @override
  Widget build(BuildContext context) {
    //  var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 96.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              title: Text("$_countrySelected"),
                              trailing: Icon(_isExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down),
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                  if (_isExpanded) {
                                    if (_countrySelected == 'Pick Country') {
                                      _countrySelected = '';
                                    }
                                  } else {
                                    if (_countrySelected == '') {
                                      _countrySelected = 'Pick Country';
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                          if (_isExpanded)
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xFFF5F8FF),
                              child: Text('Pick Country'),
                            ),
                        ]),
                        if (_isExpanded)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 200,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                itemCount: _countries.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(_countries[index]),
                                    onTap: () {
                                      setState(() {
                                        _countrySelected = _countries[index];
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
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //  margin: EdgeInsets.only(top: 10.h, bottom: 10.h, ),

                                  // padding: EdgeInsets.all(5),
                                  child: Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      margin: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      child: _citiesSelected.isNotEmpty
                                          ? ScrollConfiguration(
                                              behavior: MyBehavior(),
                                              child: GridView.count(
                                                shrinkWrap: true,
                                                crossAxisCount: 3,
                                                childAspectRatio: 3,
                                                children: _citiesSelected
                                                    .map((choice) {
                                                  return Container(
                                                    margin: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[500],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        choice,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(_pickCities),
                                            ),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: _citiesSelected.isNotEmpty,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _citiesSelected.clear();
                                          for (var i in cities) {
                                            i.isCheck = false;
                                          }

                                          _pickCities = '';
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
                                    padding: EdgeInsets.symmetric(vertical: 5),
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
                                            _pickCitiesIsExpanded =
                                                !_pickCitiesIsExpanded;
                                            if (_pickCitiesIsExpanded) {
                                              _pickCities = '';
                                            } else {
                                              _pickCities =
                                                  'Pick Desired Cities';
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(_pickCitiesIsExpanded
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_pickCitiesIsExpanded)
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xFFF5F8FF),
                              child: Text('Multiline Cities Picked'),
                            ),
                        ]),
                        if (_pickCitiesIsExpanded)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 200,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                itemCount: cities.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Checkbox(
                                      value: cities[index].isCheck,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          cities[index].isCheck =
                                              !cities[index].isCheck;
                                          if (_citiesSelected
                                              .contains(cities[index].name)) {
                                            //_citiesSelected.add(CityChech(name: cities[index], isChech: false));
                                            // _citiesSelected.map((e) {
                                            //   if(e.name ==  cities[index]){
                                            //
                                            //   }
                                            // });

                                            _citiesSelected.removeWhere(
                                                (element) =>
                                                    element ==
                                                    cities[index].name);
                                          } else {
                                            if (cities[index].isCheck)
                                              _citiesSelected
                                                  .add(cities[index].name);
                                          }
                                        });
                                      },
                                    ),
                                    title: Text(cities[index].name),
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
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //  margin: EdgeInsets.only(top: 10.h, bottom: 10.h, ),

                                  // padding: EdgeInsets.all(5),
                                  child: Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      margin: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      child: _neighborhoodSelected.isNotEmpty
                                          ? ScrollConfiguration(
                                              behavior: MyBehavior(),
                                              child: GridView.count(
                                                shrinkWrap: true,
                                                crossAxisCount: 3,
                                                childAspectRatio: 3,
                                                children: _neighborhoodSelected
                                                    .map((choice) {
                                                  return Container(
                                                    margin: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[500],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        choice,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(_pickNeighborhood),
                                            ),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: _neighborhoodSelected.isNotEmpty,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _neighborhoodSelected.clear();
                                          for (var i in neighborhood) {
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
                                    padding: EdgeInsets.symmetric(vertical: 5),
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
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(_neighborhoodIsExpanded
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_neighborhoodIsExpanded)
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xFFF5F8FF),
                              child: Text('Multiline Neighborhoods Picked'),
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 200,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                itemCount: neighborhood.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Checkbox(
                                      value: neighborhood[index].isCheck,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          neighborhood[index].isCheck =
                                              !neighborhood[index].isCheck;
                                          if (_neighborhoodSelected.contains(
                                              neighborhood[index].name)) {
                                            _neighborhoodSelected.removeWhere(
                                                (element) =>
                                                    element ==
                                                    neighborhood[index].name);
                                          } else {
                                            if (neighborhood[index].isCheck)
                                              _neighborhoodSelected.add(
                                                  neighborhood[index].name);
                                          }
                                        });
                                      },
                                    ),
                                    title: Text(neighborhood[index].name),
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
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("$_PriceRange"),
                                  trailing: Container(
                                    width:
                                        _PriceRange == 'Price Range / Half Day'
                                            ? 27.w
                                            : 55.w,
                                    child: Row(
                                      children: [
                                        Visibility(
                                          visible: _PriceRange !=
                                                  'Price Range / Half Day' &&
                                              !_priceRangeIsExpanded,
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _PriceRange =
                                                      'Price Range / Half Day';
                                                });
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
                                            setState(() {
                                              _priceRangeIsExpanded =
                                                  !_priceRangeIsExpanded;
                                              if (_priceRangeIsExpanded) {
                                                // if (_PriceRange == 'Price Range / Half Day') {
                                                _PriceRange = '';
                                                // }
                                              } else {
                                                // if (_PriceRange == '') {
                                                _PriceRange =
                                                    '${startPriceController.text} - ${endPriceController.text}';
                                                // }
                                              }
                                            });
                                          },
                                          child: Icon(_priceRangeIsExpanded
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                if (_priceRangeIsExpanded)
                                  PriceRangeSlider(
                                      startPriceController, endPriceController)
                              ],
                            ),
                          ),
                          if (_priceRangeIsExpanded)
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xFFF5F8FF),
                              child: Text('Price Range / Half Day'),
                            ),
                        ]),
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("$_ratingSelected"),
                                  trailing: Icon(_isPickRatingExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down),
                                  onTap: () {
                                    setState(() {
                                      _isPickRatingExpanded = !_isPickRatingExpanded;


                                      if (_isPickRatingExpanded) {

                                        if (_ratingSelected == 'Pick Rating') {
                                          _ratingSelected == 'All';
                                        }
                                      }

                                    });
                                  },
                                ),
                                if(_isPickRatingExpanded)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25, right: 30, left: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                         setState(() {
                                           _ratingSelected = '+6';
                                         });
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                                            child: Text('+6', style: GoogleFonts.inter(
                                              color: Color(0xFF262626),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp,
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 4, color: _ratingSelected == '+6' ?primaryColor : Color(0xFF262626), ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
SizedBox(width: 7.5,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _ratingSelected = '+7';
                                          });

                                        },
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                                            child: Text('+7', style: GoogleFonts.inter(
                                              color: Color(0xFF262626),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp,
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 4, color: _ratingSelected == '+7' ?primaryColor : Color(0xFF262626), ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 7.5,),
                                      GestureDetector(
                                        onTap: (){

                                         setState(() {
                                           _ratingSelected = '+8';
                                         });
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                                            child: Text('+8', style: GoogleFonts.inter(
                                              color: Color(0xFF262626),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp,
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 4, color: _ratingSelected == '+8' ?primaryColor : Color(0xFF262626), ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 7.5,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _ratingSelected = '+9';
                                          });
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                                            child: Text('+9', style: GoogleFonts.inter(
                                              color: Color(0xFF262626),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp,
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 4, color:  _ratingSelected == '+9' ?primaryColor : Color(0xFF262626), ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 7.5,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _ratingSelected = 'All';
                                          });
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                                            child: Text('All', style: GoogleFonts.inter(
                                              color: Color(0xFF262626),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp,
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 4, color: _ratingSelected == 'Pick Rating' || _ratingSelected == 'All' ?primaryColor : Color(0xFF262626), ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          if (_isPickRatingExpanded)
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xFFF5F8FF),
                              child: Text('Pick Rating'),
                            ),
                        ]),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

