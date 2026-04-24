import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/arg_param.dart';
import 'package:exam_app/core/values/ui_strings.dart';
import 'package:exam_app/features/exam_questions/presentation/pages/exam_score_page.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/event/questions_event.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/state/question_state.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamQuestionsPageScreen extends StatelessWidget {
  static const String routeName = 'Exam Page Screen';

  ExamQuestionsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String examId = args?[ArgParam.examId] ?? 'No ID';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          UiStrings.exam,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: BlocProvider<QuestionsCubit>(
        create: (context) => getIt<QuestionsCubit>()
          ..doEvent(
            GetAllQuestionsOnExamEvent(
              token:
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhYmM0MDRkYTBkNGNmNTU2OTQ5NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc2MTgxMDkwfQ.iWtX1hYzVH3bgCEEUSluXosoBi3ArNnHGihwU4zx00Q",
              examId: examId,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // ADDED: BlocListener to handle side effects (like navigation to score screen) after exam submission.
          // We don't use it for UI rendering; only for actions triggered by state changes.
          child: BlocListener<QuestionsCubit, QuestionState>(
            listener: (context, state) {
              if (state is ExamSubmittedState) {
                Navigator.pushNamed(
                  context,
                  ExamScorePage.routeName,
                  arguments: {
                    ArgParam.totalN: state.total,
                    ArgParam.correctN: state.correct,
                    ArgParam.inCorrectN: state.total - state.correct,
                  },
                );
              }
            },
            child: BlocBuilder<QuestionsCubit, QuestionState>(
              builder: (context, state) {
                if (state.questionsApi.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }

                if (state.questionsApi.msg != null) {
                  return Center(
                    child: Text(
                      state.questionsApi.msg!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                //  Added: Check for null or empty data before rendering the QuestionWidget to avoid errors and provide user feedback.
                if (state.questionsApi.data == null ||
                    state.questionsApi.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No Questions Available',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.black),
                    ),
                  );
                }

                return QuestionWidget(state);
              },
            ),
          ),
        ),
      ),
    );
  }
}
