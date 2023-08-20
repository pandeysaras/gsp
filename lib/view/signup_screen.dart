import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gujarati_samaj_paris/widgets/primary_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../utils/color_constant.dart';
import '../utils/ui_constant.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? _imageFile;
  File? profilePic;
  final _picker = ImagePicker();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Account'),
        foregroundColor: Colors.white,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                  child: Center(
                      child: profilePic == null
                          ? CircleAvatar(
                        radius: 60,
                        // backgroundColor: Theme.of(context).primaryColor,
                        child: Image.asset("assets/add_img.png",
                          width: 40,
                          height: 40,
                            ),
                      )
                          : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(profilePic!),
                      )),
                  onTap: () {
                    /// Get profile image
                    _showPicker(context);
                  },
                ),

                SizedBox(height: 15,),


                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "E-mail",hintText: "E-mail", isDense: true),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "Password",hintText: "Password", isDense: true),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "Confirm Password",hintText: "Confirm Password", isDense: true),
                ),

                SizedBox(height: 15,),
                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "Name",hintText: "Name", isDense: true),
                ),

                SizedBox(height: 15,),
                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "Phone",hintText: "Phone", isDense: true),
                ),

                SizedBox(height: 15,),
                TextFormField(
                  // controller: title,

                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: "Date of Birth",hintText: "dd/mm/yyyy", isDense: true),
                ),
                signupFields('Place of Birth', 'Place of Birth(Municipality and Department)'),
                signupFields('City', 'City(Origin)'),
                signupFields('Address', 'Address'),
                signupFields('Zip Code', 'Zip Code'),
                signupFields('Commune', 'Commune'),
                signupFields('Blood group', 'Blood group'),
                SizedBox(height: 15,),
                PrimaryButton(onTap: (){}, child: Text('Sign in'), width: MediaQuery.of(context).size.width,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future getImage(ImageSource imageSource) async {
    final pickedFile =
    await _picker.pickImage(source: imageSource, imageQuality: 80);
    if (pickedFile == null) return;
    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
        print(pickedFile.path);
      } else {}
    });
  }

  /*-----------------------------------------------------------------------------*/
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () async {
                      await getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    await getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

}

Widget signupFields (String text1, String text2) {
  return Column(
    children: [
      SizedBox(height: 15,),
      TextFormField(
        // controller: title,

        keyboardType: TextInputType.multiline,
        style: const TextStyle(fontSize: 16),
        decoration:  InputDecoration(labelText: text1,hintText: text2, isDense: true),
      ),

    ],
  );
}

class SvgIcon extends StatelessWidget {
  // Variables
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const SvgIcon(this.assetName, {this.width, this.height, this.color});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName,
        width: width ?? 23, height: height ?? 23, color: color ?? Colors.grey);
  }
}



