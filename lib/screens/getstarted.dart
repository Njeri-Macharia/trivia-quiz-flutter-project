import 'package:finalproject/constants/constant.dart';
import '../../views/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondarycolor,
        body: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20),
                    child: CustomText(
                        text:
                            "Its trivia time\nGet on it and\nDO YOUR MAGIC!!!",
                        fontWeight: FontWeight.bold,
                        fontsize: 34,
                        textcolor: secondarycolor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/bulb.png",
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 500),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primarycolor,
                        minimumSize: const Size(250, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                    onPressed: signin,
                    child: const Text(
                      "Play Now!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: whitecolor,
                          fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signin() {
    Get.offAndToNamed("/login");
  }
}
