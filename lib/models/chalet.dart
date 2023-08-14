
import 'package:chalets/models/chalet/chalet_main_facilities.dart';
import 'package:chalets/models/chalet/chalet_policies.dart';
import 'package:chalets/models/chalet/chalet_reservations.dart';
import 'package:chalets/models/chalet/chalet_terms.dart';
import 'package:chalets/models/chalet/chalet_images.dart';

import 'chalet/chalet_prices.dart';

class Chalet{
      late   int   id;
      late String name;
      late String logo;
      late String location;
      late String latitude;
      late String longitude;
      late String country;
      late String city;
      late String description;
      late String space;
      late bool? isFavorite;
      late List<ChaletImages> chaletImages;
      late List<ChaletTerms> chaletTerms;
      late List<ChaletPolicies> chaletPolicies;
      late List<ChaletPrices> chaletPrices;
      late List<ChaletMainFacilities> chaletMainFacilities;
      late List<ChaletReservations> chaletReservations;


      Chalet();


      Chalet.fromJson(Map<String,   dynamic>   json)   {
            id = json['id'];
            name = json['name'];
            logo = json['logo'];
            location = json['location'];
            latitude = json['latitude'];
            longitude = json['longitude'];
            country = json['country'];
            city = json['city'];
            description = json['description'];
            space = json['space'];
            isFavorite = json['is_favorite'];
            chaletImages  =   <ChaletImages>[];
            json['chalet_images'].forEach((v)   {
              chaletImages.add(ChaletImages.fromJson(v));
            });

            // if   (json['chalet_terms']   !=   null)   {
                  chaletTerms   =   <ChaletTerms>[];
                  json['chalet_terms'].forEach((v)   {
                        chaletTerms.add(ChaletTerms.fromJson(v));
                  });
            // }
                  chaletPolicies   =   <ChaletPolicies>[];
                  json['chalet_policies'].forEach((v)   {
                        chaletPolicies.add(ChaletPolicies.fromJson(v));
                  });

                  chaletPrices   =   <ChaletPrices>[];
                  json['chalet_prices'].forEach((v)   {
                        chaletPrices.add(ChaletPrices.fromJson(v));
                  });

                  chaletMainFacilities   =   <ChaletMainFacilities>[];
                  json['chalet_main_facilities'].forEach((v)   {
                        chaletMainFacilities.add(ChaletMainFacilities.fromJson(v));
                  });
                  chaletReservations   =   <ChaletReservations>[];
                  json['chalet_reservations'].forEach((v)   {
                        chaletReservations.add(ChaletReservations.fromJson(v));
                  });
      }



}








