import 'package:get/get.dart';
import 'package:finalproject/models/questions_model.dart';

class CategoriesController extends GetxController {
  var categorieslist = [].obs;
  var questionlist = <QuestionsModel>[].obs;

  updatecategories(list) {
    categorieslist.value = list;
  }

  updatequestions(List<QuestionsModel> list) {
    questionlist.value = list;
  }
}
