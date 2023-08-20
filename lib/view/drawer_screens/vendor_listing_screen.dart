import 'package:flutter/material.dart';

class VendorListScreen extends StatelessWidget {
  const VendorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Listing'),
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
    padding: const EdgeInsets.only(left: 15, right: 15 ,bottom: 10),
    child: SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://images.unsplash.com/photo-1605292356183-a77d0a9c9d1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGl3YWxpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                width: 160,
                height: 180,
                fit: BoxFit.fill,
              )),



          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text('Product name', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('100 Rs'),
                Text('9680598179'),
                Spacer()
              ],
            ),
          )

        ],
      ),
    ),
  );
}
