import 'package:exam_app/core/values/app_param.dart';
import 'package:exam_app/features/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../core/theme/app_images.dart';
import '../../domain/entities/exam_details_entity.dart';
import '../view_model/cubit/exam_details_cubit.dart';
import '../view_model/states/exam_details_state.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String routeName = 'Exam Details Screen';

  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final subjectId = args?[AppParam.examId] ?? '670037f6728c92b7fdf434fc';

    // 🔹 hard-coded token for debug
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhYmM0MDRkYTBkNGNmNTU2OTQ5NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc2MTgxMDkwfQ.iWtX1hYzVH3bgCEEUSluXosoBi3ArNnHGihwU4zx00Q";
    return BlocProvider(
      create: (_) =>
          getIt<ExamDetailsCubit>()
            ..getSubjectExams(token: token, subjectId: subjectId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exam Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ExamDetailsCubit, ExamDetailsState>(
          builder: (context, state) {
            final examsState = state.subjectExamsState;

            if (examsState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (examsState.msg != null && examsState.msg!.isNotEmpty) {
              return Center(child: Text(examsState.msg!));
            }

            final exams = examsState.data ?? [];

            if (exams.isEmpty) {
              return const Center(child: Text('No Exams Available'));
            }

            return _buildExamsList(context, exams);
          },
        ),
      ),
    );
  }

  Widget _buildExamsList(BuildContext context, List<ExamDetailsEntity> exams) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        final date = exam.createdAt;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Image.asset(
              AppImages.examIcon,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
            title: Text(
              exam.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Questions: ${exam.numberOfQuestions}',
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text('$date', style: const TextStyle(fontSize: 13)),
              ],
            ),
            trailing: const Text(
              '30 Minutes',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                StartExamScreen.routeName,
                arguments: exam,
              );
            },
          ),
        );
      },
    );
  }
}
