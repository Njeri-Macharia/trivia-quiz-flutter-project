import 'dart:convert';

import 'package:finalproject/controllers/categories_controller.dart';
import 'package:finalproject/models/categories_model.dart';
import '../../views/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

CategoriesController categoriesController = Get.put(CategoriesController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    displaycategories();
    return Obx(
      () => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Challenge your friends",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                      ),
                      const Text(
                        "Invite your friends to play our game",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Start Now",
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/think.png",
                    height: 120,
                    width: 120,
                  ),
                ],
              ),

              // body
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0))),
                padding: const EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * .75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text("Explore Quizzes")),
                        TextButton(
                            onPressed: goviewall, child: const Text("View all"))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: GridView.builder(
                          itemCount: categoriesController.categorieslist.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return DashboardCard(
                              // categoryId: categoriesController
                              //     .categorieslist[index].categories_id==102?,
                              ontap: questiondis,
                              imagePath:
                                  "https://nattiee.com/MercyFile/images/${categoriesController.categorieslist[index].image}",
                              label: categoriesController
                                  .categorieslist[index].name,
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goviewall() {
    Get.offAndToNamed("/viewall");
  }

  void questiondis() {
    Get.toNamed("/questionpage");
  }

  Future<void> displaycategories() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://nattiee.com/MercyFile/categories.php"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var categoriesResponse = serverResponse['Categories'];
      var categorieslist = categoriesResponse
          .map((categories) => Categories.fromJson(categories))
          .toList();
      categoriesController.updatecategories(categorieslist);
    } else {
      print("error occures");
    }
  }
}
