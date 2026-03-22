import 'package:bloc/bloc.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/events/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/states/forget_password_state.dart';
import 'package:injectable/injectable.dart';

import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/base_state/base_state.dart';

import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';

import 'package:exam_app/features/auth/forget_password/domain/usecases/forget_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecases/reset_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecases/verify_reset_code_use_case.dart';

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

  // 🔥 MVI entry point (Event Dispatcher)
  Future<void> onEvent(ForgetPasswordEvents event) async {
    if (event is SendEmailEvent) {
      await _sendEmail(event.email);
    } else if (event is VerifyResetCodeEvent) {
      await _verifyResetCode(event.resetCode);
    } else if (event is ResetPasswordEvent) {
      await _resetPassword(event);
    }
  }

  Future<void> _sendEmail(String email) async {
    emit(
      state.copyWith(
        forgotPasswordState: BaseState<ForgotPasswordEntity?>(isLoading: true),
      ),
    );

    final response = await _forgotPasswordUseCase(email: email);

    if (response is Success<ForgotPasswordEntity>) {
      emit(
        state.copyWith(
          forgotPasswordState: BaseState(isLoading: false, data: response.data),
        ),
      );
    } else if (response is Failed<ForgotPasswordEntity>) {
      emit(
        state.copyWith(
          forgotPasswordState: BaseState(isLoading: false, msg: response.msg),
        ),
      );
    }
  }

  Future<void> _verifyResetCode(String code) async {
    emit(
      state.copyWith(
        verifyCodeState: BaseState<VerifyResetCodeEntity?>(isLoading: true),
      ),
    );

    final response = await _verifyResetCodeUseCase(resetCode: code);

    if (response is Success<VerifyResetCodeEntity>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState(isLoading: false, data: response.data),
        ),
      );
    } else if (response is Failed<VerifyResetCodeEntity>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState(isLoading: false, msg: response.msg),
        ),
      );
    }
  }

  Future<void> _resetPassword(ResetPasswordEvent event) async {
    // validation first
    if (event.newPassword != event.confirmPassword) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity?>(
            isLoading: false,
            msg: "Passwords do not match",
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        resetPasswordState: BaseState<ResetPasswordEntity?>(isLoading: true),
      ),
    );

    final response = await _resetPasswordUseCase(
      newPassword: event.newPassword,
      email: event.email,
    );

    if (response is Success<ResetPasswordEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState(isLoading: false, data: response.data),
        ),
      );
    } else if (response is Failed<ResetPasswordEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState(isLoading: false, msg: response.msg),
        ),
      );
    }
  }
}
