import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/user_dashboard_screen.dart';
import 'package:nardilibraryapp/ui/views/forgot_password_screen.dart';
import 'package:nardilibraryapp/ui/views/home_page.dart';
import 'package:nardilibraryapp/util/network_connection.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const String route = "/login";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  bool notChecked = false;
  bool _visible = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() async {
    await NetworkConection.initializeConnection();
    bool status = NetworkConection.checkNetworkConnection();
    if (!status) {
      AppUtils.showSnackBarforNetwork(context, "No Network Connection");
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<LoginFormViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 29,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Welcome to NardLibrary!",
                    style: AppStyle.headline1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Please Login to Access your account",
                      style: AppStyle.smallText),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child:
                      Text("Email or username", style: AppStyle.smallBoldText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.faintColor),
                    child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: "Email or username",
                          hintStyle: const TextStyle(fontSize: 12),
                          fillColor: AppColors.faintColor,
                          focusColor: AppColors.backgroundColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email required";
                          }
                          return null;
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Password", style: AppStyle.smallBoldText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.faintColor),
                    child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: "Password",
                          hintStyle: const TextStyle(fontSize: 12),
                          fillColor: AppColors.faintColor,
                          focusColor: AppColors.backgroundColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password required";
                          }
                          return null;
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          child: Text("Forgot Password?",
                              style: AppStyle.blueText),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgotPassword.routeName);
                          })),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: AppColors.backgroundColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                              viewmodel.keepMeLoggedIn(isChecked);
                            });
                          }),
                      Text("Keeped me Logged In", style: AppStyle.smallText)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 62,
                ),
                CustomButton(label: "LOG IN", onclick: () => _login(context)),
                const SizedBox(
                  height: 20,
                ),
                ProgressBar(viewmodel.isVisible),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account? ",
                        style: AppStyle.verSmallText),
                    InkWell(
                        child: Text(
                      "SignUp",
                      style: AppStyle.blueText,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      NetworkConection.initializeConnection();
      if (NetworkConection.checkNetworkConnection()) {
        print(NetworkConection.checkNetworkConnection());
        context.read<LoginFormViewModel>().login(_emailController.text.trim(),
            _passwordController.text.trim(), context);
      } else {
        AppUtils.showSnackBarforNetwork(context, "No Network Connection");
      }
    }
  }
}
