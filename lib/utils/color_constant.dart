import 'package:flutter/material.dart';

class ColorConstant {
  const ColorConstant._();

  static const Color defaultColor = Color(0xff82CEFA);
  static const Color tileColor = Color(0xff9dc8e1);
  static const Color eventTileColor = Color(0xc294e1df);
  static const Color sideBarIcon = Colors.white;
  static const Color appBarFgColor = Colors.lightBlue;
  static const Color appBarBgColor = Colors.black;
  static const Color eventBodyColor = Colors.deepPurple;


  static const Color primary = Color(0xff120036);
  static const Color secondary = Color(0xff18328f);
  static const Color tertiary = Color(0xfffb7414);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Colors.blueGrey;
  static const Color greyColor = Color(0xfff5f5f5);

  static const Color aqua = Color(0xff1BFFFF);
  static const Color lightGreen = Color(0xff00ff77);
  static const Color lightPink = Color(0xfffea1be);
  static const Color lightOrange = Color(0xfffeb47b);
  static const Color lightPurple = Color(0xffb589d6);

  static const Color darkBlue1 = Color(0xff2E3192);
  static const Color darkPink = Color(0xffaa076b);
  static const Color pink = Color(0xffee0a67);
  static const Color darkBlue2 = Color(0xff552585);
  static const Color darkOrange = Color(0xffff705f);
  static const Color darkViolet = Color(0xff61045f);
  static const Color darkRed = Color(0xffaa076b);
  //static const Color lightBlack = Color(0xff053d00);

  static const primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      ColorConstant.primary,
      ColorConstant.secondary,
    ],
  );

  static const pinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      //Color(0xffaa076b),
      Color(0xffee0a67),
      Color(0xfffea1be),
    ],
  );

  static const amberGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffff705f),
      Color(0xfffeb47b),
    ],
  );

  static const purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.purple,
      //Color(0xff552585),
      Color(0xffb589d6),
    ],
  );

  static const blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blueAccent,
      //Color(0xff2E3192),
      Color(0xff1BFFFF),

    ],
  );

  static const greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff053d00),
      Color(0xff00ff77),
    ],
  );

  static const darkPinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff61045f),
      Color(0xffaa076b),
    ],
  );
}
