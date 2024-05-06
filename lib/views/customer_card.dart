import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;

  const CustomCard({
    super.key,
    required this.child,
    this.elevation = 5,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.margin = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      color: color,
      margin: margin,
      child: child,
    );
  }
}
