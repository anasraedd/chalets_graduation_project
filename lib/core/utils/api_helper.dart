import 'dart:io';

import 'package:chalets/models/api_response.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:easy_localization/easy_localization.dart';

mixin ApiHelper {
  ApiResponse get errorResponse => ApiResponse('error_response'.tr(), false);

  Map<String, String> get headers => {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: SharedPrefController()
            .getValueFor<String>(key: PrefKeys.token.name)!
      };
}
