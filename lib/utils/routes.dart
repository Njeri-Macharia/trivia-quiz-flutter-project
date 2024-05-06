import 'package:finalproject/screens/dashboard.dart';
import 'package:finalproject/screens/getstarted.dart';
import 'package:finalproject/screens/question.dart';
import 'package:finalproject/screens/result.dart';
// import 'package:finalproject/screens/question.dart';
import 'package:finalproject/screens/signin.dart';
import 'package:finalproject/screens/signup.dart';
import 'package:finalproject/screens/updateprofile.dart';
import 'package:finalproject/screens/userprofile.dart';
import 'package:finalproject/screens/viewall.dart';
import 'package:get/route_manager.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const GetStarted()),
    GetPage(name: "/login", page: () => const Login()),
    GetPage(name: "/signup", page: () => SignUp()),
    GetPage(name: "/dashboard", page: () => const Dashboard()),
    GetPage(name: "/userprofile", page: () => Userprofile()),
    GetPage(name: "/questionpage", page: () => MyApp()),
    GetPage(name: "/result", page: () => const Completed()),
    GetPage(name: "/profile", page: () => UpdateProfile()),
    GetPage(name: "/viewall", page: () => const ViewallScreen())
  ];
}
