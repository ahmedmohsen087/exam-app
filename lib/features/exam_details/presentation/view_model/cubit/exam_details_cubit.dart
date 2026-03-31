import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_details/domain/usecases/exam_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../states/exam_details_state.dart';
import 'package:exam_app/config/base_response/base_response.dart';

@injectable
class ExamDetailsCubit extends Cubit<ExamDetailsState> {
  final ExamDetailsUseCase _useCase;

  ExamDetailsCubit(this._useCase) : super(ExamDetailsState());

  Future<void> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    emit(
      state.copyWith(
        subjectExamsState: BaseState<List<ExamDetailsEntity>?>(isLoading: true),
      ),
    );

    final response = await _useCase(token: token, subjectId: subjectId);

    if (response is Success<List<ExamDetailsEntity>>) {
      emit(
        state.copyWith(
          subjectExamsState: BaseState(isLoading: false, data: response.data),
        ),
      );
    } else if (response is Failed<List<ExamDetailsEntity>>) {
      emit(
        state.copyWith(
          subjectExamsState: BaseState(isLoading: false, msg: response.msg),
        ),
      );
    }
  }
}
