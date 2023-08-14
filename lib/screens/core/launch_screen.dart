import 'package:chalets/featuers/Auth/presentation/pages/login_screen.dart';
import 'package:chalets/firbase/fb_notifications.dart';
import 'package:chalets/get/auth_and_routing_controller.dart';
import 'package:chalets/main.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/chat_screen.dart';
import 'package:chalets/screens/personal_information_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class LaunchScreen extends StatefulWidget {
  // const LaunchScreen({Key? key}) : super(key: key);
  static String route = '';
  static bool isOpenedChat = false;

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> with FbNotifications {
  @override
  void initState() {
    if (LaunchScreen.route.isNotEmpty) {
      //print(ModalRoute.of(context)?.settings?.name);
      // if(LaunchScreen.route != ModalRoute.of(context)?.settings?.name){
      //goScreen();
      if(!LaunchScreen.isOpenedChat){
        Future.delayed(Duration(milliseconds: 10), () {
          // Get.offNamed(LaunchScreen.route);
          Get.off(()=> ChatScreen(id: 5));
          LaunchScreen.route = '';
        });

      }else{
        Get.back();

      }

      // }
    } else {
      Future.delayed(Duration(seconds: 3), () {
        bool loggedIn = SharedPrefController()
                .getValueFor<bool>(key: PrefKeys.loggedIn.name) ??
            false;
        String route = loggedIn ? '/main_screen' : '/on_board_screen';

        Get.offNamed(route);

        // Navigator.pushReplacementNamed(context, route);
      });
    }
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    // print(fcmToken);

    //    AuthAndRoutingGetxController authandRoutingGetxController  = Get.put(AuthAndRoutingGetxController());
    // if(authandRoutingGetxController.route.isNotEmpty){
    //   Get.offNamed('/main_screen');
    //   print(SharedPrefController().getRoute().toString());
    //  }else{
    //  // Get.offNamed('/on_board_screen');
    // }

    // Future.delayed(Duration(seconds: 3), (){
    //   bool loggedIn = SharedPrefController().getValueFor<bool>(key: PrefKeys.loggedIn.name) ?? false;
    //   String route = loggedIn ? '/main_screen' : '/on_board_screen';
    //   if(navigatorKey.currentState == null) {
    //     Get.offNamed(route);
    //   }
    //   // Navigator.pushReplacementNamed(context, route);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));
    return Scaffold(
        body: LaunchScreen.route.isNotEmpty
            ? Center(
                child: Container(
                color: Colors.white,
              ))
            : Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                      Color(0xFF68E1FF),
                      Color(0xFF4AB1CB),
                      Color(0xFF1BB3D9),
                    ])),
                child: Center(
                  child:
                      //Image.asset('assets/images/chalet_logo.png')
                      SvgPicture.asset(
                    'assets/images/chalet_logo2.svg',
                  ),
                ),
              ));
  }

  Future<void> goScreen() async {
    // await Get.offNamed(LaunchScreen.route);
    Future.delayed(const Duration(milliseconds: 10), () {
      Get.offNamed(LaunchScreen.route);
    }
        // await  Navigator.pushReplacement(
        //   navigatorKey.currentState!.context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           LoginScreen()
        //       ChatScreen(
        //           nameSender: 'Anas Chalet',
        //
        //           urlImage:
        //           "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
        //           messages: [
        //             Message(idMessage: '1', idSender: '1', textMessage: '11111111111111111', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
        //             Message(idMessage: '2',idSender: '1',textMessage: '222222222222222222222222222222222222222222', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
        //             Message(idMessage: '3',idSender: '2',textMessage: '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
        //             Message(idMessage: '4',idSender: '2',textMessage: '4444444444444444444444444444', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
        //             Message(idMessage: '5',idSender: '2',textMessage: '555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', dateTimeMessage: DateTime.now().subtract(Duration(days: 5))),
        //             Message(idMessage: '6',idSender: '1', textMessage: '66666666666666666666666', dateTimeMessage:DateTime.now().subtract(Duration(days: 3)
        //             )
        //
        //       )
        // ]
        //      )
        //       )
        );
    //  await Navigator.pushReplacementNamed(context, LaunchScreen.route);
    //Future.delayed(Duration(milliseconds: 5), () {

    LaunchScreen.route = '';
  }
}
