import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/profile/presentation/view_model/states/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState());

  Future<void> resetPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (currentPassword.trim().isEmpty) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<void>(
            isLoading: false,
            msg: 'Current password is required',
          ),
        ),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<void>(
            isLoading: false,
            msg: 'Passwords do not match',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        resetPasswordState: BaseState<void>(isLoading: true),
      ),
    );

    try {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<void>(
            isLoading: false,
            data: null,
            msg: 'Password reset successfully',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<void>(
            isLoading: false,
            msg: e.toString(),
          ),
        ),
      );
    }
  }

  void clearState() {
    emit(
      state.copyWith(
        resetPasswordState: BaseState<void>(
          isLoading: false,
          data: null,
          msg: null,
        ),
      ),
    );
  }
}
