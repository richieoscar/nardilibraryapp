import 'package:flutter/material.dart';

class GotoPage extends StatefulWidget {
  final ElevatedButton? button;
  final String? label;
  const GotoPage({this.label, this.button});

  @override
  _GotoPageState createState() => _GotoPageState();
}

class _GotoPageState extends State<GotoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.button,
    );
  }
}
