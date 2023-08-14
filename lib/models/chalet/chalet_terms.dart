class ChaletTerms {
  late int id;
  late int chaletsId;
  late String term;

  ChaletTerms();
  ChaletTerms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chaletsId = json['chalets_id'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chalets_id'] = chaletsId;
    data['term'] = term;
    return data;
  }
}