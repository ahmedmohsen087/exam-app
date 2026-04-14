import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_param.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/state/question_state.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/answers_widget.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/back_next_btn.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/question.dart';
import '../pages/exam_score_page.dart';

class QuestionWidget extends StatefulWidget {
  QuestionWidget(this.state, {super.key});

  QuestionState state;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late int totalQuestions = widget.state.questionsApi.data!.length;
  int currentQuestionIndex = 0;

  String nextBtnText = AppParam.next;

  late double progress;

  @override
  void initState() {
    progress = calcCurrentIndex(totalQuestions, currentQuestionIndex);
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion =
        widget.state.questionsApi.data![currentQuestionIndex];

    int answersSize =
        widget.state.questionsApi.data?[currentQuestionIndex].answers?.length ??
        0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Question ${currentQuestionIndex + 1} of ${totalQuestions}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3),
          LinearProgressIndicator(
            value: progress.toDouble(),
            backgroundColor: AppColors.gray,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
            minHeight: 6,
          ),

          SizedBox(height: 28),
          Text(
            currentQuestion.question ?? "No Content",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            flex: 4,
            child: AnswersWidget(question: currentQuestion, size: answersSize),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BackNextBtn(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.blue,
                    text: "Back",
                    textColor: AppColors.blue,
                    onPress: backBtnClick,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BackNextBtn(
                    backgroundColor: AppColors.blue,
                    borderColor: Colors.transparent,
                    text: nextBtnText,
                    textColor: AppColors.white,
                    onPress: () => nextBtnClick(),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void nextBtnClick() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        progress = calcCurrentIndex(totalQuestions, currentQuestionIndex);
        if (currentQuestionIndex == totalQuestions - 1) {
          nextBtnText = AppParam.finish;
        }
      });
    } else if (currentQuestionIndex == totalQuestions - 1) {
      navigateToExamScoreScreen();
    }
  }

  void backBtnClick() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        nextBtnText = AppParam.next;
        progress = calcCurrentIndex(totalQuestions, currentQuestionIndex);
      });
    }
  }

  void navigateToExamScoreScreen() {
    Navigator.of(context).pushNamed(
      ExamScorePage.routeName,
      arguments: {AppParam.questions: widget.state.questionsApi.data},
    );
  }
}

double calcCurrentIndex(int totalQuestions, int currentQuestionIndex) {
  currentQuestionIndex++;
  double progress = (currentQuestionIndex / totalQuestions);
  return progress;
}
