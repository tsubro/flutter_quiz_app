class QuestionOption {
  final String questionText;
  final String answerText;
  final List<String> answerOptions;

  QuestionOption(
      {required this.questionText,
      required this.answerText,
      required this.answerOptions});

  factory QuestionOption.fromJson(Map<String, dynamic> json) {
    var optionObj = json['options'];

    return QuestionOption(
        questionText: json['question'],
        answerText: json['answer'],
        answerOptions: new List<String>.from(optionObj));
  }
}

class QuizTime {
  String timeStr = "";
}
