import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedpage = 0.obs;
  updateSelectedPage(index) {
    selectedpage.value = index;
  }
}
