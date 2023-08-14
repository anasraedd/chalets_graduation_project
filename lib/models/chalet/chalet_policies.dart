class ChaletPolicies {
  late int id;
  late int chaletsId;
  late String policy;

  ChaletPolicies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chaletsId = json['chalets_id'];
    policy = json['policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chalets_id'] = chaletsId;
    data['policy'] = policy;
    return data;
  }
}