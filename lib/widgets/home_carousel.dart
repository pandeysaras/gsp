import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgYtjiHvDVWdouXqUtqSLAMxGMiY54XykcmQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqr1n_3sMtEBd3pFxoyrLo_IMQBwwW4AGu9A&usqp=CAU'
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
                blackCard(context, Center(child: Text('MEMORIES', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),))),
                whiteCard(context, 50),
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
                smallCard(context),
                blackCard(context, SizedBox()),
                // CustomPaint(painter: Rhombus(), size: Size(200, 200),)
              ],
            ),
          ),
          Positioned(
            bottom: 10,
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
                          Color(0xff018CD1),
                          Color(0xffFE436C),
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
    color: ColorConstant.defaultColor,
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
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
    ),
  );
}

Widget smallCard(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: 20,
    color: Color(0xfff3f3f3),
  );
}


