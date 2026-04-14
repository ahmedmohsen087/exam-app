import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/exam_details_entity.dart';

class ExamDetailsState {
  final BaseState<List<ExamDetailsEntity>> subjectExamsState;

  ExamDetailsState({BaseState<List<ExamDetailsEntity>>? subjectExamsState})
    : subjectExamsState =
          subjectExamsState ??
          BaseState<List<ExamDetailsEntity>>(
            isLoading: false,
            data: const [],
            msg: null,
          );

  ExamDetailsState copyWith({
    BaseState<List<ExamDetailsEntity>>? subjectExamsState,
  }) {
    return ExamDetailsState(
      subjectExamsState: subjectExamsState ?? this.subjectExamsState,
    );
  }
}
