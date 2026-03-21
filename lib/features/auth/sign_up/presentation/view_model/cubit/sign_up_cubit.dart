import 'package:bloc/bloc.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:exam_app/features/auth/sign_up/presentation/view_model/events/sign_up_event.dart';
import 'package:exam_app/features/auth/sign_up/presentation/view_model/states/sign_up_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpState());

  SignUpUseCase _signUpUseCase;

  void doEvent(SignUpEvent event) {
    _signUp(
      event.username,
      event.firstName,
      event.lastName,
      event.email,
      event.password,
      event.rePassword,
      event.phone,
    );
  }

  Future<void> _signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    emit(state.copyWith(BaseState(isLoading: true, msg: null, data: null)));
    var response = await _signUpUseCase(
      username: username,
      email: email,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      password: password,
      rePassword: rePassword,
    );

    switch (response) {
      case Success<User>():
        emit(
          state.copyWith(
            BaseState(isLoading: false, data: response.data, msg: null),
          ),
        );
        break;
      case Failed<User>():
        emit(
          state.copyWith(
            BaseState(isLoading: false, data: null, msg: response.msg),
          ),
        );
        break;
    }
  }
}
