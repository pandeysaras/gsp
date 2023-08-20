import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType, required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      // style: TextStyle(color: Colors.black),
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(7),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );

    // return TextFormField(
    //   controller: textEditingController,
    //   decoration: InputDecoration(
    //     hintText: hintText,
    //     border: inputBorder,
    //     focusedBorder: inputBorder,
    //     enabledBorder: inputBorder,
    //     filled: true,
    //     contentPadding: const EdgeInsets.all(8),
    //   ),
    //   keyboardType: textInputType,
    //   obscureText: isPass,
    // );
  }
}
