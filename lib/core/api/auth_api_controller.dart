import 'dart:convert';
import 'dart:io';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/user.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper {

  Future<ApiResponse> login(
      {required String keyLogin, required String valueLogin, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri,
        body: {keyLogin: valueLogin, 'password': password},
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      User user = User.fromJson(json['user']);
      SharedPrefController().save(user, AccountType.User);

      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != json['user']['fcm_token']) {

        Uri uri2 = Uri.parse(ApiSettings.changeFcmToken);
        var response = await http.post(uri2,
            body: {'fcm_token': fcmToken,},
            headers: headers);
        var json2 = jsonDecode(response.body);
        if (response.statusCode == 200) {
          print('replaced FCM Token');
          // User user = User.fromJson(json['user'], fcmTokenPassed: fcmToken);
          // SharedPrefController().save(user);
          SharedPrefController().setFcmToken(value: '$fcmToken');
          return ApiResponse('successfully', true);

        }else if (response.statusCode == 400){
          return ApiResponse(json2['message'], false);


        }
      }

      return ApiResponse('successfully', true);
    } else if (response.statusCode == 400) {
      return ApiResponse('${json['message']}', false);
    }
    return errorResponse;
  }


  Future<ApiResponse> register(User user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'username': user.username,
      'mobile': user.mobile,
      'fcm_token': user.fcmToket,
      'email_': 'ans8648@gmail.com',
      'password': user.password,
      'password_confirmation': user.password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });

    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      User user = User.fromJson(json['user']);
      SharedPrefController().save(user, AccountType.User);
      return ApiResponse('successfully', true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }
    return errorResponse;
  }

  Future<ApiResponse> verifyNumberMobile({required String numberPhone}) async {
    Uri uri = Uri.parse('${ApiSettings.verifyMobile}?mobile=$numberPhone');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse('Successfully', true, requestId: json['request_id']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> verifyCheckCode(
      {required String requestId, required String verifyCode}) async {
    Uri uri = Uri.parse(ApiSettings.verifyMobile);
    var response = await http.post(uri,
        body: {'request_id': requestId, 'verify_code': verifyCode},
        headers: {HttpHeaders.acceptHeader: 'application/json'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse('Successfully', true,);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }
    return errorResponse;
  }

  Future<ApiResponse> sendEmailVerify() async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.sendEmailVerify);
    var response = await http.get(uri, headers: headers);
   var json = jsonDecode(response.body);

    if (response.statusCode == 200 ) {

      return ApiResponse('Successfully', true);
    }else if(response.statusCode == 400){
      return ApiResponse(json['massage'], false);

    }
    return errorResponse;
  }

  Future<ApiResponse> logout() async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200 ) {
      SharedPrefController().clear();
      Get.toNamed('/register_or_login_screen');
      return ApiResponse('Logged out successfully', true);
    }else if(response.statusCode == 400){
      return ApiResponse('Failed out successfully', false);
    }
    return errorResponse;
  }


}