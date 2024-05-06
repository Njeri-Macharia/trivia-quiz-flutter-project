import 'dart:convert';

import 'package:finalproject/constants/constant.dart';
// import 'package:finalproject/controllers/logincotroller.dart';
import 'package:finalproject/utils/preferences.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../views/custom_button.dart';
import '../../views/custom_textfield.dart';
import '../../views/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

Preferences mypref = Preferences();
// var store = GetStorage();
// Logincontroller logincontroller = Get.put(Logincontroller());

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _passwordVisible = false;
 final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          Image.asset(
            "assets/images/bulb.png",
            height: 200,
            width: 200,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: CustomText(
                  text: "Sign in",
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
            controller: email,
            hintcolor: whitecolor,
            prefixIcon: const Icon(
              CupertinoIcons.mail,
              color: whitecolor,
            ),
            hintText: "email",
            fieldcolor: whitecolor,
          ),
          CustomTextField(
            isPassword: true,
            hintcolor: whitecolor,
            controller: password,
            prefixIcon: const Icon(
              CupertinoIcons.lock,
              color: whitecolor,
            ),
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
          CustomButton(
            label: "sign in",
            action: remotelogin,
            size: const Size(250, 40),
            backgroundcolor: secondarycolor,
            forecolor: blackcolor,
          ),
          GestureDetector(
            onTap: signup, // Navigate to create account page
            child: const CustomText(
              text: "Don't have an account? Create one",
              textcolor: whitecolor,
              fontsize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> remotelogin() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "http://nattiee.com/MercyFile/login.php?Email=${email.text.trim()}&Password=${password.text.trim()}"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var loginServer = serverResponse['success'];
      if (loginServer == 1) {
        await mypref.setvalue("user_email", email.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful'),
            duration: Duration(seconds: 2),
            // Adjust duration as needed
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        
        setState(() {
          Get.offAndToNamed("/dashboard");
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red, // Set red color for error indication
            content: Text('Login Error: Invalid email or password'),
            duration: Duration(seconds: 4), // Adjust duration as needed
          ),
        );
      }
    } else {
      print("error ${response.statusCode}");
    }
  }

  // void login() async {
  //   await mypref.setvalue("username", email.text);

  //   Get.toNamed("/dashboard");
  // }

  void signup() {
    Get.offAndToNamed("/signup");
  }
}
