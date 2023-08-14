

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthAndRoutingGetxController extends GetxController {
  RxString route = ''.obs;
  RxBool visablePassword= false.obs;
  RxBool visablePasswordInRegister = false.obs;

  RxString nameCuontry = ''.obs;
  RxString phoneCodeCuontry = ''.obs;
  RxString flagEmojiCuontry = ''.obs;

  RxString numberPhone = ''.obs;
  RxString requestId = ''.obs;
  RxString checkCode = ''.obs;



  RxString userNameValue = ''.obs;


  static AuthAndRoutingGetxController get to => Get.find();

}