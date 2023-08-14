
import 'dart:convert';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/FavoriteChalet.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/chalet/chalet_reservations.dart';
import 'package:http/http.dart' as http;

class UserApiController with ApiHelper{


  Future<ApiResponse> getMyReservations() async {
    print('getMyReservations');
    Uri uri = Uri.parse(ApiSettings.myReservations);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
     List  reservations = json['chalet_automatic_reservations'];
      print(json.toString());
      return ApiResponse<List<ChaletReservations>>('Successfully', json['status'],
          object: reservations.map((e) => ChaletReservations.fromJson(e)).toList() );
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }

  Future<ApiResponse> getFavoriteChaltes() async {
    print('getFavoriteChaltes');
    // String token = SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.getFavoriteChaltes);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
       List  favoriteChaltes = json['chalets'];

      return ApiResponse<List<FavoriteChalet>>('Successfully', json['status'], object: favoriteChaltes.map((e) => FavoriteChalet.fromJson(e)).toList() ); //object: favoriteChaltes.map((e) => ChaletReservations.fromJson(e)).toList()
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> changeField({required String nameKey, required String field, required String url}) async {
    Uri uri = Uri.parse(ApiSettings.pofile.replaceFirst('{field}', url));
    var response = await http.post(uri,
        body: {
          nameKey: field
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


  Future<ApiResponse> changePassword({required String currentPassword, required String newPassword, required String newPasswordConfirmation}) async {
    Uri uri = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(uri,
        body: {
      'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirmation': newPasswordConfirmation
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

  Future<ApiResponse> getInfoProfile() async {
    print('getInfoProfile');
    // String token = SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.pofile.replaceFirst('{field}', 'user_profile_details'));
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // List  reservations = json['chalet_automatic_reservations'];
      print(json.toString());
      return ApiResponse<Map<String, dynamic>>('Successfully', json['status'],
          object: json );
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> getBlockedChaltes() async {
    print('getBlockedChaltes');
    Uri uri = Uri.parse(ApiSettings.chaletBlock);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      List  blockedChaltes = json['chalets'];

      return ApiResponse<List<ChaletInfoChat>>('Successfully', json['status'], object: blockedChaltes.map((e) => ChaletInfoChat.fromJson(e)).toList() ); //object: favoriteChaltes.map((e) => ChaletReservations.fromJson(e)).toList()
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> blockChalet({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.chaletBlock);
    var response = await http.post(uri,
        body: {
          'chalets_id': '$id',
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


  Future<ApiResponse> unBlockChalet({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.chaletBlock);
    var response = await http.delete(uri,
        body: {
          'chalets_id': '$id',
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








}