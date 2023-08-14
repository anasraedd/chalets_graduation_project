import 'dart:io';
import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/chalet/chalet_prices.dart';
import 'package:chalets/models/chalet/chalet_terms.dart';
import 'package:chalets/models/create_chalet.dart';
import 'package:chalets/models/prices_in_am_and_pm.dart';
import 'package:chalets/models/sub_facilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'admin/admin_chalets_getx_Controller.dart';

class CreateChaletGetxController extends GetxController with Helpers {

  // RxList<File> imageFiles = <File>[].obs;

  Rx<File> pickedImage = File('').obs;
  RxBool isPickedImage = false.obs;
  // final BehaviorSubject<XFile?> _rxFile = BehaviorSubject<XFile?>.seeded(null);

  RxBool loadingPickedImages = false.obs;
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   imagePicker = ImagePicker().obs;
  //   super.onInit();
  // }

  TextEditingController nameChaletController = TextEditingController();
  TextEditingController descriptionChaletController = TextEditingController();
  TextEditingController spaceChaletController = TextEditingController();
  TextEditingController addressChaletController = TextEditingController();

  RxString logo = ''.obs;
  RxInt idChalet = 0.obs;

  RxList textEditingControllerTerms = [
    TextEditingController(text: ''),
    TextEditingController(),
  ].obs;
  RxList iconsMainFacilities = [].obs;
  RxList mainFacilities = [
    TextEditingController(text: ''),
    TextEditingController(),
  ].obs;
  RxList subFacilities = [SubFacilities(), SubFacilities()].obs;
  List<List<String>> subFacilitiesTypeText = <List<String>>[];

//['aaaaa', 'bbbbbbbbbb', 'ccccccccccc'], ['aaaaa', 'bbbbbbbbbb', 'ccccccccccc'], ['aaaaa', 'bbbbbbbbbb', 'ccccccccccc']

  void convertSubFacilitiesToString() {
    for (int i = 0; i < subFacilities.length; i++) {
      List<String> listText = [];

      for (var j = 0;
          j < subFacilities[i].listTextEditingControllers.length;
          j++) {
        listText.add(subFacilities[i].listTextEditingControllers[j].text);
      }
      subFacilitiesTypeText.add(listText);
    }

    // subFacilities.forEach((element) {
    //   List list = element.listTextEditingControllers;
    //   List<String> listText = [];
    //   for(var i =0; i< list.length; i++ ){
    //     subFacilitiesTypeText.add(list[i].text);
    //   }
    //   // subFacilitiesTypeText.add(listText);
    //
    // });
  }

  RxList textTerms = ['', ''].obs;

  RxDouble swipeThreshold = 100.0.obs;

  RxDouble startX = 0.0.obs;
  RxBool isSwipe = false.obs;
  RxInt indexSwipe = 0.obs;

  // RxDouble swipeThresholdForSubFacilities = 100.0.obs;
  //
  // RxDouble startXForSubFacilities = 0.0.obs;
  // RxBool isSwipeForSubFacilities = false.obs;
  // RxInt indexSwipeForSubFacilities = 0.obs;

  RxList textEditingControllerPolicy =
      [TextEditingController(text: ''), TextEditingController()].obs;
  RxList textPolicy = ['', ''].obs;
  RxDouble swipeThresholdPolicy = 100.0.obs;

  RxDouble startXPolicy = 0.0.obs;
  RxBool isSwipePolicy = false.obs;
  RxInt indexSwipePolicy = 0.obs;

  RxList<File> imageFiles = <File>[].obs;
  RxList selectedImageFiles = [].obs;
  RxInt indexFirstImage = 0.obs;
  RxBool firstImageIsSelected = false.obs;
  RxBool isAllowSelect = false.obs;

  static CreateChaletGetxController get to => Get.find();

  // List<String> get listPaths {
  //   return imageFiles.map((element) => element.path).toList();
  // }

  RxInt currentIndex = 0.obs;

