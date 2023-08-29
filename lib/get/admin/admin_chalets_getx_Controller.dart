
import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/models/admin/ChaletPendingReservations.dart';
import 'package:chalets/models/admin/chalets_info_i_admin.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:chalets/models/chalet_reservation_notification.dart';
import 'package:get/get.dart';

class AdminChaletsGetxController extends GetxController with Helpers{
  RxList<ChaletInfoIAdmin> chaletsInfoIAdmin = <ChaletInfoIAdmin>[].obs;
  RxBool loadedChaletsInfoIAdmin = false.obs;
  Rx<Chalet> chaletForManage = Chalet().obs;

  RxString logoChalet = ''.obs;
  RxString nameChalet = ''.obs;

  RxBool loadedGetchaletToManage = false.obs;

  RxBool loadedGetCopoun = false.obs;
  RxList chaletPriceActiveDiscountCodes = [].obs;
  RxList chaletPriceExpiredDiscountCodes = [].obs;
  RxBool expiredCouponSelected = false.obs;

  RxBool loadingReservations = false.obs;
  RxBool loadingChaletReservationNotifications = false.obs;

  RxInt selectedStatusReservation = 0.obs;



  RxList chaletReservations = [].obs;


  RxList<ChaletNotoficationsReservations> chaletPendingReservations = <ChaletNotoficationsReservations>[].obs;
  RxList<ChaletNotoficationsReservations> chaletAcceptedReservations = <ChaletNotoficationsReservations>[].obs;
  RxList<ChaletNotoficationsReservations> chaletCompletedReservations = <ChaletNotoficationsReservations>[].obs;
  RxList<ChaletNotoficationsReservations> chaletCanceledReservations = <ChaletNotoficationsReservations>[].obs;




  static AdminChaletsGetxController get to => Get.find();

  @override
  void onInit() {
    chaletsThatIAdmin();
    super.onInit();
  }


  void chaletsThatIAdmin() async {
    loadedChaletsInfoIAdmin.value = true;
   ApiResponse apiResponse = await AdminChaletsApiController().chaletsThatIAdmin();
   chaletsInfoIAdmin.value = apiResponse!.object;
    loadedChaletsInfoIAdmin.value = false;

  }


  void getchaletToManage({required int id}) async {
    loadedGetchaletToManage.value = true;
    ApiResponse apiResponse = await AdminChaletsApiController().getChalet(id: id);
    chaletForManage.value = apiResponse!.object;
    loadedGetchaletToManage.value = false;
    // showSnackBarByGet(title: '${chaletForManage.value.chaletPrices[0].fridayAm}');
  }


  void getPriceDiscountCodes({required int id}) async {
    loadedGetCopoun.value = true;
    ApiResponse apiResponse = await AdminChaletsApiController().getPriceDiscountCodes(chaletsId: id);
    chaletPriceActiveDiscountCodes.value = apiResponse!.object['chalet_price_active_discount_codes'];
    chaletPriceExpiredDiscountCodes.value = apiResponse!.object['chalet_price_expired_discount_codes'];
    loadedGetCopoun.value = false;
    // showSnackBarByGet(title: '${chaletForManage.value.chaletPrices[0].fridayAm}');
  }


  Future<void> getChaletReservations() async {
    loadingReservations.value = true;
    ApiResponse apiResponse = await AdminChaletsApiController().getChaletReservations(id: chaletForManage.value.id);
    chaletReservations.value = apiResponse!.object;
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    // isGetReservations.value = true;
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingReservations.value = false;
  }

  Future<void> chaletReservationNotifications() async {
    loadingChaletReservationNotifications.value = true;
    ApiResponse apiResponse = await AdminChaletsApiController().chaletReservationNotifications(chaletsId: chaletForManage.value.id);
    List pendingReservations = apiResponse!.object['chalet_pending_reservations'];
    if(pendingReservations.isNotEmpty) {
      chaletPendingReservations.value = pendingReservations.map((e) =>
          ChaletNotoficationsReservations.fromJson(e))
          .toList(); //apiResponse!.object['chalet_pending_reservations'] ;
      print(apiResponse!.object['chalet_pending_reservations']);
    }
    List acceptedReservations = apiResponse!.object['chalet_Accepted_reservations'];
    if(acceptedReservations.isNotEmpty){
      chaletAcceptedReservations.value = acceptedReservations.map((e) => ChaletNotoficationsReservations.fromJson(e)).toList(); //apiResponse!.object['chalet_pending_reservations'] ;

    }

    List completedReservations = apiResponse!.object['chalet_Completed_reservations'];
    if(completedReservations.isNotEmpty) {
      chaletCompletedReservations.value = completedReservations.map((e) =>
          ChaletNotoficationsReservations.fromJson(e))
          .toList(); //apiResponse!.object['chalet_pending_reservations'] ;
    }

    List canceledReservations = apiResponse!.object['chalet_Canceled_reservations'];
    if(canceledReservations.isNotEmpty) {
      chaletCanceledReservations.value = canceledReservations.map((e) =>
          ChaletNotoficationsReservations.fromJson(e))
          .toList(); //apiResponse!.object['chalet_pending_reservations'] ;
    }
    // chaletAcceptedReservations.value = apiResponse!.object['chalet_Accepted_reservations'];
    // chaletCompletedReservations.value = apiResponse!.object['chalet_Completed_reservations'];
    // chaletCanceledReservations.value = apiResponse!.object['chalet_Canceled_reservations'];

    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    // isGetReservations.value = true;
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingChaletReservationNotifications.value = false;
  }




}