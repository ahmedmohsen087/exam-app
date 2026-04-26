import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/results/domain/entities/question_with_answer_entity.dart';
import 'package:exam_app/features/results/presentation/widgets/answer_option_tile.dart';
import 'package:flutter/widgets.dart';

class QuestionReviewTile extends StatelessWidget {
  final int index;
  final QuestionWithAnswer question;

  const QuestionReviewTile({
    required this.index,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppColors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Question text
          Text(
            "${index + 1}. ${question.questionText}",
            style: AppTheme.lightTheme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          /// Options
          ...List.generate(
            question.options.length,
            (optionIndex) => AnswerOptionTile(
              text: question.options[optionIndex],
              isCorrect: optionIndex == question.correctAnswerIndex,
              isSelected: optionIndex == question.userAnswerIndex,
            ),
          ),
        ],
      ),
    );
  }
}
