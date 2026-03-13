import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';

class ForgotPasswordState {
  ForgotPasswordState({
    BaseState<ForgotPasswordEntity?>? forgotPasswordState,
    BaseState<VerifyResetCodeEntity?>? verifyCodeState,
    BaseState<ResetPasswordEntity?>? resetPasswordState,
  }) {
    this.forgotPasswordState = forgotPasswordState ?? this.forgotPasswordState;
    this.verifyCodeState = verifyCodeState ?? this.verifyCodeState;
    this.resetPasswordState = resetPasswordState ?? this.resetPasswordState;
  }

  // Null-safe BaseState
  BaseState<ForgotPasswordEntity?> forgotPasswordState =
      BaseState<ForgotPasswordEntity?>(isLoading: false, data: null, msg: null);

  BaseState<VerifyResetCodeEntity?> verifyCodeState =
      BaseState<VerifyResetCodeEntity?>(
        isLoading: false,
        data: null,
        msg: null,
      );

  BaseState<ResetPasswordEntity?> resetPasswordState =
      BaseState<ResetPasswordEntity?>(isLoading: false, data: null, msg: null);

  ForgotPasswordState copyWith({
    BaseState<ForgotPasswordEntity?>? forgotPasswordState,
    BaseState<VerifyResetCodeEntity?>? verifyCodeState,
    BaseState<ResetPasswordEntity?>? resetPasswordState,
  }) {
    return ForgotPasswordState(
      forgotPasswordState: forgotPasswordState ?? this.forgotPasswordState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
