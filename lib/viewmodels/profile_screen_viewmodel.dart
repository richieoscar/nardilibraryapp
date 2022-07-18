import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenViewmodle extends ChangeNotifier {
  ProfileScreenViewmodle() {}

  String? _username;
  String? _email;
  int? _id;
  bool isGetUser = false;

  String get username => _username!;
  String get email => _email!;
  int get id => _id!;

  void init() async {
    await getCachedDetails();
  }


  Future<void> getCachedDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _id = pref.getInt("id");
    _username = pref.getString("userName") ?? "";
    _email = pref.getString("email") ?? "";
    isGetUser = true;
    notifyListeners();
  }
}
