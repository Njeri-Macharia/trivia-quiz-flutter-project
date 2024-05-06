import 'package:finalproject/constants/constant.dart';
import 'package:finalproject/screens/home.dart';
import 'package:finalproject/views/dashboard_card.dart';
import 'package:flutter/material.dart';

class ViewallScreen extends StatelessWidget {
  const ViewallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreen homeScreen = HomeScreen();
    return Scaffold(appBar: AppBar(),
      backgroundColor: primarycolor,
      body: Column(
        children: [
          Image.asset(
            "assets/images/question.png",
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              'What Do You Want To Improve Today ?',
              style: TextStyle(
                  color: secondarycolor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.separated(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoriesController.categorieslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return DashboardCard(
                    ontap: homeScreen.questiondis,
                    imagePath:
                        "https://nattiee.com/MercyFile/images/${categoriesController.categorieslist[index].image}",
                    label: categoriesController.categorieslist[index].name,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
