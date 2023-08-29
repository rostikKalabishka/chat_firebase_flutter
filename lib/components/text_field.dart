import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String hintText;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      required this.textFieldController,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textFieldController,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.grey[100],
          filled: true,
        ));
  }
}
