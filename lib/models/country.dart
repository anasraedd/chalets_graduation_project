class CountryInfo {
  late String country;

  CountryInfo();

  CountryInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }


}

