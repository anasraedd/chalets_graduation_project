import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
     // Navigator.pushReplacementNamed(context, '/login_screen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
            Color(0xFF68E1FF),
            Color(0xFF4AB1CB),
            Color(0xFF1BB3D9),
          ])
        ),
        
        child: Center(child:
        //Image.asset('assets/images/chalet_logo.png')
        SvgPicture.asset('assets/images/chalet_logo2.svg', ),
      ),
      )
    );
  }
}
