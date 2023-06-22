class PortugueseQuestion {
  PortugueseQuestion(
      {required this.id,
      required this.questionText,
      required this.texts,
      required this.answers,
      required this.correctAnswer});
  int id;
  String questionText;
  List<dynamic> texts;
  List<String> answers;
  int correctAnswer;
}
