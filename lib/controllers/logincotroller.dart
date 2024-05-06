import 'package:get/get.dart';

class Logincontroller extends GetxController {
  var user_id = 0.obs;
  void updateuserid(userid) {
    user_id.value = userid;
  }
}
