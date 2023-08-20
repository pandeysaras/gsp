import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    splashTimer();
    super.initState();
  }

  splashTimer() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesName.selectLanguageScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Image.asset("assets/gujarati_samaj_logo.png"),
        ),
      )),
    );
  }
}
