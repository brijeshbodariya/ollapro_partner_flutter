import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          height: Utils.getDeviceHeight(context),
            width: Utils.getDeviceWidth(context) ,
            padding: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                   App.splashBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Image.asset(App.splashLogo)),
      ),
    );
  }
}
