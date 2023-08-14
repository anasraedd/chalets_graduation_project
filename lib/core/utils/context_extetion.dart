
import 'package:chalets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ContexExtention on BuildContext{

  void settingsStatusBarInScreen({required bool isDark, Color color = primaryColor}){

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      statusBarColor: color, // Set status bar color to transparent
      statusBarIconBrightness: isDark? Brightness.dark : Brightness.light,
      statusBarBrightness:  isDark? Brightness.dark : Brightness.light, // For iOS (dark icons)


    ));
  }
}