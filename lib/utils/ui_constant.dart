import 'package:flutter/material.dart';

class UiConstant{
  const UiConstant._();

  static late ColorScheme scheme;
  void initScheme(ColorScheme colorScheme) => scheme = colorScheme;

  static const TextStyle smallHeading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mediumHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const lightShadow = BoxShadow(
    blurRadius: 3,
    spreadRadius: 1,
    offset: Offset(1, 1),
    color: Colors.black26,
  );

  static const darkShadow = BoxShadow(
    blurRadius: 3,
    spreadRadius: 1,
    offset: Offset(1, 1),
    color: Colors.black54,
  );

  static Color? cardColor(bool isDarkMode) {
    if (isDarkMode) {
      return Colors.grey.shade800;
    } else {
      return Colors.grey.shade200;
    }
  }

  static ButtonStyle inActiveTextButton = TextButton.styleFrom(
    backgroundColor: UiConstant.scheme.surfaceVariant,
    foregroundColor: UiConstant.scheme.onSurfaceVariant,
  );

  static ButtonStyle activeTextButton = TextButton.styleFrom(
    backgroundColor: UiConstant.scheme.inverseSurface,
    foregroundColor: UiConstant.scheme.onInverseSurface,
  );
}