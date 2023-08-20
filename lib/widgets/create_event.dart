import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/widgets/preview_article.dart';
import 'package:gujarati_samaj_paris/widgets/primary_button.dart';

import '../utils/color_constant.dart';
import '../utils/ui_constant.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({
    Key? key,
    this.imagePath,
    this.title,
    this.description,
  }) : super(key: key);
  final String? imagePath;
  final String? title;
  final String? description;

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    setState(() {
      title.text = widget.title ?? "";
      description.text = widget.description ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        foregroundColor: ColorConstant.appBarFgColor,
        backgroundColor: ColorConstant.appBarBgColor,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
                controller: title,
                keyboardType: TextInputType.multiline,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(hintText: "Title"),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Description",
                  style: UiConstant.smallHeading,
                ),
              ),
              TextFormField(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                minLines: 1,
                maxLines: 40,
                maxLength: 1500,
                controller: description,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(hintText: "Description"),
              ),

              // ElevatedButton(onPressed: (){}, child: Text('Create'))
              SizedBox(height: 20,),
              Center(child: PrimaryButton(onTap: (){}, child: Text('Create'),
              width: MediaQuery.of(context).size.width,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

