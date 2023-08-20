import 'dart:io';
import 'package:gujarati_samaj_paris/widgets/preview_article.dart';
import 'package:gujarati_samaj_paris/widgets/primary_button.dart';
import 'package:gujarati_samaj_paris/widgets/secondary_button.dart';
import 'package:gujarati_samaj_paris/widgets/create_event.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/ui_constant.dart';

class AddEventWidget extends StatefulWidget {
  const AddEventWidget({
    Key? key,
    this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String? imagePath;
  final String title;
  final String description;

  @override
  State<AddEventWidget> createState() => _AddEventWidgetState();
}

class _AddEventWidgetState extends State<AddEventWidget> {
  late String? imagePath;

  @override
  void initState() {
    imagePath = widget.imagePath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Event"),
        // backgroundColor: Colors.black,
        // foregroundColor: Colors.white,
        // flexibleSpace: const GradientAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //const SizedBox(height: 100),
            Container(
              height: 280,
              width: size.width,
              margin: const EdgeInsets.all(16.0),
              child: size.width > 800
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imagePath == null
                      ? ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Icon(
                          Icons.add_circle_outline,
                          size: 160,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                          width: size.width / 2 - 20,
                        ),
                        const Text(
                          "add images of article for better understanding",
                          style: TextStyle(color: Colors.black),
                        ),
                        const Text(
                          'Add image of article',
                          style: UiConstant.smallHeading,
                        )
                      ],
                    ),
                  )
                      : Container(
                    width: size.width / 2 - 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.file(
                          File(imagePath!),
                          filterQuality: FilterQuality.low,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      width: size.width / 2 - 60,
                      child: heading()),
                ],
              )
                  : imagePath == null
                  ? ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      size: 160,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "add images of article for better understanding",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Add image of article',
                      style: UiConstant.smallHeading,
                    )
                  ],
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 2,
                      offset: Offset(0, 1),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.file(File(imagePath!),
                        filterQuality: FilterQuality.low),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //height: 350,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.all(12),
              //color: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  size.width > 800
                      ? const SizedBox(
                    height: 0.0,
                  )
                      : heading(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Description", style: TextStyle(fontSize: 16)),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateEventScreen(
                                imagePath: widget.imagePath,
                                title: widget.title,
                                description: widget.description,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SecondaryButton(
                  child: const Text(
                    'cancel',
                    style: UiConstant.smallHeading,
                  ),
                  onTap: () {
                  },
                ),

                // SizedBox(
                //   height: 50,
                //   width: size.width / 2 - 20,
                //   child: OutlinedButton(
                //     onPressed: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => BottomBar()));
                //     },
                //     child: Text('cancel'),
                //     style: OutlinedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8.0),
                //       ),
                //     ),
                //   ),
                // ),

                PrimaryButton(
                  onTap: () {
                    if (imagePath != null) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("please add image to continue"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Next',
                    style: UiConstant.smallHeading,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Title", style: TextStyle(fontSize: 16)),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateEventScreen(
                      imagePath: widget.imagePath,
                      title: widget.title,
                      description: widget.description,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black54,
              ),
            )
          ],
        ),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }

  Future<void> pickImage() async {
    final tempImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1000,
      maxWidth: 1000,
      //imageQuality: 50,
    );
    if (tempImage != null) {
      setState(() {
        imagePath = tempImage.path;
      });
    }
  }
}