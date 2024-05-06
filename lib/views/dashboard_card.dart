import 'package:finalproject/screens/home.dart';
// import 'package:finalproject/screens/question.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// MyApp myapp = Get.put(MyApp());

class DashboardCard extends StatelessWidget {
  DashboardCard({
    super.key,
    this.ontap,
    required this.imagePath,
    required this.label,
    // required this.categoryId
  });

  final VoidCallback? ontap;
  final String imagePath;
  final String label;
  // final double categoryId;
  // final Icon icon;
  // final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // myapp.filterQuestionsByCategory(categoryId);
        HomeScreen().questiondis();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.network(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}
