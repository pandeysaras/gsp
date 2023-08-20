import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  const AppBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),);
  }
}
