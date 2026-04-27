import 'package:exam_app/features/results/domain/usecases/results_use_case.dart';
import 'package:exam_app/features/results/presentation/view_model/events/results_events.dart';
import 'package:exam_app/features/results/presentation/view_model/states/results_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultsCubit extends Cubit<ResultsState> {
  final ResultsUseCase useCase;

  ResultsCubit(this.useCase) : super(ResultsState());

  void onEvent(ResultsEvent event) {
    switch (event) {
      case LoadResultsEvent():
        _loadResults();
        break;

      case SaveAttemptEvent():
        _saveAttempt(event);
        break;
    }
  }

  Future<void> _loadResults() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final data = await useCase.getAttempts();

      emit(state.copyWith(isLoading: false, attempts: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _saveAttempt(SaveAttemptEvent event) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await useCase.saveAttempt(event.attempt);

      final data = await useCase.getAttempts();

      emit(state.copyWith(isLoading: false, attempts: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
