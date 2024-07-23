// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final bool isPassword;
  final TextInputType type;
  final String hintText;
  final Icon icon;

  const MyTextField(
      {Key? key,
      required this.isPassword,
      required this.type,
      required this.hintText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 55, 55),
          borderRadius: BorderRadius.circular(8)),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: TextField(
          obscureText: isPassword,
          keyboardType: type,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              prefixIcon: icon,
              hintStyle: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 174, 173, 173),
              )),
        ),
      ),
    );
  }
}
