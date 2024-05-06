// import 'package:finalproject/screens/question.dart';
// import 'package:finalproject/screens/viewall.dart';
// import 'package:finalproject/screens/updateprofile.dart';
// import 'package:finalproject/screens/question.dart';
import 'package:finalproject/utils/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init;
  runApp(GetMaterialApp(
    initialRoute: "/",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
    // home: MyApp(),
  ));
}
