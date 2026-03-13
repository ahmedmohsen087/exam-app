import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecases/forget_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecases/verify_reset_code_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecases/reset_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/states/forget_password_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgotPasswordCubit(
    this._forgotPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgotPasswordState());

  /// Step 1: Send Email
  Future<void> sendEmail(String email) async {
    emit(
      state.copyWith(
        forgotPasswordState: BaseState<ForgotPasswordEntity?>(
          isLoading: true,
          data: null,
          msg: null,
        ),
      ),
    );

    final response = await _forgotPasswordUseCase(email: email);

    if (response is Success<ForgotPasswordEntity>) {
      emit(
        state.copyWith(
          forgotPasswordState: BaseState<ForgotPasswordEntity?>(
            isLoading: false,
            data: response.data,
            msg: null,
          ),
        ),
      );
    } else if (response is Failed<ForgotPasswordEntity>) {
      emit(
        state.copyWith(
          forgotPasswordState: BaseState<ForgotPasswordEntity?>(
            isLoading: false,
            data: null,
            msg: response.msg,
          ),
        ),
      );
    }
  }

  /// Step 2: Verify Reset Code
  Future<void> verifyResetCode(String code) async {
    emit(
      state.copyWith(
        verifyCodeState: BaseState<VerifyResetCodeEntity?>(
          isLoading: true,
          data: null,
          msg: null,
        ),
      ),
    );

    final response = await _verifyResetCodeUseCase(resetCode: code);

    if (response is Success<VerifyResetCodeEntity>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState<VerifyResetCodeEntity?>(
            isLoading: false,
            data: response.data,
            msg: null,
          ),
        ),
      );
    } else if (response is Failed<VerifyResetCodeEntity>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState<VerifyResetCodeEntity?>(
            isLoading: false,
            data: null,
            msg: response.msg,
          ),
        ),
      );
    }
  }

  /// Step 3: Reset Password
  Future<void> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(
      state.copyWith(
        resetPasswordState: BaseState<ResetPasswordEntity?>(
          isLoading: true,
          data: null,
          msg: null,
        ),
      ),
    );

    // Optional: validate that newPassword == confirmPassword before sending
    if (newPassword != confirmPassword) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity?>(
            isLoading: false,
            data: null,
            msg: "Passwords do not match",
          ),
        ),
      );
      return;
    }

    final response = await _resetPasswordUseCase(newPassword: newPassword);

    if (response is Success<ResetPasswordEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity?>(
            isLoading: false,
            data: response.data,
            msg: null,
          ),
        ),
      );
    } else if (response is Failed<ResetPasswordEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity?>(
            isLoading: false,
            data: null,
            msg: response.msg,
          ),
        ),
      );
    }
  }
}
