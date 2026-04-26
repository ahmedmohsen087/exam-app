import 'package:exam_app/features/results/presentation/view_model/cubit/results_cubit.dart';
import 'package:exam_app/features/results/presentation/view_model/events/results_events.dart';
import 'package:exam_app/features/results/presentation/view_model/states/results_state.dart';
import 'package:exam_app/features/results/presentation/widgets/exam_results_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsScreen extends StatelessWidget {
  static const String routeName = "results_screen";

  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          context.read<ResultsCubit>()..onEvent(LoadResultsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Results"),
          centerTitle: true,
        ),
        body: BlocBuilder<ResultsCubit, ResultsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error!));
            }

            if (state.attempts.isEmpty) {
              return const Center(child: Text("No Results Yet"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.attempts.length,
              itemBuilder: (context, index) {
                return ExamResultCard(
                  attempt: state.attempts[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
