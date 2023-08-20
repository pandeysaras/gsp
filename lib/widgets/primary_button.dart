import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.height,
    required this.onTap,
    this.width,
    required this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,// ?? MediaQuery.of(context).size.width / 2 - 20,
      height: height ?? 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient:  const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff64A6F3),
              Color(0xff64A6F3),
              // Colors.black,
              // ColorConstant.primary,
              // ColorConstant.secondary,
            ],
          ),
        ),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            foregroundColor: ColorConstant.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
