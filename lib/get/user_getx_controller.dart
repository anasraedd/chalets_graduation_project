

import 'dart:ffi';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/api/user_api_controller.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/FavoriteChalet.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/financial_transaction.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:get/get.dart';

class UserGetxController extends GetxController {

  RxList myReservations = [].obs;


  RxBool isGetMyReservations = false.obs;

  RxBool loadingMyReservations = false.obs;

  RxBool loadingGetFavoriteChalets = false.obs;
  RxBool loadingGetBlockedChalets = false.obs;



  RxList<FavoriteChalet> favoriteChalets = <FavoriteChalet>[].obs;

  RxList<ChaletInfoChat> blockedChalets = <ChaletInfoChat>[].obs;

  RxBool isGetFavoriteChalets = false.obs;


  RxBool loadingChange = false.obs;

  RxInt reservationsCount = 0.obs;
  RxString   balance = ''.obs;

  RxBool isGetInfoProfile = false.obs;

  RxBool loadingGetInfoAccountBalance = false.obs;
  RxList<FinancialTransaction> financialTransactions = <FinancialTransaction>[].obs;
  RxInt indexSelected = 0.obs;


  RxDouble totalBalance = 0.0.obs;


  Rx<String> firstName = '${SharedPrefController().getValueFor<String>(key: PrefKeys.firstName.name)}'.obs;
  Rx<String> lastName = '${SharedPrefController().getValueFor<String>(key: PrefKeys.lastName.name)}'.obs;
  Rx<String> email = '${SharedPrefController().getValueFor<String>(key: PrefKeys.email.name)}'.obs;
  Rx<String> accountPicture = '${SharedPrefController().getValueFor<String>(key: PrefKeys.accountPicture.name)}'.obs;

  RxBool loadingMyInfoProfile = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit

    //getMyReservations();

    super.onInit();
  }

  static UserGetxController get to => Get.find();


  Future<void> getMyReservations() async {
    loadingMyReservations.value = true;
    ApiResponse apiResponse = await UserApiController().getMyReservations();
    myReservations.value = apiResponse!.object;
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    isGetMyReservations.value = true;
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingMyReservations.value = false;
  }


  Future<void> getFavoriteChaltes() async {
    loadingGetFavoriteChalets.value = true;
    ApiResponse apiResponse = await UserApiController().getFavoriteChaltes();
    favoriteChalets.value = apiResponse!.object;
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    isGetFavoriteChalets.value = true;
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingGetFavoriteChalets.value = false;
  }

  Future<void> getBlockedChaltes() async {
    loadingGetBlockedChalets.value = true;
    ApiResponse apiResponse = await UserApiController().getBlockedChaltes();
    blockedChalets.value = apiResponse!.object;
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');

    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingGetBlockedChalets.value = false;
  }


Future<void> getInfoAccountBalance() async {
    loadingGetInfoAccountBalance.value = true;
    ApiResponse apiResponse = await UserApiController().getInfoAccountBalance();
    if(apiResponse.success){
      financialTransactions.value = apiResponse.object;
      financialTransactions.value.forEach((element) {
        totalBalance.value += double.parse(element.balance);
      });
      loadingGetInfoAccountBalance.value =false;
    }




}

  Future<void> getInfoProfile() async {
    loadingMyInfoProfile.value = true;
    ApiResponse apiResponse = await UserApiController().getInfoProfile();
    reservationsCount.value = apiResponse!.object['chalet_automatic_reservations_count'];
    balance.value = apiResponse!.object['balance'];
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    isGetInfoProfile.value = true;
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingMyInfoProfile.value = false;
  }













}