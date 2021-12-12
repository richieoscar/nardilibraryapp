import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onclick;
  final String label;
  final Color? color;
  const CustomButton(
      {required this.label,
      required this.onclick,
      this.color = KDefaultButtonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: onclick,
          child: Text(label),
        ),
      ),
    );
  }
}
