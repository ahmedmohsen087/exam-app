import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_param.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/event/questions_event.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/state/question_state.dart';
import 'package:exam_app/features/exam_questions/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamQuestionsPageScreen extends StatelessWidget {
  static const String routeName = 'Exam Page Screen';

  ExamQuestionsPageScreen({super.key});

  static const String argExamId = 'examId';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String examId = args?[argExamId] ?? 'No ID';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          AppParam.exam,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),

      body: BlocProvider<QuestionsCubit>(
        create: (context) => getIt<QuestionsCubit>()
          ..doEvent(
            GetAllQuestionsOnExamEvent(
              token:
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YWM2ZDkyY2ViMmM1OWY4NGEzYzg4YyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0NjE3MTY0fQ.5vTrWWcmqm-FGQOidMCegKeALafp0RL5l9c2fyChhe0",
              examId: examId,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<QuestionsCubit, QuestionState>(
            builder: (context, state) {
              if (state.questionsApi.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              if (state.questionsApi.msg != null) {
                return Center(child: Text(state.questionsApi.msg!));
              }
              return QuestionWidget(state);
            },
          ),
        ),
      ),
    );
  }
}
