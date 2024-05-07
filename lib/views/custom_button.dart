import 'package:finalproject/constants/constant.dart';
// import 'customtext.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? action;
  final Size size;
  final Color forecolor;
  final Color backgroundcolor;

  // ignore: prefer_typing_uninitialized_variables
  // var print;
  const CustomButton({
    super.key,
    required this.label,
    this.action,
    this.backgroundcolor = whitecolor,
    this.forecolor = whitecolor,
    this.size = const Size(100, 40),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shadowColor: whitecolor,
          minimumSize: size),
      child: Text(label)
    );
  }
}
