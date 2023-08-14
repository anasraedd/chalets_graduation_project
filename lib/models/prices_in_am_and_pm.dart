
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricesOfAMAndPM{
  final String dayName;
  final TextEditingController? priceInAM;
  final TextEditingController? priceInPM;
   final RxBool? priceInAMEnabled;
  final bool? priceInPMEnabled;
  final FocusNode? focusNodeAM;
  final FocusNode? focusNodePM;

  PricesOfAMAndPM(
      {required this.dayName,
         this.priceInAM,
         this.priceInPM,
      this.priceInAMEnabled,
        this.priceInPMEnabled,
        this.focusNodeAM,
        this.focusNodePM
      });
}