import 'package:finalproject/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final Color? hintcolor;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? isPassword;
  final Color fieldcolor;
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.hintcolor,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.isPassword = false,
      this.fieldcolor = whitecolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
          style: const TextStyle(color: Colors.white),
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide(color: whitecolor, width: 2),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: hintcolor),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              fillColor: whitecolor)),
    );
  }
}
