import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/create_new_password.dart';
import 'package:nardilibraryapp/viewmodels/verify_email_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class VerifyEmail extends StatelessWidget {
  static const route = "/verifyEmail";
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBAr(
        title: "Verify Email",
        icon: Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "We have sent you a reset password Details to your registered email",
                  style: AppStyle.mediumText),
            ),
            const SizedBox(
              height: 28,
            ),
            const Image(
              image: AssetImage('assets/verifyEmail.png'),
            ),
            const SizedBox(
              height: 89,
            ),
            CustomButton(
                label: "CHANGE PASSWORD",
                onclick: () {
                  context
                      .read<VerifyEmailViewmodel>()
                      .navigate(CreateNewPassword.routeName, context);
                }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didnt receive Details?"),
                TextButton(
                    onPressed: () {
                      _resend(context);
                    },
                    child: Text(
                      "Resend",
                      style: AppStyle.blueText,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ProgressBar(context.watch<VerifyEmailViewmodel>().isVisible),
          ],
        ),
      ),
    );
  }

  void _resend(BuildContext context) {
    context.read<VerifyEmailViewmodel>().isVisible = true;
    context.read<VerifyEmailViewmodel>().resend(context);
  }
}
