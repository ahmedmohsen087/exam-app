import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';

class ExamDetailsState {
  final BaseState<List<ExamDetailsEntity>> subjectExamsState;

  const ExamDetailsState({required this.subjectExamsState});

  factory ExamDetailsState.initial() {
    return ExamDetailsState(
      subjectExamsState: BaseState<List<ExamDetailsEntity>>(
        isLoading: true,
        data: <ExamDetailsEntity>[],
        msg: null,
      ),
    );
  }

  ExamDetailsState copyWith({
    BaseState<List<ExamDetailsEntity>>? subjectExamsState,
  }) {
    return ExamDetailsState(
      subjectExamsState: subjectExamsState ?? this.subjectExamsState,
    );
  }
}
