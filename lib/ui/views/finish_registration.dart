import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/nard_access.dart';
import 'package:nardilibraryapp/viewmodels/finish_registration_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class FinishRegistration extends StatelessWidget {
  static const routeName = "/finshRegistration";
  const FinishRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/check.png"),
            ),
            const SizedBox(
              height: 42,
            ),
            Text(
              "Congratulations",
              style: AppStyle.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "You have Successfuly registered to NardLibrary.",
                style: AppStyle.verSmallText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Kindly log in to your account.",
                style: AppStyle.verSmallText,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(label: "LOGIN", onclick: () => _gotoLogin(context)),
          ],
        ),
      ),
    );
  }

  void _gotoLogin(BuildContext context) {
    context
        .read<FinishRegistrationViewmodel>()
        .navigateUntil(NardAccess.routeName, context);
  }
}
