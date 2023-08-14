
import 'package:chalets/models/chalet/chalet_have_descount.dart';
import 'package:chalets/models/chalet/random_chalet.dart';

class ChaletHome {
  late List<RandomChaletsHaveDiscount>   randomChaletsHaveDiscount;
  late List<RandomChalets>   randomChalets;


  ChaletHome.fromJson(Map<String, dynamic> json) {
    if (json['random_chalets_have_discount'] != null) {
      randomChaletsHaveDiscount = <RandomChaletsHaveDiscount>[];
      // randomChaletsHaveDiscount.map((e) => RandomChaletsHaveDiscount.fromJson(json)).toList();

      json['random_chalets_have_discount'].forEach((v) {
        randomChaletsHaveDiscount!
            .add(RandomChaletsHaveDiscount.fromJson(v));
      });
    }
    if (json['random_chalets'] != null) {
      randomChalets = <RandomChalets>[];
      json['random_chalets'].forEach((v) {
        randomChalets!.add(RandomChalets.fromJson(v));
      });
    }
  }


}
