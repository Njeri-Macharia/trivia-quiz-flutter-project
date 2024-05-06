import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:finalproject/constants/constant.dart';
import '../../views/custom_button.dart';
import '../../views/custom_textfield.dart';
import '../../views/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/bulb.png",
                height: 100,
                width: 100,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: CustomText(
                      text: "Sign Up",
                      fontsize: 28,
                      fontWeight: FontWeight.bold,
                      textcolor: whitecolor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: firstname,
                prefixIcon: const Icon(
                  CupertinoIcons.person,
                  color: whitecolor,
                ),
                hintText: "first name",
              ),
              CustomTextField(
                controller: lastname,
                prefixIcon: const Icon(
                  CupertinoIcons.person,
                  color: whitecolor,
                ),
                hintText: "last name",
              ),
              CustomTextField(
                controller: email,
                prefixIcon: const Icon(CupertinoIcons.mail, color: whitecolor),
                hintText: "example@gmail.com",
              ),
              CustomTextField(
                controller: password,
                prefixIcon: const Icon(CupertinoIcons.lock, color: whitecolor),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: whitecolor,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                hintText: "password",
                obscureText: !_passwordVisible,
              ),
              CustomTextField(
                controller: confirmpassword,
                prefixIcon: const Icon(CupertinoIcons.lock, color: whitecolor),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: whitecolor,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                hintText: "confirm password",
                obscureText: !_passwordVisible,
              ),
              CustomButton(
                action: serverSignup,
                label: "sign up",
                forecolor: blackcolor,
                size: const Size(250, 40),
                backgroundcolor: secondarycolor,
              ),
              GestureDetector(
                onTap: navigatesignin, // Navigate to create account page
                child: const CustomText(
                  text: "Already have an account? Sign in",
                  textcolor: whitecolor,
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> serverSignup() async {
    http.Response response;
    var body = {
      'FirstName': firstname.text.trim(),
      'LastName': lastname.text.trim(),
      'Email': email.text.trim(),
      'Password': password.text.trim(),
    };
    response = await http.post(
        Uri.parse("https://nattiee.com/MercyFile/signup.php"),
        body: body);
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp = serverResponse['success'];
      if (signedUp == 1) {
        Get.offAndToNamed("/login");
        print("account created");
      } else {
        print("Account not created");
      }
    }
  }

  void navigatesignin() {
    Get.offAndToNamed("/login");
  }
}
