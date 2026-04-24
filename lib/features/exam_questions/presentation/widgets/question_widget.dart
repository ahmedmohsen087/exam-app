import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/arg_param.dart';
import 'package:exam_app/core/values/ui_strings.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question_type.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/event/questions_event.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/state/question_state.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/answers_widget.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/back_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  String nextBtnText = UiStrings.next;

  late double progress;

  @override
  void initState() {
    progress = _calculateProgress(totalQuestions, currentQuestionIndex);
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
            "Question ${currentQuestionIndex + 1} of $totalQuestions",
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
            currentQuestion.question ?? UiStrings.noContent,
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
                    onPress: _backBtnClick,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BackNextBtn(
                    backgroundColor: AppColors.blue,
                    borderColor: Colors.transparent,
                    text: nextBtnText,
                    textColor: AppColors.white,
                    onPress: _nextBtnClick,
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

// Added
  void _nextBtnClick() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        progress = _calculateProgress(totalQuestions, currentQuestionIndex);
        if (currentQuestionIndex == totalQuestions - 1) {
          nextBtnText = UiStrings.finish;
        }
      });
    } else if (currentQuestionIndex == totalQuestions - 1) {
      _finishExam();
    }
  }

  void _backBtnClick() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        nextBtnText = UiStrings.next;
        progress = _calculateProgress(totalQuestions, currentQuestionIndex);
      });
    }
  }

  void _finishExam() {
    final questions = widget.state.questionsApi.data!;

    final total = questions.length;
    context.read<QuestionsCubit>().doEvent(
          SubmitExamEvent(questions: questions),
        );
    // final correct = _calculateCorrectAnswers(questions);

    // _goToScoreScreen(total, correct);
  }

  double _calculateProgress(int total, int currentIndex) {
    return (currentIndex + 1) / total;
  }

//   void _navigateToExamScoreScreen() {
//     int totalN = totalQuestions;
//     int correctN = _calcCorrect(widget.state.questionsApi.data!);
//     int inCorrectN = totalN - correctN;
//     Navigator.of(context).pushNamed(
//       ExamScorePage.routeName,
//       arguments: {
//         ArgParam.totalN: totalN,
//         ArgParam.correctN: correctN,
//         ArgParam.inCorrectN: inCorrectN,
//       },
//     );
//   }
// }

// int _calcCorrect(List<Question> questions) {
//   int correctN = 0;
//   for (Question q in questions) {
//     if (q.type == QuestionType.multipleChoice) {
//       // n
//     } else if (q.type == QuestionType.singleChoice) {
//       if (q.selectedKey == q.correctKey) {
//         correctN++;
//       }
//     }
//   }
//   return correctN;
// }

// double _calcCurrentIndex(int totalQuestions, int currentQuestionIndex) {
//   currentQuestionIndex++;
//   double progress = (currentQuestionIndex / totalQuestions);
//   return progress;
// }
}
