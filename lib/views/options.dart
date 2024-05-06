import 'package:finalproject/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  String option;
  final Color backgroundColor;
  final VoidCallback onTap;
  Options(
      {super.key,
      required this.option,
      required this.backgroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap:onTap,
          child: Container(
            height: 50,
            width: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3, color: primarycolor)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        option,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Radio(
                    //     value: option,
                    //     groupValue: 2,
                    //     onChanged: ((value) {
                    //       onTap;
                    //     }))
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
