import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/ui/views/nard_access.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = "/SplashScreen";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _gotoNardScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset("assets/nadlogo.png"),
      ),
    );
  }

  _gotoNardScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(context, NardAccess.routeName);
  }
}
