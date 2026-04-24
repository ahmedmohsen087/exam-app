import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/exam_details_entity.dart';
import '../../../domain/usecases/exam_details_use_case.dart';
import '../states/exam_details_state.dart';

@injectable
class ExamDetailsCubit extends Cubit<ExamDetailsState> {
  final ExamDetailsUseCase _examDetailsUseCase;

  ExamDetailsCubit(this._examDetailsUseCase)
    : super(ExamDetailsState.initial());

  Future<void> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    emit(
      state.copyWith(
        subjectExamsState: BaseState(isLoading: true, data: [], msg: null),
      ),
    );

    final response = await _examDetailsUseCase(
      token: token,
      subjectId: subjectId,
    );

    switch (response) {
      case Success<List<ExamDetailsEntity>>():
        emit(
          state.copyWith(
            subjectExamsState: BaseState(
              isLoading: true,
              data: response.data ?? [],
              msg: null,
            ),
          ),
        );

      case Failed<List<ExamDetailsEntity>>():
        emit(
          state.copyWith(
            subjectExamsState: BaseState(
              isLoading: false,
              data: [],
              msg: response.msg,
            ),
          ),
        );
    }
  }
}
