
import 'package:chalets/featuers/Auth/presentation/pages/login_screen.dart';
import 'package:chalets/featuers/Auth/presentation/pages/on_board_screen.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_account_screen2.dart';
import 'package:chalets/featuers/Auth/presentation/pages/register_or_sign_in_screen.dart';
import 'package:chalets/featuers/main/presentation/pages/main_screen/main_screen.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/screens/chat_screen.dart';
import 'package:chalets/screens/core/launch_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();

  // await init();
  runApp(
    EasyLocalization(supportedLocales: [
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

class _MyAppState extends State<MyApp> {
  // Locale _appLocale = const Locale('en', '');
  DateTime dateTime = DateTime.now();
  void changeLanguage({
    required Locale locale,
  }) {
    setState(() {
      context.setLocale(Locale('$locale'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
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

          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) => LaunchScreen(),
            '/login_screen': (context) => LoginScreen()
          },
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
        );
      },
    );
  }
}
