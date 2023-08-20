import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';

class AppBarClass extends StatelessWidget {
  final String title;
  const AppBarClass({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      foregroundColor: ColorConstant.appBarFgColor,
      backgroundColor: ColorConstant.appBarBgColor,
    );
  }
}
