import 'package:finalproject/constants/constant.dart';
import '../../views/custom_button.dart';
import '../../views/custom_textfield.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/think.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text("Mercy Macharia"),
                      CustomButton(label: "Delete"),
                    ],
                  ),
                ],
              ),
              CustomTextField(
                controller: firstname,
                hintText: "firstname",
                hintcolor: blackcolor,
              ),
              CustomTextField(
                controller: lastname,
                hintText: "lastname",
                hintcolor: blackcolor,
              ),
              CustomTextField(
                controller: email,
                hintText: "email",
                hintcolor: blackcolor,
              ),
              CustomTextField(
                controller: password,
                hintText: "null",
                hintcolor: blackcolor,
              ),
              const CustomButton(
                label: "SAVE",
                backgroundcolor: primarycolor,
                forecolor: whitecolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
