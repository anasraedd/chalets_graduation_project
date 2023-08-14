

class ChaletInfoIAdmin {
  late int id;
  late String logo;
  late String name;

  ChaletInfoIAdmin();

  ChaletInfoIAdmin.fromJson(Map<String, dynamic> json) {
    id = json['chalets_id'];
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