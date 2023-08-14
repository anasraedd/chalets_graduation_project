class ChaletMainFacilitySubFacilities {
  late int id;
  late int chaletsId;
  late String title;


  ChaletMainFacilitySubFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chaletsId = 0; //json['chalets_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['chalets_id'] = chaletsId;
    data['title'] = title;
    return data;
  }
}
