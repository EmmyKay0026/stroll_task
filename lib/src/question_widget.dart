import 'package:flutter/material.dart';
import 'package:stroll_task_1/src/model/question.dart';
import 'package:stroll_task_1/src/theme/app_palette.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel initialQuestion;
  final Function(String optionId) onOptionSelected;

  const QuestionWidget({
    Key? key,
    required this.initialQuestion,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _question;

  @override
  void initState() {
    super.initState();
    _question = widget.initialQuestion;
  }

  void _selectOption(String optionId) {
    setState(() {
      _question = QuestionModel(
        id: _question.id,
        question: _question.question,
        userAnswer: _question.userAnswer,
        options: _question.options,
        selectedOptionId: optionId,
      );
    });

    widget.onOptionSelected(optionId);
  }

  @override
  Widget build(BuildContext context) {
    // Split options into pairs (for 2-column layout)
    final List<List<OptionModel>> optionPairs = [];
    for (int i = 0; i < _question.options.length; i += 2) {
      if (i + 1 < _question.options.length) {
        optionPairs.add([_question.options[i], _question.options[i + 1]]);
      } else {
        optionPairs.add([_question.options[i]]);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question text
        Stack(
          children: [
            Transform.translate(
              offset: Offset(40, -20),
              child: Container(
                padding:
                    EdgeInsets.only(top: 4, bottom: 4, right: 30, left: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xE5121518),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xE5121518),
                ),
                child: Text(
                  'Angelina, 28',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF5F5F5),
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -20),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff121517), width: 6),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/user.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(70, -0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: 250,
                    child: Text(
                      _question.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFF5F5F5),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        if (_question.userAnswer != null)
          Center(
            child: Text(
              '"${_question.userAnswer}"',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: AppColors.secondaryPurple,
                fontSize: 14,
              ),
            ),
          ),

        const SizedBox(height: 16),

        ...optionPairs.map((pair) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...pair.map((option) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: option == pair.last ? 0 : 8,
                          ),
                          child: _buildOptionButton(option),
                        ),
                      )),
                  if (pair.length == 1) const Spacer(),
                ],
              ),
            )),

        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildOptionButton(OptionModel option) {
    final bool isSelected = _question.selectedOptionId == option.id;

    return GestureDetector(
      onTap: () => _selectOption(option.id),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFF232A2E),
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Color(0xff8B88EF))
              : Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xff8B88EF) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  option.label,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                option.text,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
