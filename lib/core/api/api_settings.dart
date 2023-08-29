class ApiSettings {
  static const String _baseUrl = "https://chalet-app.m7md-sam.com/api/";
  static const String login = '${_baseUrl}auth/login';
  static const String register = '${_baseUrl}auth/register';
  static const String logout = '${_baseUrl}auth/logout';
  static const String images = '${_baseUrl}images/{id}';
  static const String addOrDeleteChaletFavotite = '${_baseUrl}user/user_chalet_favorite_status';
  static const String  verifyMobile = '${_baseUrl}auth/verify_mobile_notify_code';
  static const String  verifyCheckCode = '${_baseUrl}auth/verify_mobile_check_notify_code';
  static const String changeFcmToken = '${_baseUrl}auth/change_user_fcm_token';
  static const String sendEmailVerify = '${_baseUrl}user/user_profile_change_email';

  static const String getChaletsForHomePage = '${_baseUrl}user/chalets_home_page';
  static const String getChaletById = '${_baseUrl}user/chalet_by_id?id=';

  static const String reserveChalet = '${_baseUrl}user/reserve_chalet';

  static const String myReservations = '${_baseUrl}user/user_reservations';

  static const String getProfileDetails = '${_baseUrl}user/user_profile_details';

  static const String pofile = '${_baseUrl}user/{field}';
  static const String changePassword = '${_baseUrl}user/user_profile_change_password';

  static const String changePicture = '${_baseUrl}user/user_profile_change_picture';

  static const String getFavoriteChaltes = '${_baseUrl}user/user_chalet_favorite_status';

  static const String getConversation = '${_baseUrl}user/all_chalets_have_messages';
  static const String getChaletConversation = '${_baseUrl}owner_and_admin/all_users_have_messages?chalets_id={id}';

  static const String getChat = '${_baseUrl}user/all_messages?chalets_id={id}';
  static const String sendMessageToChalet = '${_baseUrl}user/send_message';
  static const String deleteMessage = '${_baseUrl}user/delete_message';

  static const String getChaletChat = '${_baseUrl}owner_and_admin/all_messages?';
  static const String sendMessageToUser = '${_baseUrl}owner_and_admin/send_message';

  static const String getCounties = '${_baseUrl}user/researched_chalets_countries';
  static const String getCiriesForCountry = '${_baseUrl}user/researched_chalets_cities?country={country}';
  static const String researchedChalets = '${_baseUrl}user/researched_chalets?';

  static const String chaletBlock = '${_baseUrl}user/user_chalet_block_status';


  static const String createChalet = '${_baseUrl}user/add_chalet';
  static const String chaletsThatIAdmin = '${_baseUrl}user/chalets_i_admin';

  static const String userBalanceDetails = '${_baseUrl}user/user_balance_details';



  static const String getChalet = '${_baseUrl}owner_and_admin/chalet_viewer?chalets_id={id}';
  static const String updateChaletInformation = '${_baseUrl}owner_and_admin/change_chalet_information';

  static const String editChaletImages = '${_baseUrl}owner_and_admin/change_chalet_images';
  static const String editChaletPrices = '${_baseUrl}owner_and_admin/change_chalet_prices';

  static const String editChaletFacilities = '${_baseUrl}owner_and_admin/change_chalet_facilities';
  static const String chaletReservations = '${_baseUrl}owner_and_admin/chalet_reservations?chalets_id={id}';
  static const String chaletReservationChangeStatus = '${_baseUrl}owner_and_admin/chalet_reservation_change_status';
  static const String chaletReservationNotifications = '${_baseUrl}owner_and_admin/chalet_reservation_notifications?chalets_id={id}';

  static const String chaletPriceDiscountCodes = '${_baseUrl}owner_and_admin/chalet_price_discount_codes?chalets_id={id}';

  static const String addPriceDiscountCode = '${_baseUrl}owner_and_admin/add_chalet_price_discount_codes';








}