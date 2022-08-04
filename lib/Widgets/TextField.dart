import 'package:flutter/material.dart';

class TextFieldClasss extends StatelessWidget {
  TextFieldClasss(
      {Key? key,
      required this.suffixIcon,
      required this.isobscure,
      required this.controller,
      required this.LabelText,
      required this.iconData})
      : super(key: key);
  final IconData iconData;
  final String LabelText;
  final TextEditingController controller;
  final bool isobscure;
  final bool suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isobscure,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          fillColor: Colors.purple,
          filled: true,
          contentPadding: EdgeInsets.all(20),
          labelText: LabelText,
          suffixIcon: suffixIcon
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {},
                )
              : null),
      controller: controller,
    );
  }
}
