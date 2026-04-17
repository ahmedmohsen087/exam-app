import 'package:exam_app/core/values/arg_param.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../exam_details/presentation/pages/exam_details_screen.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String image;
  final String token ;



  const SubjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ExamDetailsScreen.routeName, arguments: {ArgParam.token: token, });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(1, 1),
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
        ),
      ),
    );
  }
}