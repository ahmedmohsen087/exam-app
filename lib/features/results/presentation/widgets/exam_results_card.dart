import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/presentation/pages/review_screen.dart';
import 'package:flutter/material.dart';

class ExamResultCard extends StatelessWidget {
  final ExamAttempt attempt;

  const ExamResultCard({required this.attempt});

  @override
  Widget build(BuildContext context) {
    final percent = attempt.score / 100;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ReviewScreen.routeName,
          arguments: attempt,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppColors.black,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 12),

            /// TEXT + PROGRESS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attempt.title,
                    style: AppTheme.lightTheme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "You answered ${attempt.score}%",
                    style: TextStyle(color: AppColors.gray),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: percent,
                      minHeight: 6,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation(
                        _getScoreColor(percent),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            _buildLevelBadge(percent),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.school, color: AppColors.blue),
    );
  }

  Widget _buildLevelBadge(double percent) {
    final color = _getScoreColor(percent);

    final text = percent >= 0.8
        ? "High"
        : percent >= 0.5
            ? "Medium"
            : "Low";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getScoreColor(double percent) {
    if (percent >= 0.8) return Colors.green;
    if (percent >= 0.5) return Colors.orange;
    return Colors.red;
  }
}
