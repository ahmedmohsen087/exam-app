import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam_questions/domain/entities/answer.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionOptionCard extends StatefulWidget {
  QuestionOptionCard({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.question,
    required this.currentAnswer,
    required this.onOptionSelect,
  });

  Question question;
  String selectedIcon;
  String unselectedIcon;
  Answer currentAnswer;
  void Function(Question question, Answer currentAnswer) onOptionSelect;

  @override
  State<QuestionOptionCard> createState() => _QuestionOptionCardState();
}

class _QuestionOptionCardState extends State<QuestionOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(17.5),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onOptionSelect(widget.question, widget.currentAnswer);
              });
            },
            icon: SvgPicture.asset(
              widget.currentAnswer.isSelected
                  ? widget.selectedIcon
                  : widget.unselectedIcon,
            ),
          ),
          SizedBox(width: 1.5),
          Expanded(
            child: Text(
              widget.question.question ?? "--",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
