

import 'package:chalets/core/api/chalets_api_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:get/get.dart';

class ChaletsGetxController extends GetxController {
  RxList<Chalet> favoriteChalets = <Chalet>[].obs;
  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  final ChaletsApiController _chaletsApiController = ChaletsApiController();
  Rx<Chalet> chalet = Chalet().obs;

  Rx<String> selectReservedDateStart = ''.obs;
  Rx<String> selectReservedDateEnd = ''.obs;
  Rx<String> selectReservedPeriodStart = ''.obs;
  Rx<String> selectReservedPeriodEnd = ''.obs;

  RxInt enabledClick = 0.obs;
  RxBool allowChangeStartPeriod = true.obs;
  RxBool allowChangeEndPeriod = true.obs;

RxBool showMessageError = false.obs;

  RxBool showFacilities = true.obs;

  RxInt page =0.obs;

  RxBool showChoices = false.obs;



  static ChaletsGetxController get to => Get.find();

  @override
  void onInit() {
   // read();
    super.onInit();
  }

  Future<void> read({required int id}) async {
   loading.value = true;
   ApiResponse apiResponse = await ChaletsApiController().getChaletById(id: id);
   chalet.value = apiResponse!.object;
    isFavorite.value = chalet.value.isFavorite!;
    // print('isFavorite: ${chalet.value.isFavorite}');

   //favoriteChalets.value = await _chaletsApiController.readFavorite();
   loading.value = false;
  }

  Future<ApiResponse> addChaletInFavorite({required String chaletId}) async {
    ApiResponse apiResponse =
        await _chaletsApiController.addChaletAsFavorite(id: chaletId);

    if (apiResponse.success) {
      // favoriteChalets.add(chalet);
      // isFavorite.value = true;


    }

    return apiResponse;
  }


  Future<ApiResponse> deleteChaletFromFavorite({required String chaletId}) async {
    ApiResponse apiResponse = await _chaletsApiController.deleteChaletFromFavorite(id: chaletId);
    if(apiResponse.success){
      // favoriteChalets.remove(index);
    }

    return apiResponse;

  }
}
