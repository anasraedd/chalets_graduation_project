import 'package:chalets/models/chalet/chalet_images.dart';

class RandomChalets {
  late int chaletsId;
  late String name;
  late List<ChaletImages> chaletImages;


  RandomChalets.fromJson(Map<String, dynamic> json) {
    chaletsId = json['chalets_id'];
    name = json['name'];
    if (json['chalet_images'] != null) {
      chaletImages = <ChaletImages>[];
      json['chalet_images'].forEach((v) {
        chaletImages!.add(ChaletImages.fromJson(v));
      });
    }
  }


}