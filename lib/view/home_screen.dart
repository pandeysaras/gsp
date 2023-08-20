import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gujarati_samaj_paris/widgets/announcement_carousel.dart';
import 'package:gujarati_samaj_paris/widgets/event_widget.dart';
import 'package:gujarati_samaj_paris/widgets/home_carousel.dart';
import 'package:gujarati_samaj_paris/widgets/home_slogan_carousel.dart';

import '../widgets/upcoming_event_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HomeSloganCarousel(),
            SizedBox(
              height: 20,
            ),
            UpcomingEventWidget(
              width: MediaQuery.of(context).size.width * 0.6,
              text1: 'RAMNAVMI',
              text2: '11th Apr 2022',
              height1: 200,
              height2: 40,
              title: 'Upcoming Event',
              height3: 30,
              text3: 'Monday',
              textStyle1: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xffA5DEFF))),
              textStyle2: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),

            SizedBox(
              height: 20,
            ),

            AnnouncementCarousel(),
            SizedBox(
              height: 20,
            ),
            // HomeCarousel(),
            // SizedBox(
            //   height: 20,
            // ),
            // SizedBox(height: 20,),
            // Container(
            //   width: 125,
            //   height: 37,
            //   color: Colors.white,
            //   child: CustomPaint(
            //     painter: RectanglePainter(),
            //     child: Center(child: Text('MEMORIES',
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white
            //       ),
            //     )),
            //   ),
            // ),
            SizedBox(
              height: 90,
            )


          ],
        ),
      ),
    );
  }
}

