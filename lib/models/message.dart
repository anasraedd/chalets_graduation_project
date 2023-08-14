

class Message{
  late int idMessage;
  late String messageBy;
  late String textMessage;
  late DateTime dateTimeMessage;
  // List<String>? images;


/*
user_chalet_messages: [{id: 86, message: مرحبا كيفك, message_by: User, created_at: 2023-08-08T10:54:47.000000Z}, {id: 87, message: مرحبا كيفك, message_by: User, created_at: 2023-08-08T10:55:14.000000Z}, {id: 88, message: مرحبا كيفك غالي والله, message_by: User, created_at: 2023-08-08T10:55:31.000000Z}, {id: 89, message: لالافففففاغ, message_by: User, created_at: 2023-08-08T11:02:17.000000Z}]}
 */

  Message();
  Message.fromJson(Map<String, dynamic> json) {
    idMessage = json['id'];
    messageBy = json['message_by'];
    textMessage = json['message'];
    dateTimeMessage = DateTime.parse(json['created_at']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['logo'] = this.logo;
  //   data['name'] = this.name;
  //   return data;
  // }
}