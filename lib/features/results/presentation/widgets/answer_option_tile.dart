import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AnswerOptionTile extends StatelessWidget {
  final String text;
  final bool isCorrect;
  final bool isSelected;

  const AnswerOptionTile({
    required this.text,
    required this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    /// لازم يكونوا Color مش AppColors
    Color borderColor = AppColors.lightGray;
    Color bgColor = Colors.transparent;
    Color textColor = AppColors.black;

    /// 🎯 logic زي الصورة
    if (isCorrect) {
      borderColor = AppColors.green;
      bgColor = AppColors.green.withOpacity(0.1);
      textColor = AppColors.green;
    } else if (isSelected && !isCorrect) {
      borderColor = AppColors.red;
      bgColor = AppColors.red.withOpacity(0.1);
      textColor = AppColors.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          /// Circle indicator
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
              color: isSelected ? borderColor : Colors.transparent,
            ),
          ),

          const SizedBox(width: 10),

          /// Text
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
