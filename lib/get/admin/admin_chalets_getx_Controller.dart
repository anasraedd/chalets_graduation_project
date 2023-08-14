
import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/models/admin/chalets_info_i_admin.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/chalet.dart';
import 'package:get/get.dart';

class AdminChaletsGetxController extends GetxController with Helpers{
  RxList<ChaletInfoIAdmin> chaletsInfoIAdmin = <ChaletInfoIAdmin>[].obs;
  RxBool loadedChaletsInfoIAdmin = false.obs;
  Rx<Chalet> chaletForManage = Chalet().obs;

  RxString logoChalet = ''.obs;
  RxString nameChalet = ''.obs;

  RxBool loadedGetchaletToManage = false.obs;

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

}