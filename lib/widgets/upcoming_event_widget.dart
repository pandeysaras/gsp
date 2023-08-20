import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/routes/routes_name.dart';

class UpcomingEventWidget extends StatelessWidget {
  final double width;
  final double height1;
  final double height2;
  final double? height3;
  final String text1;
  final String text2;
  final String? text3;
  final String title;
  final IconData? editIcon;
  final IconData? deleteIcon;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  const UpcomingEventWidget(
      {Key? key,
      required this.width,
      required this.text1,
      required this.text2,
      this.text3,
      required this.height1,
      required this.height2,
      this.height3,
      required this.title,
      this.editIcon,
      this.deleteIcon,
      this.textStyle1,
      this.textStyle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width * 0.6,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text1, style: textStyle1
                      ),
                  Text(text2, style: textStyle2
                      ),
                      Text(text3!,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 18, color: Color(0xffA5DEFF)))),
                ],
              ),
            ),
          ),
          Container(
            width: 120,
            height: 37,
            color: Colors.transparent,
            child: CustomPaint(
              painter: RectanglePainter(),
              child: Center(
                  child: Text(
                'EVENT',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..color = Colors.blue
          ..strokeWidth = 10
        // ..style = PaintingStyle.stroke
        ;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width * 0.1, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
