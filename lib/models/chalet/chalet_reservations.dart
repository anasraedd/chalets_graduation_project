class ChaletReservations {
   int? id;
  late String startAt;
  late String endAt;
  late String periodStart;
  late String periodEnd;


  ChaletReservations(
      {required this.id, required this.startAt, required this.endAt, required this.periodStart, required this.periodEnd});

  ChaletReservations.fromJson(Map<String, dynamic> json) {
    startAt = json['start_at'];
    endAt = json['end_at'];
    periodStart = json['period_start'];
    periodEnd = json['period_end'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['start_at'] = startAt;
  //   data['end_at'] = endAt;
  //   data['period_start'] = periodStart;
  //   data['period_end'] = periodEnd;
  //   return data;
  // }
}
