import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';

import '../../utils/color_constant.dart';
import '../../widgets/event_widget.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Events'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return EventWidget(width: mediaQuery.width*0.95, text1: '11th Apr 2022', text2: 'Monday', height1: 150, height2: 40, title: 'Ramnavmi', height3:30,
                editIcon: Icons.edit,
                  deleteIcon: Icons.delete,
                  textStyle1:                       GoogleFonts.lato(textStyle: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                   textStyle2:                         GoogleFonts.lato(textStyle: const TextStyle(
                     // fontWeight: FontWeight.bold,
                       fontSize: 16,
                       color: Color(0xffA5DEFF)))
                  ,
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, RoutesName.createEventScreen);
      }, child: Icon(Icons.add)),
    );
  }
}
