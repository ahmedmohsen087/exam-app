import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/question_option_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/images.dart';
import '../../domain/entities/answer.dart';
import '../../domain/entities/question_type.dart';

class AnswersWidget extends StatefulWidget {
  AnswersWidget({required this.question, required this.size});

  int size;
  Question question;

  @override
  State<AnswersWidget> createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, currentOptionIndex) {
        return QuestionOptionCard(
          question: widget.question,
          selectedIcon: AppImages.selectedBtnIcon,
          unselectedIcon: AppImages.unselectedBtnIcon,
          currentAnswer: widget.question.answers![currentOptionIndex],
          onOptionSelect: selectOption,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: widget.size,
    );
  }

  void selectOption(Question question, Answer currentAnswer) {
    if (question.type == QuestionType.multipleChoice) {
      setState(() {
        currentAnswer.isSelected = !currentAnswer.isSelected;
        question.selectedKeyList?.add(currentAnswer.key);
      });
    } else if (question.type == QuestionType.singleChoice) {
      setState(() {
        for (Answer answer in question.answers!) {
          answer.isSelected = false;
        }
        currentAnswer.isSelected = true;
        question.selectedKey = currentAnswer.key;
      });
    } else {
      print("no case detected");
    }
  }
}
