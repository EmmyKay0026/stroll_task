// Question model to store question data
class QuestionModel {
  final String id;
  final String question;
  final String? userAnswer;
  final List<OptionModel> options;
  final String? selectedOptionId;

  QuestionModel({
    required this.id,
    required this.question,
    this.userAnswer,
    required this.options,
    this.selectedOptionId,
  });
}

class OptionModel {
  final String id;
  final String label;
  final String text;

  OptionModel({
    required this.id,
    required this.label,
    required this.text,
  });
}
