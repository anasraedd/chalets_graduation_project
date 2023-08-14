import 'dart:async';
import 'package:chalets/screens/blocked_chalets_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:chalets/anas/test.dart';
import 'package:chalets/bloc/bloc/chalets_bloc.dart';
import 'package:chalets/bloc/states/crud_state.dart';
import 'package:chalets/featuers/Auth/presentation/pages/login_screen.dart';
import 'package:chalets/featuers/Auth/presentation/pages/on_board_screen.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen2.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen3.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_or_sign_in_screen.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen.dart';
import 'package:chalets/firbase/fb_notifications.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/app_admin/add_facilities_chalet_screen.dart';
import 'package:chalets/screens/app_admin/add_images_chalet_screen.dart';
import 'package:chalets/screens/app_admin/chalet_information_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/coupon_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/main_admin_screen.dart';
import 'package:chalets/screens/app_admin/main_admin_screen/widgets/notifications_screen.dart';
import 'package:chalets/screens/app_admin/select_chalet_screen.dart';
import 'package:chalets/screens/app_admin/start_create_chalet_screen.dart';
import 'package:chalets/screens/chalet_pictures_screen.dart';
import 'package:chalets/screens/chat_screen.dart';
import 'package:chalets/screens/choose_your_reservation_date.dart';
import 'package:chalets/screens/core/launch_screen.dart';
import 'package:chalets/screens/detailed_search_screen.dart';
import 'package:chalets/screens/personal_information_screen.dart';
import 'package:chalets/screens/prices_screen.dart';
import 'package:chalets/screens/result_search.dart';
import 'package:chalets/screens/view_pictures_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/theme/app_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// used to pass messages from event handler to the UI
final messageStreamController = BehaviorSubject<RemoteMessage>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FbNotifications.initNotifications();
  await SharedPrefController().initPreferences();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [
      Locale('ar', ''),
      Locale('en', ''),
    ], fallbackLocale: Locale('en'), path: 'assets/lang', child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void changeLanguage({
    required BuildContext context,
    required Locale locale,
  }) {
    _MyAppState _myAppState = context.findAncestorStateOfType<_MyAppState>()!;
    _myAppState.changeLanguage(locale: locale);

  }
}

class _MyAppState extends State<MyApp> with FbNotifications {
  // Locale _appLocale = const Locale('en', '');
//
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }



    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }


  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {}

    LaunchScreen.route = '/chat_screen';
     // Get.to(ChatScreen(id: 5));
    Get.to(LaunchScreen());

    // Navigator.push(
    //         navigatorKey.currentState!.context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 LaunchScreen(
    //                 )));
