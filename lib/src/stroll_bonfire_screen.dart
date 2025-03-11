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
        Column(
          children: [
            // SvgPicture.asset("assets/images/backgroundvideo.svg"),
            Image.asset(
              "assets/images/video.png",
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff000000), Color(0xff000000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Column(
            children: [
              // App bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                            blurRadius: 10.0,
                            color: Colors.black26,
                            offset: Offset(0, 2),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.access_time,
                              color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text('22h 00m',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.people, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text('103', style: TextStyle(color: Colors.white)),
                        ],
                      ),
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
                    const SizedBox(height: 16),
                    QuestionWidget(
                        initialQuestion: _currentQuestion,
                        onOptionSelected: (selectedOptionId) {
                          setState(() {
                            return;
                          });
                        }),
                    Row(
                      children: [
                        Text(
                          'Pick your option. \n See who has a similar mind.',
                          style:
                              TextStyle(color: Color(0xffE5E5E5), fontSize: 14),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryPurple),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.mic,
                            color: AppColors.primaryPurple,
                            size: 35,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple,
                            // border: Border.all(color: AppColors.primaryPurple),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xff020202),
                            size: 35,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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

// Widget _buildOptionButton(String option, String content, bool isSelected) {
//   return GestureDetector(
//     child: Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.6),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 24,
//               height: 24,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white),
//               ),
//               child: const Center(
//                 child: Text(
//                   'C',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8),
//             const Expanded(
//               child: Text(
//                 'Wind-down time after dinners',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
