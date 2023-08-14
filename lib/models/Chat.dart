class Chat {
  late ChaletInfoChat chalet;
  late List<Null> userChaletMessages;


  // Chat.fromJson(Map<String, dynamic> json) {
  //   chalet =
  //   json['chalet'] != null  new ChaletInfoChat.fromJson(json['chalet']) : null;
  //   if (json['user_chalet_messages'] != null) {
  //     userChaletMessages = <Null>[];
  //     json['user_chalet_messages'].forEach((v) {
  //       userChaletMessages!.add(new Null.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //
  //   if (this.chalet != null) {
  //     data['chalet'] = this.chalet!.toJson();
  //   }
  //   if (this.userChaletMessages != null) {
  //     data['user_chalet_messages'] =
  //         this.userChaletMessages!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}


class ChaletInfoChat {
  late int id;
  late String logo;
  late String name;

  ChaletInfoChat();

  ChaletInfoChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['name'] = this.name;
    return data;
  }
}