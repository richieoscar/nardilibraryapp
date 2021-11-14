import 'package:flutter/material.dart';
import 'package:nardilibraryapp/viewmodels/nardaccess_viewmodel.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/login_screen.dart';
import 'package:nardilibraryapp/ui/views/sign_up_screen.dart';
import 'package:provider/provider.dart';

class NardAccess extends StatefulWidget {
  static const routeName = "/nardAccess";

  const NardAccess({Key? key}) : super(key: key);
  @override
  _NardAccessState createState() => _NardAccessState();
}

class _NardAccessState extends State<NardAccess> {
  Color _signupBgColor = AppColors.faintColor;
  Color _loginBgCOlor = AppColors.backgroundColor;
  var loginStyle = AppStyle.whiteBoldText;
  var signupStyle2 = AppStyle.blackBoldText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(_loginBgCOlor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                          onPressed: () {
                            setState(() {
                              _loginBgCOlor = AppColors.backgroundColor;
                              _signupBgColor = AppColors.faintColor;
                              loginStyle = AppStyle.whiteBoldText;
                              signupStyle2 = AppStyle.blackBoldText;
                            });

                            context.read<NardViewmodel>().swapLogin();
                          },
                          child: Text("Log in", style: loginStyle)),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(_signupBgColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          setState(() {
                            _loginBgCOlor = AppColors.faintColor;
                            _signupBgColor = AppColors.backgroundColor;
                            signupStyle2 = AppStyle.whiteBoldText;
                            loginStyle = AppStyle.blackBoldText;
                          });

                          context.read<NardViewmodel>().swapSignUp();
                        },
                        child: Text("Sign up", style: signupStyle2),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: context.watch<NardViewmodel>().swap
                      ? _displaySignUp()
                      : _displayLogin())
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayLogin() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(child: child, scale: animation),
      child: LoginForm(),
    );
  
  }
  

  Widget _displaySignUp() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(child: child, scale: animation),
      child: const SignUp(),
    );
   
  }

 
}
