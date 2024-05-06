class QuestionsModel {
  var question_id;
  var question;
  var option_1;
  var option_2;
  var option_3;
  var correct;
  var categories_id;
  QuestionsModel(
      {this.question_id,
      required this.question,
      required this.option_1,
      required this.option_2,
      required this.option_3,
      required this.correct,
      this.categories_id});
  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
        question_id: json['question_id'],
        question: json['question'],
        option_1: json['option_1'],
        option_2: json['Option_2'],
        option_3: json['Option_3'],
        correct: json['correct'],
        categories_id: json['Categories_id']);
  }
}
