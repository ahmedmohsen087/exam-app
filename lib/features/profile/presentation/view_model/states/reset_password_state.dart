import 'package:exam_app/config/base_state/base_state.dart';

class ResetPasswordState {
  ResetPasswordState({
    BaseState<void>? resetPasswordState,
  }) {
    this.resetPasswordState = resetPasswordState ?? this.resetPasswordState;
  }

  BaseState<void> resetPasswordState =
      BaseState<void>(isLoading: false, data: null, msg: null);

  ResetPasswordState copyWith({
    BaseState<void>? resetPasswordState,
  }) {
    return ResetPasswordState(
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
