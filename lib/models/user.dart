
import 'dart:ffi';

class User{
  late int id;
  String? email, password, gender;
  late String username, firstName, lastName, mobile, datebirth, token, fcmToket;
  late int balance;
  late String accountPicture;
  String? updatedAt;
  String? createdAt;


  User();

  User.fromJson(Map<String, dynamic> json, {String? fcmTokenPassed}) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    datebirth = json['birthday'];
    balance = json['balance'] ;
    accountPicture = json['account_picture'];
    // updatedAt = json['updated_at'];
    // createdAt = json['created_at'];

    token = json['token'];
    fcmToket = fcmTokenPassed ?? json['fcm_token'];
  }


}

