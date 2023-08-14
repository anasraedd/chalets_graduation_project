
import 'package:chalets/models/chalet/chalet_images.dart';

class RandomChaletsHaveDiscount {
  late int  chaletsId;
  late List<ChaletImages>  chaletImages;
  late List<ChaletPrices>  chaletPrices;


  RandomChaletsHaveDiscount.fromJson(Map<String, dynamic> json) {
    chaletsId = json['chalets_id'];
    if (json['chalet_images'] != null) {
      chaletImages = <ChaletImages>[];
      json['chalet_images'].forEach((v) {
        chaletImages!.add(ChaletImages.fromJson(v));
      });
    }
    if (json['chalet_prices'] != null) {
      chaletPrices = <ChaletPrices>[];
      json['chalet_prices'].forEach((v) {
        chaletPrices!.add(ChaletPrices.fromJson(v));
      });
    }
  }


}



class ChaletPrices {
  late int  id;
  late List<ChaletPriceDiscountCodes>  chaletPriceDiscountCodes;


  ChaletPrices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['chalet_price_discount_codes'] != null) {
      chaletPriceDiscountCodes = <ChaletPriceDiscountCodes>[];
      json['chalet_price_discount_codes'].forEach((v) {
        chaletPriceDiscountCodes!.add(ChaletPriceDiscountCodes.fromJson(v));
      });
    }
  }

}
class ChaletPriceDiscountCodes {
  late String  code;
  late String  percent;


  ChaletPriceDiscountCodes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    percent = json['percent'];
  }

}