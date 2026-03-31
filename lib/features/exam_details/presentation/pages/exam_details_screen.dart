import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_images.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:exam_app/features/exam_details/presentation/view_model/cubit/exam_details_cubit.dart';
import 'package:exam_app/features/exam_details/presentation/view_model/states/exam_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String routeName = 'ExamDetailsScreen';
  static const String argSubjectId = '670037f6728c92b7fdf434fc';

  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final subjectId = args?[argSubjectId] ?? '670037f6728c92b7fdf434fc';

    // hard-coded token for debug
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YjBiZmE1Y2ViMmM1OWY4NGEzY2ViYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0OTY0MTIyfQ.isWo4zFoQLWLgoi2n4P_qLMKribP_ntwGeHTUD8nMyg";

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
              return const Center(child: Text("No exams available"));
            }

            return _buildExamsList(exams);
          },
        ),
      ),
    );
  }

  Widget _buildExamsList(List<ExamDetailsEntity> exams) {
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
            leading: Image.asset(AppImages.examIcon, fit: BoxFit.cover),
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
                const SizedBox(height: 4),
                Text(
                  'Date: ${date.day}/${date.month}/${date.year}',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: const Text(
              'Start',
              style: TextStyle(color: AppColors.blue),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                StartExamScreen.routeName,
                arguments: {StartExamScreen.argExamId: exam.id},
              );
            },
          ),
        );
      },
    );
  }
}
