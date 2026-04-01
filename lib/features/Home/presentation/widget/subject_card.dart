import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String image;

  const SubjectCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Row(
          children: [
            Image.network(
              image,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: AppTheme.lightTheme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}