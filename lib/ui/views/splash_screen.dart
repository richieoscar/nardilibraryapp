import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/ui/views/admin_dashboard_screen.dart';
import 'package:nardilibraryapp/ui/views/home_page.dart';
import 'package:nardilibraryapp/ui/views/nard_access.dart';
import 'package:nardilibraryapp/ui/views/user_dashboard_screen.dart';
import 'package:nardilibraryapp/viewmodels/splash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = "/SplashScreen";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  StorageService _storageService = StorageServiceImpl.instance;
  @override
  void initState() {
    super.initState();
    _startTimer();
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

  _startTimer() async {
    await Future.delayed(const Duration(seconds: 2), () {
      navigateUser();
    });
  }

  navigateUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var role = pref.getString("role") ?? "";
    var status = pref.getBool("isLoggedIn") ?? false;

    print("Printing user role at splash screen startup");
    print(role);
    print("Printing user loggedin status at splash screen startup");
    print(status);

    if (status == true && role == ADMIN) {
      Navigator.pushReplacementNamed(context, AdminDashboard.routeName);
    }
    if (status == true && role == USER_ROLE) {
      Navigator.pushReplacementNamed(context, UserDashboard.routeName);
    }
    // if (status == true && role == "") {
    //   Navigator.pushReplacementNamed(context, NardAccess.routeName);
   // } 
    else {
       Navigator.pushReplacementNamed(context, NardAccess.routeName);
     }
  }
}
