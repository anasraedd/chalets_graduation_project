import 'package:chalets/models/chalet/chalet_main_facility_sub_facilities.dart';

class ChaletMainFacilities {
  late int id;
  late int chaletsId;
  late String icon;
  late String title;
  late List<ChaletMainFacilitySubFacilities> chaletMainFacilitySubFacilities;

  // ChaletMainFacilities(
  //     {required this.id,
  //     required this.chaletsId,
  //     required this.icon,
  //     required this.title,
  //     required this.chaletMainFacilitySubFacilities});

  ChaletMainFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chaletsId = json['chalets_id'];
    icon = json['icon'];
    title = json['title'];
    if (json['chalet_main_facility_sub_facilities'] != null) {
      chaletMainFacilitySubFacilities = <ChaletMainFacilitySubFacilities>[];
      json['chalet_main_facility_sub_facilities'].forEach((v) {
        chaletMainFacilitySubFacilities!
            .add(ChaletMainFacilitySubFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['chalets_id'] = chaletsId;
    data['icon'] = icon;
    data['title'] = title;
    data['chalet_main_facility_sub_facilities'] =
        chaletMainFacilitySubFacilities!.map((v) => v.toJson()).toList();
    return data;
  }
}
