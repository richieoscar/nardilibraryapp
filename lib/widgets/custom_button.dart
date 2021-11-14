import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onclick;
  final String label;
  const CustomButton({required this.label, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.nardDark),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ))
            
          ),
          onPressed: onclick, 
          child: Text(label),

          ),
      ),
    )
  ;

  }
}
