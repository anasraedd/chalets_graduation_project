class ChaletPrices {
    late int id;
    late int chaletsId;
    late String averagePrice;
    late String saturdayAm;
    late String saturdayPm;
    late String sundayAm;
    late String sundayPm;
    late String mondayAm;
    late String mondayPm;
    late String tuesdayAm;
    late String tuesdayPm;
    late String wednesdayAm;
    late String wednesdayPm;
    late String thursdayAm;
    late String thursdayPm;
    late String fridayAm;
    late String fridayPm;

    ChaletPrices();

 // ChaletPrices(
 //     {required this.id,
 //     required this.chaletsId,
 //     required this.averagePrice,
 //     required this.saturdayAm,
 //     required this.saturdayPm,
 //     required this.sundayAm,
 //     required this.sundayPm,
 //     required this.mondayAm,
 //     required this.mondayPm,
 //     required this.tuesdayAm,
 //     required this.tuesdayPm,
 //     required this.wednesdayAm,
 //     required this.wednesdayPm,
 //     required this.thursdayAm,
 //     required this.thursdayPm,
 //     required this.fridayAm,
 //     required this.fridayPm});

  ChaletPrices.fromJson(
    Map<String, dynamic> json)

    {
        id = json['id'];
        chaletsId = json['chalets_id'];
        averagePrice = json['average_price'];
        saturdayAm = json['saturday_am'];
        saturdayPm = json['saturday_pm'];
        sundayAm = json['sunday_am'];
        sundayPm = json['sunday_pm'];
        mondayAm = json['monday_am'];
        mondayPm = json['monday_pm'];
        tuesdayAm = json['tuesday_am'];
        tuesdayPm = json['tuesday_pm'];
        wednesdayAm = json['wednesday_am'];
        wednesdayPm = json['wednesday_pm'];
        thursdayAm = json['thursday_am'];
        thursdayPm = json['thursday_pm'];
        fridayAm = json['friday_am'];
        fridayPm = json['friday_pm'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map < String, dynamic>();
        data['id'] = id;
        data['chalets_id'] = chaletsId;
        data['average_price'] = averagePrice;
        data['saturday_am'] = saturdayAm;
        data['saturday_pm'] = saturdayPm;
        data['sunday_am'] = sundayAm;
        data['sunday_pm'] = sundayPm;
        data['monday_am'] = mondayAm;
        data['monday_pm'] = mondayPm;
        data['tuesday_am'] = tuesdayAm;
        data['tuesday_pm'] = tuesdayPm;
        data['wednesday_am'] = wednesdayAm;
        data['wednesday_pm'] = wednesdayPm;
        data['thursday_am'] = thursdayAm;
        data['thursday_pm'] = thursdayPm;
        data['friday_am'] = fridayAm;
        data['friday_pm'] = fridayPm;
        return data;
    }
}
