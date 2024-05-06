import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Decoration? decoration;
  final Color color;
  final BoxDecoration? boxDecoration;
  final Widget? child;
  const CustomContainer({
    this.child,
    required this.height,
    required this.width,
    this.boxDecoration,
    this.color = Colors.white,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(40)));
  }
}
