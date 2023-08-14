
import 'dart:convert';
import 'dart:io';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/admin/chalets_info_i_admin.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/create_chalet.dart';
import 'package:chalets/models/image_dynamic.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class AdminChaletsApiController with ApiHelper{


  Future<ApiResponse> chaletsThatIAdmin() async {
    print('chaletsThatIAdmin');
    Uri uri = Uri.parse(ApiSettings.chaletsThatIAdmin);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      List  chaletsThatIAdmin = json['chalets'];

      return ApiResponse<List<ChaletInfoIAdmin>>('Successfully', json['status'], object: chaletsThatIAdmin.map((e) => ChaletInfoIAdmin.fromJson(e)).toList() ); //object: favoriteChaltes.map((e) => ChaletReservations.fromJson(e)).toList()
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> getChalet({required int id}) async {
    print('getChat');
    // String token = SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.getChalet.replaceFirst('{id}', '$id'));
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // jsonDecode(source)
      var json = jsonDecode(response.body);
      var  chaletInfo = json['chalet'];
      print(chaletInfo.toString());
      return ApiResponse<Chalet>('Successfully', json['status'],
          object:  Chalet.fromJson(chaletInfo));
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);


      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }




  Future<ApiResponse> createChalet({required ChaletCreated chaletCreated}) async{
    Uri uri = Uri.parse(ApiSettings.createChalet);

    var request = http.MultipartRequest('POST', uri);

    request.fields['name'] = chaletCreated.name;
    http.MultipartFile imageFile = await http.MultipartFile.fromPath('logo',  chaletCreated.logo);
    request.files.add(imageFile);
    request.fields['location'] = chaletCreated.location;
    request.fields['latitude'] = '${27.759}';
    request.fields['longitude'] = '${50.461}';
    request.fields['country'] = chaletCreated.country;
    request.fields['city'] = chaletCreated.city;
    request.fields['description'] = chaletCreated.description;
    request.fields['space'] = '${chaletCreated.space}';

   // for(var i =0; i< chaletCreated.imagesImage.length; i++){
   //   request.fields['images[${i+1}][order]'] = '${i+1}';
   // }

    for(var i =0; i< chaletCreated.imagesImage.length; i++){
      request.fields['images[${i+1}][order]'] = '${i+1}';
      http.MultipartFile imageFile = await http.MultipartFile.fromPath('images[${i+1}][image]' , chaletCreated.imagesImage[i]);
      request.files.add(imageFile);
    }

    // for(var i =0; i< chaletCreated.chaletMainFacilitiesTitles.length; i++){
    //   http.MultipartFile imageFile = await http.MultipartFile.fromPath('chalet_main_facilities[${i+1}][icon]' , chaletCreated.chaletMainFacilitiesIcons[i]);
    //   request.files.add(imageFile);
    // }

    for(var i =0; i< chaletCreated.chaletMainFacilitiesTitles.length; i++){
      request.fields['chalet_main_facilities[${i+1}][title]'] = chaletCreated.chaletMainFacilitiesTitles[i];

      /*
      chalet_main_facilities[2][chalet_main_facility_sub_facilities][]
       */
      for(var j =0; j< chaletCreated.chaletMainFacilitieschaletSubFacilities[i].length; j++){
        request.fields[' chalet_main_facilities[${i+1}][chalet_main_facility_sub_facilities][${j+1}]'] = chaletCreated.chaletMainFacilitieschaletSubFacilities[i][j];

        // request.fields['chalet_main_facilities[${i+1}][title]'] = chaletCreated.chaletMainFacilitiesIcons[i];

      }
      // http.MultipartFile imageFile = await http.MultipartFile.fromPath('chalet_main_facilities[${i+1}][title]' , chaletCreated.chaletMainFacilitiesIcons[i]);
      // request.files.add(imageFile);
    }


    // request.fields['terms[]'] = chaletCreated.terms as String;


    for(var i =0; i<chaletCreated.terms.length ; i++){
      request.fields['terms[${i+1}]'] = chaletCreated.terms[i];
    }

    for(var i =0; i<chaletCreated.policies.length ; i++){
      request.fields['policies[${i+1}]'] = chaletCreated.policies[i];
    }

    request.fields['prices[saturday_am]'] = chaletCreated.pricesSaturdayAm.toString();
     request.fields['prices[saturday_pm]'] = chaletCreated.pricesSaturdayPm.toString();
     request.fields['prices[sunday_am]'] = chaletCreated.pricesSundayAm.toString();
     request.fields['prices[sunday_pm]'] = chaletCreated.pricesSundayPm.toString();
     request.fields['prices[monday_am]'] = chaletCreated.pricesMondayAm.toString();
     request.fields['prices[monday_pm]'] = chaletCreated.pricesMondayPm.toString();
     request.fields['prices[tuesday_am]'] = chaletCreated.pricesTuesdayAm.toString();
     request.fields['prices[tuesday_pm]'] = chaletCreated.pricesTuesdayPm.toString();
     request.fields['prices[wednesday_am]'] = chaletCreated.pricesWednesdayAm.toString();
     request.fields['prices[wednesday_pm]'] = chaletCreated.pricesWednesdayPm.toString();
     request.fields['prices[thursday_am]'] = chaletCreated.pricesThursdayAm.toString();
     request.fields['prices[thursday_pm]'] = chaletCreated.pricesThursdayPm.toString();
     request.fields['prices[friday_am]'] = chaletCreated.pricesFridayAm.toString();
     request.fields['prices[friday_pm]'] = chaletCreated.pricesFridayPm.toString();




    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    var response = await request.send();


    if(response.statusCode == 200){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

       return ApiResponse('successfully', json['status']);

    }else  if(response.statusCode == 400){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse(json['message'], json['status']);

    }

    return ApiResponse('something_went_wrong', false);

  }

  Future<ApiResponse> updateChaletInformation({required int id, required String logo, required String name,  required String location,
     required double latitude,  required double longitude,
     required String country,  required String city, required String description, required String space, required List<String> terms, required List<String> policies}) async{
    Uri uri = Uri.parse(ApiSettings.updateChaletInformation);

    var request = http.MultipartRequest('POST', uri);

    request.fields['chalets_id'] = '${id}';
    request.fields['name'] = name;

    if(logo.isNotEmpty){
      http.MultipartFile imageFile = await http.MultipartFile.fromPath('logo',  logo);
      request.files.add(imageFile);
    }

    request.fields['location'] = location;
    request.fields['latitude'] = '${22.717}';
    request.fields['longitude'] = '${38.111}';
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['description'] = description;
    request.fields['space'] = '${space}';


    for(var i =0; i< terms.length ; i++){
      request.fields['terms[${i+1}]'] = terms[i];
    }

    for(var i =0; i< policies.length ; i++){
      request.fields['policies[${i+1}]'] = policies[i];
    }

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    var response = await request.send();


    if(response.statusCode == 200){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse('successfully', json['status']);

    }else  if(response.statusCode == 400){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse(json['message'], json['status']);

    }

    return ApiResponse('something_went_wrong', false);

  }


  Future<ApiResponse> edaitImagesChalet({required int chaletId, required List<File> imageFiles}) async {
    Uri uri = Uri.parse(ApiSettings.editChaletImages);

    var request = http.MultipartRequest('POST', uri);
    request.fields['chalets_id'] = '${chaletId}';

    for(int i =0; i< imageFiles.length; i++){
      // if(imagesDynamic[i].pickedImage != null){
        request.fields['images[${i+1}][order]'] = '${i+1}';
        http.MultipartFile imageFile = await http.MultipartFile.fromPath('images[${i+1}][image]' , imageFiles[i].path);
        request.files.add(imageFile);
      // }
    }

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    var response = await request.send();


    if(response.statusCode == 200){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse('successfully', json['status']);

    }else  if(response.statusCode == 400){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse(json['message'], json['status']);

    }

    return ApiResponse('something_went_wrong', false);

  }


  Future<ApiResponse> edaitPricesChalet({required int chaletId,   required double pricesSaturdayAm,
    required double pricesSaturdayPm,
    required double pricesSundayAm,
    required double pricesSundayPm,
    required double pricesMondayAm,
    required double pricesMondayPm,
    required double pricesTuesdayAm,
    required double pricesTuesdayPm,
    required double pricesWednesdayAm,
    required double pricesWednesdayPm,
    required double pricesThursdayAm,
    required double pricesThursdayPm,
    required double pricesFridayAm,
    required double pricesFridayPm,}) async {
    Uri uri = Uri.parse(ApiSettings.editChaletPrices);

    var request = http.MultipartRequest('POST', uri);
    request.fields['chalets_id'] = '${chaletId}';

    request.fields['prices[saturday_am]'] = pricesSaturdayAm.toString();
    request.fields['prices[saturday_pm]'] = pricesSaturdayPm.toString();
    request.fields['prices[sunday_am]'] = pricesSundayAm.toString();
    request.fields['prices[sunday_pm]'] = pricesSundayPm.toString();
    request.fields['prices[monday_am]'] = pricesMondayAm.toString();
    request.fields['prices[monday_pm]'] = pricesMondayPm.toString();
    request.fields['prices[tuesday_am]'] = pricesTuesdayAm.toString();
    request.fields['prices[tuesday_pm]'] = pricesTuesdayPm.toString();
    request.fields['prices[wednesday_am]'] = pricesWednesdayAm.toString();
    request.fields['prices[wednesday_pm]'] = pricesWednesdayPm.toString();
    request.fields['prices[thursday_am]'] = pricesThursdayAm.toString();
    request.fields['prices[thursday_pm]'] = pricesThursdayPm.toString();
    request.fields['prices[friday_am]'] = pricesFridayAm.toString();
    request.fields['prices[friday_pm]'] = pricesFridayPm.toString();

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    var response = await request.send();


    if(response.statusCode == 200){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse('successfully', json['status']);

    }else  if(response.statusCode == 400){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);

      return ApiResponse(json['message'], json['status']);

    }

    return ApiResponse('something_went_wrong', false);

  }

}