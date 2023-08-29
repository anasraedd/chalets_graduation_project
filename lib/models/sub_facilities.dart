

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SubFacilities {
   List listTextEditingControllers = [TextEditingController(text: '')];
  RxDouble swipeThresholdForSubFacilities = 100.0.obs;

  RxDouble startXForSubFacilities = 0.0.obs;
  RxBool isSwipeForSubFacilities = false.obs;
  RxInt indexSwipeForSubFacilities = 0.obs;

}