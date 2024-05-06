import 'package:finalproject/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  final IconButton iconButton;
  final Color color;
  final String text;
  const CustomColumn({
    required this.iconButton,
    required this.text,
    this.color = secondarycolor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: color,
          child: Center(child: iconButton),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        )
        // ), IconButton(onPressed: onPressed, icon: icon)
      ],
    );
  }
}
