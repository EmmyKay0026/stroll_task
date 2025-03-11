import 'package:stroll_task_1/src/model/question.dart';

final List<QuestionModel> currentQuestion = [
  QuestionModel(
    id: 'q1',
    question: 'What is your favorite time of day?',
    userAnswer: 'Mine is definitely the peace in the morning.',
    options: [
      OptionModel(id: 'a', label: 'A', text: 'The peace in the early mornings'),
      OptionModel(id: 'b', label: 'B', text: 'The magical golden hours'),
      OptionModel(id: 'c', label: 'C', text: 'Wind-down time after dinners'),
      OptionModel(id: 'd', label: 'D', text: 'The serenity past midnight'),
    ],
    selectedOptionId: 'b',
  )
];
