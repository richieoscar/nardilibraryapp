import 'package:flutter/material.dart';
class Noresource extends StatelessWidget {
  String? image;
  String? errorMessage;
  Noresource({this.image, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 180,
              height: 200,
              child: Image.asset(
               image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(errorMessage!),
        ],
      ),
    );
  }
}