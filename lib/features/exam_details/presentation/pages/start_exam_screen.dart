import 'package:exam_app/core/strings/features/exam_details/exam_details_strings.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_questions/presentation/pages/exam_questions_page_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/arg_param.dart';

class StartExamScreen extends StatefulWidget {
  static const String routeName = ExamDetailsStrings.startExamScreen;

  const StartExamScreen({super.key});

  @override
  State<StartExamScreen> createState() => _StartExamScreenState();
}

class _StartExamScreenState extends State<StartExamScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final exam =
        ModalRoute.of(context)!.settings.arguments as ExamDetailsEntity;

    print("exam id : ${exam.id}");

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
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
                        "${exam.duration} ${ExamDetailsStrings.minutes}",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    exam.numberOfQuestions == 1
                        ? ExamDetailsStrings.oneQuestion
                        : '${exam.numberOfQuestions} ${ExamDetailsStrings.questions}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray,
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    ExamDetailsStrings.instructions,
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
                        ExamDetailsStrings.readQuestionsCarefully,
                        style: TextStyle(color: AppColors.black),
                      ),
                      SizedBox(height: 6),
                      Text(
                        ExamDetailsStrings.chooseTheCorrectAnswer,
                        style: TextStyle(color: AppColors.black),
                      ),
                      SizedBox(height: 6),
                      Text(
                        ExamDetailsStrings.donotRefreshThePage,
                        style: TextStyle(color: AppColors.black),
                      ),
                      SizedBox(height: 6),
                      Text(
                        ExamDetailsStrings.sumbitBeforeTimeEnds,
                        style: TextStyle(color: AppColors.black),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

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
                      onPressed: () async {
                        setState(() => isLoading = true);

                        await Future.delayed(const Duration(milliseconds: 500));

                        setState(() => isLoading = false);

                        Navigator.pushNamed(
                          context,
                          ExamQuestionsPageScreen.routeName,
                          arguments: {
                            ArgParam.examId: exam.id,

                            ExamDetailsStrings.examId: exam.id,
                            ExamDetailsStrings.title: exam.title,
                          },
                        );
                      },
                      child: const Text(
                        ExamDetailsStrings.start,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.black),
              ),
            ),
        ],
      ),
    );
  }
}
