import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';

class EventWidget extends StatelessWidget {
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
const   EventWidget(
      {Key? key,
      required this.width,
      required this.text1,
      required this.text2,
      this.text3, required this.height1, required this.height2, this.height3, required this.title, this.editIcon, this.deleteIcon, this.textStyle1, this.textStyle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: ColorConstant.eventBodyColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height3,
                    ),
                    Text(
                      text1,
                      style: textStyle1
                      // GoogleFonts.lato(textStyle: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Text(text2,
                        style: textStyle2
                        // GoogleFonts.lato(textStyle: const TextStyle(
                        //   // fontWeight: FontWeight.bold,
                        //     fontSize: 16,
                        //     color: Color(0xffA5DEFF)))
                    ),
                 text3 != null  ?  Text(text3!,
                        style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 18, color: Color(0xffA5DEFF)))) : const SizedBox(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  width: double.infinity,
                  height: height2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Color(0xff64A6F3),
                  ),
                  child: Row(
                    mainAxisAlignment: editIcon == null ?MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(),
                     editIcon != null ? Spacer(flex: 3,) : SizedBox(),
                      Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              title.toUpperCase(),
                              style: GoogleFonts.lato(textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF))),
                          ),
                        ),
                      ),

                      editIcon != null ? Spacer() : SizedBox(),
                      editIcon != null ? Row(
                         children: [
                           IconButton(onPressed: (){
                             Navigator.pushNamed(context, RoutesName.createEventScreen);
                           }, icon: Icon(editIcon), color: Colors.white,),
                           IconButton(onPressed: (){}, icon: Icon(deleteIcon), color: Colors.white,),
                           // GestureDetector(
                           //     onTap: (){Navigator.pushNamed(context, RoutesName.createEventScreen);},
                           //     child: Icon(editIcon, color: Colors.white,)) ,
                           // Icon(deleteIcon, color: Colors.white,) ,
                         ],
                       ) : SizedBox()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