// Navigator.pushNamed(context,'/launch_screen');

    print(
        'ccccccccccccccccccccccccccccc ${ModalRoute.of(context)?.settings?.name}');
    //  Future.delayed(Duration(milliseconds: 10), (){
    //  Get.toNamed('/personal_information_screen');

    //LaunchScreen.route = '';
    // });

    //Get.to(LaunchScreen());
    //   // Navigator.push(
    //   //     navigatorKey.currentState!.context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) =>
    //   //             LaunchScreen(
    //   //               '/chat_screen'
    //   //             )));
    //   print('currentState: ${navigatorKey.currentState}');
    // });
  }



  DateTime dateTime = DateTime.now();

  void changeLanguage({
    required Locale locale,
  }) {
    setState(() {
      context.setLocale(Locale('$locale'));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestNotificationPermitions();
    initilizeForgroundNotificationForAndroid();
    setupInteractedMessage();

    //manageNotificationAction();


    //  if(navigatorKey.currentState == null){
    //    // Navigator.push(
    //    //     navigatorKey.currentState!.context,
    //    //     MaterialPageRoute(
    //    //         builder: (context) =>
    //    //             LaunchScreen()));

    // }
  }

  @override
  Widget build(BuildContext context) {

    // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
    //   if (message != null) {
    //     // Extract necessary data from the message and navigate to the chat screen
    //    // final chatId = message.data['chatId'];
    //     Get.toNamed('/main_screen');
    //   }
    // } as FutureOr Function(RemoteMessage? value));
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // localizationsDelegates: const [
          //   AppLo
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          //],
          // supportedLocales: const [
          //   Locale('ar', ''),
          //   Locale('en', ''),
          // ],
          //  locale: _appLocale,
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: buildLightTheme(),


          // home: MainScreen(),
          //initialRoute: '/on_board_screen',
          // home: LaunchScreen.route.isEmpty ? LaunchScreen() : null,
          // home: CouponScreen(), // NotificationsScreen
          // ChaletPicturesScreen(),
          // home: ChatScreen(id: 5,),
        //  home: RegisterAccountScreen(),

          getPages: [
            GetPage(name: '/', page: ()=> LaunchScreen()),
            GetPage(name: '/on_board_screen', page: () => OnBoardScreen()),
            GetPage(
                name: '/register_or_login_screen',
                page: () => RegisterOrSignInScreen()),
            GetPage(
                name: '/regiter_screen', page: () => RegisterAccountScreen()),
            GetPage(
                name: '/verification_by_mobile_screen',
                page: () => RegisterAccountScreen2()),
            GetPage(
                name: '/code_verification_screen',
                page: () => RegisterAccountScreen3()),
            GetPage(name: '/login_screen', page: () => LoginScreen()),
            GetPage(name: '/main_screen', page: () => MainScreen()),
            GetPage(name: '/result_research', page: () => ResultResearch()),
            GetPage(name: '/detailed_search_screen', page: () => DetailedSearchScreen()),
            // GetPage(name: '/view_pictures_screen', page: () => ViewPicturesScreen()),
            GetPage(name: '/choose_your_reservation_date', page: () => ChooseYourReservationDate()),
            GetPage(name: '/result_research', page: () => ResultResearch()),
            GetPage(name: '/blocked_chalets_screen', page: () => BlockedChaletsScreen()),





            // GetPage(
            //     name: '/chat_screen',
            //     page: () => ChatScreen(
            //             nameSender: 'Anas Chalet',
            //             urlImage:
            //                 "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
            //             messages: [
            //               Message(
            //                   idMessage: '1',
            //                   idSender: '1',
            //                   textMessage: '11111111111111111',
            //                   dateTimeMessage:
            //                       DateTime.now().subtract(Duration(days: 1))),
            //               Message(
            //                   idMessage: '2',
            //                   idSender: '1',
            //                   textMessage:
            //                       '222222222222222222222222222222222222222222',
            //                   dateTimeMessage:
            //                       DateTime.now().subtract(Duration(days: 1))),
            //               Message(
            //                   idMessage: '3',
            //                   idSender: '2',
            //                   textMessage:
            //                       '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333',
            //                   dateTimeMessage:
            //                       DateTime.now().subtract(Duration(days: 1))),
            //               Message(
            //                   idMessage: '4',
            //                   idSender: '2',
            //                   textMessage: '4444444444444444444444444444',
            //                   dateTimeMessage:
            //                       DateTime.now().subtract(Duration(days: 1))),
            //               Message(
            //                   idMessage: '5',
            //                   idSender: '2',
            //                   textMessage:
            //                       '555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555',
            //                   dateTimeMessage: dateTime),
            //               Message(
            //                   idMessage: '6',
            //                   idSender: '1',
            //                   textMessage: '66666666666666666666666',
            //                   dateTimeMessage: dateTime)
            //             ])),
            GetPage(
                name: '/personal_information_screen',
                page: () => PersonalInformationScreen()),
            GetPage(
                name: '/select_chalet_screen',
                page: () => SelectChaletScreen()),
            GetPage(name: '/chalet_information_screen', page: () => ChaletInformationScreen()),
            GetPage(name: '/add_images_chalet_screen', page: () => AddImagesChaletScreen()),
            GetPage(name: '/start_create_chalet_screen', page: () => StartCreateChaletScreen()),

            //Admin
            // GetPage(name: '/main_admin_screen', page: () => MainAdminScreen()),






          ],

          //RegisterAccountScreen3(),
          //initialRoute: '/launch_screen',
          // routes: {
          //   '/launch_screen': (context) => LaunchScreen(),
          //   '/login_screen': (context) => LoginScreen()
          // },

          // home:
          //     ChatScreen(
          //   nameSender: 'Anas Chalet',
          //
          //   urlImage:
          //       "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
          //   messages: [
          //     Message(idMessage: '1', idSender: '1', textMessage: '11111111111111111', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
          //     Message(idMessage: '2',idSender: '1',textMessage: '222222222222222222222222222222222222222222', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
          //     Message(idMessage: '3',idSender: '2',textMessage: '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
          //     Message(idMessage: '4',idSender: '2',textMessage: '4444444444444444444444444444', dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
          // Message(idMessage: '5',idSender: '2',textMessage: '555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', dateTimeMessage: dateTime),
          // Message(idMessage: '6',idSender: '1', textMessage: '66666666666666666666666', dateTimeMessage:dateTime
          // )
          //   ],
          // ),
          // scaffoldKey: ,


        );
      },
    );
  }
}
