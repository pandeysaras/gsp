import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/widgets/primary_button.dart';
import 'package:gujarati_samaj_paris/widgets/secondary_button.dart';
import 'package:gujarati_samaj_paris/widgets/create_event.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/color_constant.dart';
import '../utils/ui_constant.dart';
import 'add_event_widget.dart';

class PreviewArticle extends StatefulWidget {
  const PreviewArticle({
    Key? key,
    // this.imagePath,
    // required this.title,
    // required this.description,
  }) : super(key: key);

  // final String? imagePath;
  // final String title;
  // final String description;

  @override
  State<PreviewArticle> createState() => _PreviewArticleState();
}

class _PreviewArticleState extends State<PreviewArticle> {
  // late String? imagePath;
  final String imageUrl = '';

  @override
  void initState() {
    // imagePath = widget.imagePath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Add Image",
                  style: UiConstant.smallHeading,
                ),
              ),

              imageUrl.isNotEmpty  ? Center(
                child: Container(
                  width: 200,
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imageUrl)),
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ) :

              Center(
                child: Container(
                  width: 200,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/add_img.png')),
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Title",
                  style: UiConstant.smallHeading,
                ),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 5,
                maxLength: 90,
                // controller: title,
                keyboardType: TextInputType.multiline,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(hintText: "Title"),
              ),

              SizedBox(height: 25,),
              PrimaryButton(onTap: (){}, child: Text('Create'),
                width: MediaQuery.of(context).size.width,
              )


            ],
          ),
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
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CreateEventScreen(
                //       imagePath: widget.imagePath,
                //       title: widget.title,
                //       description: widget.description,
                //     ),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black54,
              ),
            )
          ],
        ),
        Text(
          '',
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
        // imagePath = tempImage.path;
      });
    }
  }
}