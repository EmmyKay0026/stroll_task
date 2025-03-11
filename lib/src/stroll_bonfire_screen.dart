import 'package:flutter/material.dart';
import 'package:stroll_task_1/src/model/question.dart';
import 'package:stroll_task_1/src/question_widget.dart';
import 'package:stroll_task_1/src/theme/app_palette.dart';

class StrollBonfirePage extends StatefulWidget {
  const StrollBonfirePage({super.key});

  @override
  State<StrollBonfirePage> createState() => _StrollBonfirePageState();
}

class _StrollBonfirePageState extends State<StrollBonfirePage> {
  final _currentQuestion = QuestionModel(
    id: 'q1',
    question: 'What is your favorite time of day?',
    userAnswer: 'Mine is definitely the peace in the morning.',
    options: [
      OptionModel(id: 'a', label: 'A', text: 'The peace in the early mornings'),
      OptionModel(id: 'b', label: 'B', text: 'The magical golden hours'),
      OptionModel(id: 'c', label: 'C', text: 'Wind-down time after dinners'),
      OptionModel(id: 'd', label: 'D', text: 'The serenity past midnight'),
    ],
    selectedOptionId: 'd', // Default selected option
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/video.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              // App bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: .0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stroll Bonfire',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCCC8FF),
                        shadows: const [
                          Shadow(
                            blurRadius: 4.0,
                            color: Color(0xffBEBEBE),
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFCCC8FF),
                    ),
                    // const Spacer(),
                  ],
                ),
              ),

              // Time and participants info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('22h 00m', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Row(
                      children: const [
                        Icon(Icons.person_outlined,
                            color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('103', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // User post
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    QuestionWidget(
                        initialQuestion: _currentQuestion,
                        onOptionSelected: (selectedOptionId) {
                          setState(() {
                            return;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pick your option. \nSee who has a similar mind.',
                          style:
                              TextStyle(color: Color(0xffE5E5E5), fontSize: 12),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 13),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryPurple),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.mic,
                                color: AppColors.primaryPurple,
                                size: 26,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 13),
                              decoration: BoxDecoration(
                                color: AppColors.primaryPurple,
                                // border: Border.all(color: AppColors.primaryPurple),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xff020202),
                                size: 26,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
