import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nardilibraryapp/ui/views/dasboard_screen.dart';

class Network {
  static String LOGIN_URL = "http://nardlibrary.org/api/User/Login";
  static Future<Response> loginUser(
      String email, String password, BuildContext context) async {
    final response = await post(
      Uri.parse(LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{"Username": email, "Password": password}),
    );

    if (response == "success") {
      print("Logging in user");
      print(response.body);
      print(response.statusCode);
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
      return response;
    } else {
      print(response.reasonPhrase);
      print(response.body);
      print(response.statusCode);
      return response;
    }
  }

  static Future loginUser2(
      String email, String password) async {
    final response = await post(
      Uri.parse(LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{"Username": email, "Password": password}),
    );

    if (response.statusCode == 200) {
      print("Logging in user");
      print(response.body);
      print(response.statusCode);
     // Navigator.pushReplacementNamed(context, Dashboard.routeName);
      return json.decode(response.body);
    } else {
      print(response.reasonPhrase);
      print(response.body);
      print(response.statusCode);
      return response.body;
    }
  }
}
