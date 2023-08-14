
class ChaletCreated{
  late String name;
  late String logo;
  late String location;
  late String latitude;
  late String longitude;
  late String country;
  late String city;
  late String description;
  late double space;

  // late List<int> imagesOrder;
  late List<String> imagesImage;

  late List<String> chaletMainFacilitiesIcons;
  late List<String> chaletMainFacilitiesTitles;
  late List<List<String>> chaletMainFacilitieschaletSubFacilities;

  late List<String> terms;
  late List<String> policies;


  late double pricesSaturdayAm;
  late double pricesSaturdayPm;
  late double pricesSundayAm;
  late double pricesSundayPm;
  late double pricesMondayAm;
  late double pricesMondayPm;
  late double pricesTuesdayAm;
  late double pricesTuesdayPm;
  late double pricesWednesdayAm;
  late double pricesWednesdayPm;
  late double pricesThursdayAm;
  late double pricesThursdayPm;
  late double pricesFridayAm;
  late double pricesFridayPm;

  ChaletCreated({
     required this.name,
     required this.logo,
     required this.location,
     required this.latitude,
     required this.longitude,
     required this.country,
     required this.city,
     required this.description,
     required this.space,
     // required this.imagesOrder,
     required this.imagesImage,
     required this.chaletMainFacilitiesIcons,
     required this.chaletMainFacilitiesTitles,
     required this.chaletMainFacilitieschaletSubFacilities,
     required this.terms,
     required this.policies,
     required this.pricesSaturdayAm,
     required this.pricesSaturdayPm,
     required this.pricesSundayAm,
     required this.pricesSundayPm,
     required this.pricesMondayAm,
     required this.pricesMondayPm,
     required this.pricesTuesdayAm,
     required this.pricesTuesdayPm,
     required this.pricesWednesdayAm,
     required this.pricesWednesdayPm,
     required this.pricesThursdayAm,
     required this.pricesThursdayPm,
     required this.pricesFridayAm,
     required this.pricesFridayPm});
}