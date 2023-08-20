import 'package:flutter/material.dart';

class FeesDonationScreen extends StatelessWidget {
  const FeesDonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
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
            child: Image.network('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
              width: 160,
              height: 180,
              fit: BoxFit.fill,
            )),
          Text('Donators', style: TextStyle(fontWeight: FontWeight.bold), )
        ]
    ),
  );
}
