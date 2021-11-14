import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {
  bool _isVisible;

  ProgressBar(this._isVisible);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:_isVisible,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}