import 'dart:convert';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/models/country.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/chalet/chalet_home.dart';
import 'package:chalets/models/chalet/chalet_reservations.dart';
import 'package:chalets/screens/detailed_search_screen.dart';
import 'package:http/http.dart' as http;

class ChaletsApiController with ApiHelper {

  Future<ApiResponse> getChaletsForHomePage() async {
    print('getChaletsForHomePage');
    Uri uri = Uri.parse(ApiSettings.getChaletsForHomePage);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      return ApiResponse<ChaletHome>('Successfully', json['status'],
          object: ChaletHome.fromJson(json));
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }

  Future<ApiResponse> getChaletById({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.getChaletById}$id');
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      return ApiResponse<Chalet>('Successfully', json['status'],
          object: Chalet.fromJson(json['chalet']));
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> addChaletAsFavorite({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.addOrDeleteChaletFavotite);
    var response = await http.post(uri,
        body: {
          'chalets_id': id,
        },
        headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse('Successfully', json['status']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }


  Future<ApiResponse> deleteChaletFromFavorite({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.addOrDeleteChaletFavotite);
    var response = await http.delete(uri,
        body: {
          'chalets_id': id,
        },
        headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse('Successfully', json['status']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }



  Future<ApiResponse> reserveChalet({required ChaletReservations chaletReservations}) async {
    Uri uri = Uri.parse(ApiSettings.reserveChalet);
    var response = await http.post(uri,
        body: {
          'chalets_id': chaletReservations.id.toString(),
          'start_at': chaletReservations.startAt,
          'period_start': chaletReservations.periodStart,
          'end_at': chaletReservations.endAt,
          'period_end': chaletReservations.periodEnd,
          'details': 'no details',
          'total_price': '100'

        },

        headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse('Successfully', json['status']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }


  Future<ApiResponse> getCountries() async {
    Uri uri = Uri.parse('${ApiSettings.getCounties}');
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      List countriesJson = json['countries'];

      return ApiResponse<List<CountryInfo>>('Successfully', json['status'],
          object: countriesJson.map((e) => CountryInfo.fromJson(e)).toList());
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }

  Future<ApiResponse> getCitiesForCountry({required String country}) async {
    Uri uri = Uri.parse(ApiSettings.getCiriesForCountry.replaceFirst('{country}', country));
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      List citiesJson = json['cities'];

      return ApiResponse<List<CityCheck>>('Successfully', json['status'],
          object: citiesJson.map((e) => CityCheck.fromJson(e)).toList());

    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> search({required String country, required List<String> cities, required double priceMin, required double priceMax}) async {
    Uri uri = Uri.parse('${ApiSettings.researchedChalets}names[]=name&country=$country&cities[]=$cities&price_min=$priceMin&price_max=$priceMax');

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return ApiResponse('Successfully', json['status']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }
}
