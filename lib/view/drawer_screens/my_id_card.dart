import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';

import '../../widgets/app_bar_widget.dart';

class MyIdCard extends StatelessWidget {
  const MyIdCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   foregroundColor: ColorConstant.whiteColor,
      //   backgroundColor: ColorConstant.defaultColor,
      //   // automaticallyImplyLeading: false,
      //   title: AppBarWidget(text: 'My Id Card',),
      // ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.2),
              Center(
                child: Container(
                  // padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.6,
                  decoration: BoxDecoration(
                    color: Color(0xff4389b7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black26)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.1),
                            Text('Jamie Chastain', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            Row(children: [
                              ImageIcon(AssetImage('assets/dob.png'), color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('25/10/1990', style: TextStyle(fontSize: 14, color: Colors.white),)
                            ],),

                            Row(children: [
                              Icon(Icons.location_on, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('45 Elm Avenue, \nCityville, Canada', style: TextStyle(fontSize: 14, color: Colors.white),)
                            ],),
                          ],),
                          Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            height: MediaQuery.of(context).size.height*0.17,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqmr4w1zoYuG0WqRWLzn-6kBRVaubNv3cepcs4igg&s',)
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2),

            ],
          ),
        ),
      )),
    );
  }
}

