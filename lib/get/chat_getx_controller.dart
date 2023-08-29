
import 'package:chalets/core/api/chat_api_controller.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:get/get.dart';

class ChatGetxController extends GetxController{
  Rx<ChaletInfoChat> chaletInfoChat = ChaletInfoChat().obs;
  Rx<UserInfoChat> userInfoChat = UserInfoChat().obs;
   RxList<Message> messages = <Message>[].obs;
   Rx<int?> myId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name).obs;
   Rx<String> typeAccount = '${SharedPrefController().getValueFor<String>(key: 'account_type') ?? AccountType.User.name}'.obs ;

  RxBool loadingChat = false.obs;
  RxBool loadingConversation = false.obs;
  RxBool loadingChaletConversation = false.obs;

  RxList<ChaletInfoChat> conversations = <ChaletInfoChat>[].obs;
  RxList<UserInfoChat> conversationsChalet = <UserInfoChat>[].obs;



  RxInt idChat = 0.obs;

  static ChatGetxController get to => Get.find();


  Future<void> getMyConversation() async {
    loadingConversation.value = true;
    ApiResponse apiResponse = await ChatApiController().getConversation();
    conversations.value = apiResponse!.object;

    ///sort based date message
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');

    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingConversation.value = false;
  }

  Future<void> getChaletConversation() async {
    loadingChaletConversation.value = true;
    ApiResponse apiResponse = await ChatApiController().getChaletConversation();
    conversationsChalet.value = apiResponse!.object;

    ///sort based date message
    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');

    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingChaletConversation.value = false;
  }

  Future<void> getChat({required int id}) async {
    loadingChat.value = true;
    ApiResponse apiResponse = await ChatApiController().getChat(id: id);
    chaletInfoChat.value = ChaletInfoChat.fromJson(apiResponse!.object['chalet']);

    List messagesJson = apiResponse!.object['user_chalet_messages'];

    messages.value = messagesJson.map((e) => Message.fromJson(e)).toList();
    messages.sort((a, b) => b.dateTimeMessage.compareTo(a.dateTimeMessage));

    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingChat.value = false;
  }

  Future<void> getChaletChat({required int id, required int chaletId}) async {
    loadingChat.value = true;
    ApiResponse apiResponse = await ChatApiController().getChaletChat(userId: id, chaletId: chaletId);
    userInfoChat.value = UserInfoChat.fromJson(apiResponse!.object['user']);

    List messagesJson = apiResponse!.object['user_chalet_messages'];

    messages.value = messagesJson.map((e) => Message.fromJson(e)).toList();
    messages.sort((a, b) => b.dateTimeMessage.compareTo(a.dateTimeMessage));

    // isFavorite.value = chalet.value.isFavorite;
    // print('isFavorite: ${chalet.value.isFavorite}');
    //favoriteChalets.value = await _chaletsApiController.readFavorite();
    loadingChat.value = false;
  }



  Future<ApiResponse> sendMessageToChalet({required int id, required String message}) async {
    ApiResponse apiResponse =
    await ChatApiController().sendMessageToChalet(id: id, message: message);
    if (apiResponse.success) {
      return ApiResponse('Succesfully', true);

    }

    return apiResponse;
  }


  Future<ApiResponse> sendMessageToUser({required String chaletId, required String userId, required String message}) async {
    ApiResponse apiResponse =
    await ChatApiController().sendMessageToUser(chaletId: chaletId, userId: userId, message: message);
    if (apiResponse.success) {
      return ApiResponse('Succesfully', true);

    }

    return apiResponse;
  }



}