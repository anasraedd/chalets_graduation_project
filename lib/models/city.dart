

class CityInfo {
  late String city;

  CityInfo();

  CityInfo.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }


}