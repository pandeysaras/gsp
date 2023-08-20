import 'package:flutter/material.dart';

class PhotosVideosScreen extends StatelessWidget {
  const PhotosVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          galleryWidget(),
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
          const Text('Gallery images', style: TextStyle(fontWeight: FontWeight.bold), )
        ]
    ),
  );
}

