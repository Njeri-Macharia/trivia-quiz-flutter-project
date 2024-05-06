import 'package:get/get.dart';

class SignUpController extends GetxController {
  var passwordVisible = true.obs;

  passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
