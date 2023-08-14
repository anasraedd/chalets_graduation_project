import 'dart:convert';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/utils/api_helper.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/api_response.dart';
import 'package:http/http.dart' as http;

class ChatApiController with ApiHelper {


  Future<ApiResponse> getChat({required int id}) async {
    print('getChat');
    // String token = SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.getChat.replaceFirst('{id}', '$id'));
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // var  chaletInfo = json['chalet'];
      print(json.toString());
      return ApiResponse<Map<String, dynamic>>('Successfully', json['status'],
          object:  json);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }

  Future<ApiResponse> getConversation() async {
    print('getConversation');
    Uri uri = Uri.parse(ApiSettings.getConversation);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json.toString());
      List  conversationInfo = json['chalets_have_messages'];

      return ApiResponse<List<ChaletInfoChat>>('Successfully', json['status'], object: conversationInfo.map((e) => ChaletInfoChat.fromJson(e)).toList() ); //object: favoriteChaltes.map((e) => ChaletReservations.fromJson(e)).toList()

    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json.toString());

      return ApiResponse('${json['message']}', json['status']);
    }

    return errorResponse;
  }


  Future<ApiResponse> sendMessage({required int id, required String message}) async {
    Uri uri = Uri.parse(ApiSettings.sendMessage);
    var response = await http.post(uri,
        body: {
          'chalets_id': '$id',
          'message': message
        },
        headers: headers);

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


   void sendPushMessage({required String title, required String body, required String token}) async {
      Uri uri = Uri.parse('https://fcm.googleapis.com/fcm/send');
      await http.post(uri, headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAAi0oNpYM:APA91bEnY1Cp7CSfG8tmpl8LzaNH423B4I_MrRhxVa5qiMAyvp7W5GMFfj-0Df4-Wy-nAi-i5Gu73-l-Fab9ZRwlaWTluvYKMvdmV3R1fN3z3_aIwJraQ1zBFK-6FyUG5nMVK8dZ8uJ4'
      }, body: jsonEncode( <String, dynamic>{
        'priority': 'high',
        'status': 'done',
        'title': title,
        'body': body,
        "notification": <String, dynamic>{
          'title': title,
          'body': body,
          'android_channel_id': "chatId$token"
        },
        'to': token

      },
      ));

  }
}