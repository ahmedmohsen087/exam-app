import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';

class ExamDetailsState {
  final BaseState<List<ExamDetailsEntity>?> subjectExamsState;

  ExamDetailsState({BaseState<List<ExamDetailsEntity>?>? subjectExamsState})
    : subjectExamsState =
          subjectExamsState ??
          BaseState<List<ExamDetailsEntity>?>(
            isLoading: false,
            data: null,
            msg: null,
          );

  ExamDetailsState copyWith({
    BaseState<List<ExamDetailsEntity>?>? subjectExamsState,
  }) {
    return ExamDetailsState(
      subjectExamsState: subjectExamsState ?? this.subjectExamsState,
    );
  }
}
