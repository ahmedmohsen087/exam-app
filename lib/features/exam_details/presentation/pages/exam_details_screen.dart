import 'package:exam_app/core/strings/features/exam_details/exam_details_strings.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_param.dart';
import 'package:exam_app/features/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../config/di/di.dart';
import '../../../../core/theme/app_images.dart';
import '../../domain/entities/exam_details_entity.dart';
import '../view_model/cubit/exam_details_cubit.dart';
import '../view_model/states/exam_details_state.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String routeName = ExamDetailsStrings.examDetailsScreen;

  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final subjectId = args?[AppParam.examId];

    const token = ExamDetailsStrings.token;

    return BlocProvider(
      create: (_) =>
          getIt<ExamDetailsCubit>()
            ..getSubjectExams(token: token, subjectId: subjectId ?? ""),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ExamDetailsStrings.examDetailsScreen),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ExamDetailsCubit, ExamDetailsState>(
          builder: (context, state) {
            final examsState = state.subjectExamsState;
            final exams = examsState.data ?? [];

            if (examsState.isLoading && exams.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.black),
              );
            }

            if (!examsState.isLoading && exams.isEmpty) {
              return const Center(
                child: Text(ExamDetailsStrings.noExamsAvailable),
              );
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
                  '${ExamDetailsStrings.questions}: ${exam.numberOfQuestions}',
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('hh:mm a').format(exam.createdAt),
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ExamDetailsStrings.thirtyMinutes,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
