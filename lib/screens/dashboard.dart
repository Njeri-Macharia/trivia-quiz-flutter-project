import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalproject/constants/constant.dart';
import 'package:finalproject/controllers/dashboard_controller.dart';
import 'package:finalproject/screens/home.dart';
import 'package:finalproject/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


var screens = [ HomeScreen(),  Userprofile()];
var selectedpage = 0;
DashboardController dashboardController = Get.put(DashboardController());

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          dashboardController.updateSelectedPage(index);
        },
        height: 60,
        color: secondarycolor,
        buttonBackgroundColor: whitecolor,
        backgroundColor: primarycolor,
        items: const [Icon(Icons.home), Icon(Icons.person)],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Quiz",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      backgroundColor: primarycolor,
      body: Obx(() => Center(
            child: screens[dashboardController.selectedpage.value],
          )),
    );
  }
}
