import 'dart:convert';
import 'dart:io';

import 'package:chalets/core/api/api_settings.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen.dart';
import 'package:chalets/get/auth_and_routing_controller.dart';
import 'package:chalets/get/chalets_getx_Controller.dart';
import 'package:chalets/main.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/core/launch_screen.dart';
import 'package:chalets/screens/personal_information_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  await Firebase.initializeApp();


  print('Message: ${remoteMessage.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin localNotificationsPlugin;

mixin FbNotifications {


  static Future<void> initNotifications() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler,);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'Chalets_notifications_channel',
        'Chalets_notifications_channel',
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        ledColor: primaryColor,
        showBadge: true,
        playSound: true,
      );
      // Get.snackbar('Message','nnnnnnnnnnnnnnnnnnnnnnn', backgroundColor: Colors.red );
      // String x = await SharedPrefController().add();
      // print('$x');

    }


    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //IOS Notifacation Setuo (Forground)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,

    );
    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      Uri uri2 = Uri.parse(ApiSettings.changeFcmToken);
      var response = await http.post(uri2,
          body: {'fcm_token': event,},
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: SharedPrefController()
                .getValueFor<String>(key: PrefKeys.token.name)!
          });
      var json2 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPrefController().setFcmToken(value: '$event');

      }
    });
  }


  Future<void> requestNotificationPermitions() async {
    NotificationSettings notificationSettings =
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {} else
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {}
  }

  void initilizeForgroundNotificationForAndroid() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;
      if (notification != null && androidNotification != null) {
        localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                icon: 'launch_background'),
          ),
        );
         messageStreamController.sink.add(message);
        // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        //   if (kDebugMode) {
        //     print('Handling a foreground message: ${message.messageId}');
        //     print('Message data: ${message.data}');
        //     print('Message notification: ${message.notification?.title}');
        //     print('Message notification: ${message.notification?.body}');
        //   }
        //
        //   messageStreamController.sink.add(message);
        // });


        // Get.snackbar('Message', notification!.body.toString().substring(
        //     message.toString().indexOf('|')).toString(),
        //     backgroundColor: Colors.green);
      }
    });
  }


  void manageNotificationAction() {
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   // _controlNotificationNavigation(message.data);
    //   //BuildContext? context = Get.context;
    //   LaunchScreen.route = '/chat_screen';
    //
    //     Get.toNamed('/');
     // });


      //  Get.to('/launch_screen');

      // Get.appUpdate();
      // Get.createInformationParser(initialRoute: '/main_screen');
      // Future.delayed(Duration(seconds: 2), (){
      //   Get.toNamed('/main_screen');
      // });


      // AuthAndRoutingGetxController andRoutingGetxController = AuthAndRoutingGetxController();
      // AuthAndRoutingGetxController andRoutingGetxController = Get.put(AuthAndRoutingGetxController(), permanent: true);
      //
      // andRoutingGetxController.route.value = '/main_screen';
      //    Future.delayed(Duration(seconds: 1), (){
      //      SharedPrefController().initPreferences();
      //      SharedPrefController().setRoute();
      //    });
      //    await  SharedPrefController().initPreferences();
      //    SharedPrefController().setRoute();
      // Navigator.push(
      //     navigatorKey.currentState!.context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             PersonalInformationScreen(
      //             )));
    //});
    // Navigator.defaultRouteName.replaceRange(0, Navigator.defaultRouteName.length, '/main_screen');
    //Navigator.push(context!, MaterialPageRoute(builder: (context)=> MainScreen()));
  }




}
