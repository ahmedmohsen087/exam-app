import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:flutter/material.dart';

import '../../../exam_questions/presentation/pages/exam_questions_page_screen.dart';

class StartExamScreen extends StatelessWidget {
  static const String routeName = 'Start Exam Screen';

  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exam =
        ModalRoute.of(context)!.settings.arguments as ExamDetailsEntity;

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Duration
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      exam.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Text(
                    "${exam.duration} Minutes",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Questions count
              Text(
                exam.numberOfQuestions == 1
                    ? '1 Question'
                    : '${exam.numberOfQuestions} Questions',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight(500),
                  color: AppColors.gray,
                ),
              ),

              const SizedBox(height: 40),

              // Instructions title
              const Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 12),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Read questions carefully.",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Choose the correct answer.",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Don't refresh the page.",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Submit before time ends.",
                    style: TextStyle(color: AppColors.black),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Start button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ExamQuestionsPageScreen.routeName,
                      arguments: {'examId': exam.id, 'title': exam.title},
                    );
                  },
                  child: const Text("Start", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
