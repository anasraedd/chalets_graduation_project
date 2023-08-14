

import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet/chalet_have_descount.dart';
import 'package:chalets/models/chalet/chalet_home.dart';
import 'package:chalets/models/chalet/random_chalet.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChaletsHomeGetxController extends GetxController {
  // RxList<Chalet> favoriteChalets = <Chalet>[].obs;
  RxBool loading = false.obs;

  RxList randomChaletsHaveDiscount = [].obs;
  RxList randomChalets = [].obs;

  RxInt indexChaletsHaveDiscount = 0.obs;
  RxInt indexRandomChalets = 0.obs;



  // final ChaletsApiController _chaletsApiController = ChaletsApiController();
  //


  static ChaletsHomeGetxController get to => Get.find();

  @override
  void onInit() {
    //read();
    super.onInit();
  }

  Future<void> read() async {
    loading.value = true;
    ApiResponse apiResponse =await ChaletsApiController().getChaletsForHomePage();
    // ChaletHome chaletHome = apiResponse!.object;
   if(apiResponse.success){
     randomChaletsHaveDiscount.value = apiResponse!.object.randomChaletsHaveDiscount;
     randomChalets.value = apiResponse!.object.randomChalets;
   }



    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loading.value = false;
  }

  // Future<ApiResponse> addChaletinFavorite(Chalet chalet) async {
  //   ApiResponse apiResponse =
  //   await _chaletsApiController.addChaletAsFavorite(chalet.id);
  //
  //   if (apiResponse.success) {
  //     favoriteChalets.add(chalet);
  //   }
  //
  //   return apiResponse;
  // }
  //
  //
  // Future<ApiResponse> deleteChaletFromFavorite(int index) async {
  //   ApiResponse apiResponse = await _chaletsApiController.deleteChaletFromFavorite(id: favoriteChalets[index].id);
  //   if(apiResponse.success){
  //     favoriteChalets.remove(index);
  //   }
  //
  //   return apiResponse;
  //
  // }
}
