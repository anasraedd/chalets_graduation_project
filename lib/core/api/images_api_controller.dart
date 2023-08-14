import 'dart:convert';
import 'dart:io';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class ImageApiController with ApiHelper, Helpers{
  Future<ApiResponse> uploadImage({required String path}) async{
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));

    var request = http.MultipartRequest('POST', uri);
    http.MultipartFile imageFile = await http.MultipartFile.fromPath('image', path);

    request.files.add(imageFile);

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    var response = await request.send();

    if(response.statusCode == 201){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);
      return ApiResponse('successfully', json['status']);

    }

    return ApiResponse('something_went_wrong'.tr(), false);

  }


  ///not to use
  Future<List> getImages() async {
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      var data = json['data'] as List;
      return data;
    }
    return [];
  }

  Future<ApiResponse> deleteImage({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
    var response = await http.delete(uri, headers: headers);
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }


  Future<ApiResponse> uploadImageProfile({required String path}) async{
    Uri uri = Uri.parse(ApiSettings.changePicture);

    var request = http.MultipartRequest('POST', uri);
    http.MultipartFile imageFile = await http.MultipartFile.fromPath('account_picture', path);

    //request.fields['account_picture'] = imageFile as String;


    // showSnackBarByGet(title: 'Successfully Changed Image Prifile', error: false);

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    request.files.add(imageFile);

    var response = await request.send();

    if(response.statusCode == 200){
      String body = await response.stream.transform(utf8.decoder).first;
      var json = jsonDecode(body);
      return ApiResponse<String>('successfully', json['status'], object: json['account_picture']);

    }

    return ApiResponse('something_went_wrong'.tr(), false);

  }

}