

import 'dart:convert';

import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/city.dart';
import 'package:chalets/models/country.dart';
import 'package:chalets/screens/detailed_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:country_state_city/country_state_city.dart';



class DetailedSearchGetxController extends GetxController{

  RxList<CountryInfo> countries = <CountryInfo>[].obs;

  // RxBool status = true.obs;

  RxBool loadingGetCounties = false.obs;
  RxBool loadingGetCities = false.obs;
  RxBool loadingSearch = false.obs;




  RxBool isExpanded = false.obs;
  RxBool pickCitiesIsExpanded = false.obs;
  RxBool neighborhoodIsExpanded = false.obs;
  RxBool priceRangeIsExpanded = false.obs;
  RxBool isPickRatingExpanded = false.obs;

  RxString countrySelected = 'Pick Country'.obs;
  RxString isoCodeSelected = ''.obs;

  // RxString countrySelected = 'Pick Country'.obs;
  RxString PriceRange = 'Price Range / Half Day'.obs;
  RxString pickCities = "Pick Desired Cities".obs;
  // RxString pickNeighborhood = 'Pick Desired Neighborhood'.obs;
  RxString ratingSelected = 'Pick Rating'.obs;

   TextEditingController startPriceController = TextEditingController(text: '0');
   TextEditingController endPriceController = TextEditingController(text: '800');



  RxList<CityCheck> citiesSelected = <CityCheck>[].obs;


  RxList<CityCheck> cities = <CityCheck>[].obs;
  // RxList<CityCheck> cities = [
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
  // ].obs;

  // List<String> _neighborhoodSelected = [];
  // List<CityCheck> neighborhood = [
  //   CityCheck(name: 'AL-Bireh'),
  //   CityCheck(name: 'Al Balou'),
  //   CityCheck(name: 'Moria'),
  //   CityCheck(name: 'Remal'),
  // ];

  static DetailedSearchGetxController get to => Get.find();


  @override
  void onInit() {
    // TODO: implement onInit
    getCountries();


    // readCountries();
    super.onInit();
  }

  void getCountries() async {
     //countries.value =  await getAllCountries();
    loadingGetCounties.value = true;
    ApiResponse apiResponse = await ChaletsApiController().getCountries();
    countries.value = apiResponse.object;
    loadingGetCounties.value = false;
    // print('vvvvvvvvvvvvvvvvvvvvvvvvi ${countries[0].name}');

  }

  void getCitiesOfCountry({required String country}) async {
     // cities.value = await getCountryCities(isoCodeSelected);
    loadingGetCities.value = true;
    ApiResponse apiResponse = await ChaletsApiController().getCitiesForCountry(country: country);
    cities.value = apiResponse.object;
    loadingGetCities.value = false;
   // print(cities[0].name);
    // cities.value = await getCountryCities(isoCodeSelected.value);

  }



  void searchChalet() async {
    // cities.value = await getCountryCities(isoCodeSelected);
    loadingSearch.value = true;
    ApiResponse apiResponse = await ChaletsApiController().search(country: countrySelected.value, cities: cities.map((element) => element.city).toList(), priceMin:  double.parse(startPriceController.text), priceMax:  double.parse(endPriceController.text));

    loadingSearch.value = false;
    // print(cities[0].name);
    // cities.value = await getCountryCities(isoCodeSelected.value);

  }
//   void readCountries() async {
//   var result = await ChaletsApiController().getCountries();
// result.map((e) => countries.value.add(e));
//
//   }
//   Future<void> getCountries() async {
//
//     try {
//       final response = await http.get(Uri.parse('https://restcountries.com/v2/all'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         print(data);
//         countries.value =  data.map((countryJson) => Country.fromJson(countryJson)).toList();
//       } else {
//         throw Exception('Failed to load countries');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }


}