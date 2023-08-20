import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotosVideosScreen extends StatelessWidget {
  const PhotosVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width*0.35,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1382204548/photo/lord-shiva-hindu-god-stock-photo.webp?b=1&s=170667a&w=0&k=20&c=o8IynHJ2VhwIhzQXBR9TJK3wBt-EchouwPNkVNcOh8Q='),
                  fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                width: 2,
                height: 120,
                color: Color(0xff64A6F3),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                height: 120,
                color: Colors.black,
                child: Center(child: Text('MAHASHIVRATRI', style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)
                ),)),
              ),
              Spacer()


            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                height: 120,
                color: Colors.black,
                child: Center(child: Text('RAMNAVMI', style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)
                ),)),
              ),
              Container(
                width: 2,
                height: 120,
                color: Color(0xff64A6F3),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.35,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(image: NetworkImage('https://e1.pxfuel.com/desktop-wallpaper/841/15/desktop-wallpaper-jay-shri-ram-sree-ram-thumbnail.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),

              Spacer()


            ],
          )


        ],
      ),
    );
  }
}

Widget galleryWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 40,bottom: 10),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('https://images.unsplash.com/photo-1605292356183-a77d0a9c9d1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGl3YWxpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
              width: 160,
              height: 180,
              fit: BoxFit.fill,
            )),
          Text('Gallery images', style: TextStyle(fontWeight: FontWeight.bold), )
        ]
    ),
  );
}