  Rx<ChaletPrices> chaletPrices = ChaletPrices().obs;
  RxList<PricesOfAMAndPM> listPricesOfAMAndPM = <PricesOfAMAndPM>[
    PricesOfAMAndPM(
        dayName: lang.tr('saturday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(
          text: '',
        ),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('sunday'),
        priceInAMEnabled: true.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('monday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('thesday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('wednesday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('thursday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
    PricesOfAMAndPM(
        dayName: lang.tr('friday'),
        priceInAMEnabled: false.obs,
        priceInPMEnabled: false,
        priceInAM: TextEditingController(text: ''),
        priceInPM: TextEditingController(text: ''),
        focusNodeAM: FocusNode(),
        focusNodePM: FocusNode()),
  ].obs;

  RxList statusPricesOfAMControllers = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  RxList statusPricesOfPMControllers = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  RxBool focusNodeEnable = false.obs;
  RxInt indexFocus = 0.obs;

  Future<ApiResponse> createChalet() async {
    convertSubFacilitiesToString();
    ApiResponse result = await AdminChaletsApiController().createChalet(
        chaletCreated: ChaletCreated(
      name: nameChaletController.text,
      logo: pickedImage.value.path,
      location: addressChaletController.text,
      latitude: '14.023',
      longitude: '38.1',
      country: 'Palestine',
      city: 'Gaza',
      description: descriptionChaletController.text,
      space: double.parse(spaceChaletController.text),
      imagesImage: imageFiles.map((element) => element.path).toList(),
      //[imageFiles[0].path, imageFiles[1].path],
      // chaletMainFacilitiesIcons: [imageFiles[0].path, imageFiles[1].path,],
      chaletMainFacilitiesTitles:
          mainFacilities.map((element) => element.text.toString()).toList(),
      // chaletMainFacilitieschaletSubFacilities: [['SubFacilities1_1', 'SubFacilities1-2', 'SubFacilities1-3'], ['SubFacilities1_1', 'SubFacilities1-2', 'SubFacilities1-3']],
      terms: textEditingControllerTerms
          .map((element) => element.text.toString())
          .toList(),
      policies: textEditingControllerPolicy
          .map((element) => element.text.toString())
          .toList(),
      chaletMainFacilitieschaletSubFacilities: subFacilitiesTypeText,
      pricesSaturdayAm:
          double.parse('${listPricesOfAMAndPM[0].priceInAM!.text}'),
      pricesSaturdayPm:
          double.parse('${listPricesOfAMAndPM[0].priceInPM!.text}'),
      pricesSundayAm: double.parse('${listPricesOfAMAndPM[1].priceInAM!.text}'),
      pricesSundayPm: double.parse('${listPricesOfAMAndPM[1].priceInPM!.text}'),
      pricesMondayAm: double.parse('${listPricesOfAMAndPM[2].priceInAM!.text}'),
      pricesMondayPm: double.parse('${listPricesOfAMAndPM[2].priceInPM!.text}'),
      pricesTuesdayAm:
          double.parse('${listPricesOfAMAndPM[3].priceInAM!.text}'),
      pricesTuesdayPm:
          double.parse('${listPricesOfAMAndPM[3].priceInPM!.text}'),
      pricesWednesdayAm:
          double.parse('${listPricesOfAMAndPM[4].priceInAM!.text}'),
      pricesWednesdayPm:
          double.parse('${listPricesOfAMAndPM[4].priceInPM!.text}'),
      pricesThursdayAm:
          double.parse('${listPricesOfAMAndPM[5].priceInAM!.text}'),
      pricesThursdayPm:
          double.parse('${listPricesOfAMAndPM[5].priceInPM!.text}'),
      pricesFridayAm: double.parse('${listPricesOfAMAndPM[6].priceInAM!.text}'),
      pricesFridayPm: double.parse('${listPricesOfAMAndPM[6].priceInPM!.text}'),
      chaletMainFacilitiesIcons: [
        imageFiles[0].path,
        imageFiles[0].path,
        imageFiles[0].path
      ],
    )

        // pricesSaturdayAm: 555, pricesSaturdayPm: 300,
        // pricesSundayAm: 500, pricesSundayPm: 300,
        // pricesMondayAm: 500, pricesMondayPm: 300,
        // pricesTuesdayAm: 500, pricesTuesdayPm: 300,
        // pricesWednesdayAm: 500, pricesWednesdayPm: 300,
        // pricesThursdayAm: 500, pricesThursdayPm: 300,
        // pricesFridayAm: 500, pricesFridayPm: 500,

        );

    print(result.message);
    if (result.success) {
      Get.back();
      showSnackBarByGet(title: 'Successfully');
      return result;
    } else {
      Get.back();
      showSnackBarByGet(title: result.message, error: true);
      return result;
    }
  }


  Future<ApiResponse> updateChaletInformation() async {

  ApiResponse apiResponse = await  AdminChaletsApiController().updateChaletInformation(id: idChalet.value, logo: pickedImage.value.path,
        name: nameChaletController.text, location: addressChaletController.text, latitude: 51.248, longitude: 47.265,
        country: 'Palestine', city: 'Gaza', description: descriptionChaletController.text, space: spaceChaletController.text,
      terms: textEditingControllerTerms
          .map((element) => element.text.toString())
          .toList(),
      policies: textEditingControllerPolicy
          .map((element) => element.text.toString())
          .toList());
  if(apiResponse.success){
    // AdminChaletsGetxController.to.chaletForManage.value.name =  nameChaletController.text;
    // if(logo.isNotEmpty){
    //   AdminChaletsGetxController.to.chaletForManage.value.logo =  logo.value;
    // }
    // AdminChaletsGetxController.to.chaletForManage.value.location =  addressChaletController.text;
    // AdminChaletsGetxController.to.chaletForManage.value.latitude = '${51.248}';
    // AdminChaletsGetxController.to.chaletForManage.value.longitude =  '${47.265}';
    // // AdminChaletsGetxController.to.chaletForManage.value.country =  nameChaletController.text;
    // AdminChaletsGetxController.to.chaletForManage.value.description =  descriptionChaletController.text;
    // AdminChaletsGetxController.to.chaletForManage.value.space =  spaceChaletController.text;
    // for(int i =0; i< textEditingControllerTerms.value.length; i++){
    //   if(i <   AdminChaletsGetxController.to.chaletForManage.value.chaletTerms.length){
    //     AdminChaletsGetxController.to.chaletForManage.value.chaletTerms[i].term =textEditingControllerTerms.value[i].text;
    //
    //   }else{
    //     ChaletTerms chaletTerms = ChaletTerms();
    //     chaletTerms.id =  AdminChaletsGetxController.to.chaletForManage.value.chaletTerms[i].id;
    //     chaletTerms.chaletsId =  AdminChaletsGetxController.to.chaletForManage.value.chaletTerms[i].chaletsId;
    //     chaletTerms.term =  AdminChaletsGetxController.to.chaletForManage.value.chaletTerms[i].term;
    //
    //     AdminChaletsGetxController.to.chaletForManage.value.chaletTerms.add(chaletTerms);
    //   }
   // }


    // AdminChaletsGetxController.to.chaletForManage.value.chaletTerms = textEditingControllerTerms.map((element) => element.text).toList()




    // AdminChaletsGetxController.to.nameChalet.value = nameChaletController.text;
    AdminChaletsGetxController.to.logoChalet.value = pickedImage.value.path;
  }

  return apiResponse;
  }

 void editChaletInformation({required Chalet chalet}){

   idChalet.value = chalet.id;
    logo.value = chalet.logo;
    nameChaletController.text = chalet.name;
    descriptionChaletController.text = chalet.description;
    spaceChaletController.text = chalet.space;
    addressChaletController.text = chalet.location;

   // for(int i =0; i < textEditingControllerTerms.length; i++){
   //   textEditingControllerTerms[i].text =chalet.chaletTerms[i].term;
   // }

    for(int i =0; i < chalet.chaletTerms.length; i++){
      if(i >= textEditingControllerTerms.length){
        textEditingControllerTerms.add(TextEditingController(text: chalet.chaletTerms[i].term));
      }else{
        textEditingControllerTerms[i].text =chalet.chaletTerms[i].term;

      }
    }

    for(int i =0; i < chalet.chaletPolicies.length; i++){
      if(i >= textEditingControllerPolicy.length){
        textEditingControllerPolicy.add(TextEditingController(text: chalet.chaletPolicies[i].policy));
      }else{
        textEditingControllerPolicy[i].text =chalet.chaletPolicies[i].policy;

      }
    }

    // textEditingControllerTerms.forEach((element) { }) = chalet.chaletTerms.map((e) => e.term).toList();
    // textEditingControllerTerms.forEach((element) {
    //   textEditingControllerTerms.text = chalet.chaletTerms.term;
    // });

 }

  void editChaletFacility({required Chalet chalet}){

    // idChalet.value = chalet.id;
    // logo.value = chalet.logo;
    // nameChaletController.text = chalet.name;
    // descriptionChaletController.text = chalet.description;
    // spaceChaletController.text = chalet.space;
    // addressChaletController.text = chalet.location;

    // for(int i =0; i < textEditingControllerTerms.length; i++){
    //   textEditingControllerTerms[i].text =chalet.chaletTerms[i].term;
    // }

    for(int i =0; i < chalet.chaletMainFacilities.length; i++){
      if(i >= mainFacilities.length){
        mainFacilities.add(TextEditingController(text: chalet.chaletMainFacilities[i].title));
      }else{
        mainFacilities[i].text =chalet.chaletMainFacilities[i].title;
      }

      // for(int j =0; j< chalet.chaletMainFacilities[i].chaletMainFacilitySubFacilities.length;j++){
      //   if(j >= subFacilities.length){ //chalet.chaletMainFacilities[i].chaletMainFacilitySubFacilities.length
      //     subFacilities[i].listTextEditingControllers.add(TextEditingController(text: chalet.chaletMainFacilities[i].chaletMainFacilitySubFacilities[j].title));
      //   }else{
      //     subFacilities[i].listTextEditingControllers[j].text =chalet.chaletMainFacilities[i].chaletMainFacilitySubFacilities[j].title;
      //
      //   }
      // }
    }

    // for(int i =0; i < chalet.chaletPolicies.length; i++){
    //   if(i >= textEditingControllerPolicy.length){
    //     textEditingControllerPolicy.add(TextEditingController(text: chalet.chaletPolicies[i].policy));
    //   }else{
    //     textEditingControllerPolicy[i].text =chalet.chaletPolicies[i].policy;
    //
    //   }
    // }

    // textEditingControllerTerms.forEach((element) { }) = chalet.chaletTerms.map((e) => e.term).toList();
    // textEditingControllerTerms.forEach((element) {
    //   textEditingControllerTerms.text = chalet.chaletTerms.term;
    // });

  }


}
