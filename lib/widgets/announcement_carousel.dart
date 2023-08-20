import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';

class AnnouncementCarousel extends StatefulWidget {
  const AnnouncementCarousel({Key? key}) : super(key: key);

  @override
  State<AnnouncementCarousel> createState() => _AnnouncementCarouselState();
}

class _AnnouncementCarouselState extends State<AnnouncementCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = [
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

      ];


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        children: [
          Card(
            elevation: 0,
            child: Column(
              children: [
                blackCard(context, Center(child: Text('ANNOUNCEMENTS', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),))),
                // whiteCard(context, 50),
                // photoCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdRAobZ4Ck2ii-wtNuOv6Agy_UvMY2MRAUNg&usqp=CAU', context),
                CarouselSlider(items:
                imgList.map((item) => photoCard(item, context)).toList(),
                  options: CarouselOptions(
                      height: 150,
                      viewportFraction: 1,
                      autoPlay: true,
                      //aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),),
                // smallCard(context),
                // blackCard(context, SizedBox()),
                // CustomPaint(painter: Rhombus(), size: Size(200, 200),)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: _current == entry.key
                            ? LinearGradient(colors: [
                          Colors.black26,
                          Colors.black26,
                        ])
                            : LinearGradient(colors: [
                          Color(0xffD9D9D9),
                          Color(0xffD9D9D9),
                        ]),
                      ),
                    ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

Widget blackCard(BuildContext context, Widget widget) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: 37,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorConstant.defaultColor,
    ),
    child: widget,
  );
}

Widget whiteCard(BuildContext context, double height) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: height,
    color: Color(0xfff3f3f3),
    child: Center(child: Text('Mahashivratri-2022', style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff00008b)
    ),)),
  );
}

Widget photoCard(String imageUrl, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: 150,
    // decoration: BoxDecoration(
    //     image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
    // ),
    child: Center(child: Text(imageUrl)),
  );
}

Widget smallCard(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: 20,
    color: Color(0xfff3f3f3),
  );
}
