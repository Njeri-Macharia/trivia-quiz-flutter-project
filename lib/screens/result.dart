import 'package:finalproject/constants/constant.dart';
import '../../views/customColumn.dart';
import '../../views/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 320,
                  width: 450,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(20)),

                  child: CircleAvatar(
                    radius: 67,
                    backgroundColor: Colors.white.withOpacity(.4),
                    child: CircleAvatar(
                      radius: 59,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "your score",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.brown),
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: "100",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: "pt",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black))
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
                Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 190,
                      width: 350,
                      decoration: BoxDecoration(
                          color: secondarycolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: Colors.brown.withOpacity(.7),
                                offset: const Offset(0, 1))
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            CustomContainer(
                                              height: 15,
                                              width: 15,
                                              color: primarycolor,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.brown),
                                            ),
                                            Text(
                                              "100%",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.brown),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text("completion")
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            CustomContainer(
                                              height: 15,
                                              width: 15,
                                              color: primarycolor,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.brown),
                                            ),
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.brown),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text("Total questions")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            CustomContainer(
                                              height: 15,
                                              width: 15,
                                              color: primarycolor,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              "07",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text("correct")
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 60.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              CustomContainer(
                                                height: 15,
                                                width: 15,
                                                color: primarycolor,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.red),
                                              ),
                                              Text(
                                                "03",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text("wrong")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomColumn(
                    text: "play Again",
                    color: Colors.blueAccent,
                    iconButton: IconButton(
                        onPressed: playagain,
                        icon: const Icon(
                          Icons.replay,
                          size: 35,
                        )),
                  ),
                  CustomColumn(
                    text: "Home",
                    color: Colors.brown,
                    iconButton: IconButton(
                        onPressed: home,
                        icon: const Icon(
                          Icons.home,
                          size: 35,
                        )),
                  ),
                  CustomColumn(
                      text: "Share",
                      color: Colors.green,
                      iconButton: IconButton(
                          onPressed: share,
                          icon: const Icon(
                            Icons.share,
                            size: 35,
                          )))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void playagain() {
    Get.toNamed("/questionpage");
  }

  void home() {
    Get.toNamed("/dashboard");
  }

  void share() {
    Get.offAndToNamed("/");
  }
}
