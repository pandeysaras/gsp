import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';

class PaidProgramsScreen extends StatelessWidget {
  const PaidProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paid programs'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return listItem(() {
                  // Navigator.pushNamed(context, RoutesName.playYoutubeVideo);
                });
              }),
        ),
      ),
    );
  }
}

Widget listItem(VoidCallback onPress) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      title: const Text(
        'Live class links',
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
      tileColor: ColorConstant.tileColor,
    ),
  );
}
