import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/sign_in/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_in/domain/use_cases/sign_in.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/States/sign_in_state.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/events/sign_in_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  SignInViewModel(this._signInUseCase)
    : super(SignInState(api1State: BaseState(isLoading: false)));
  final SignInUseCase _signInUseCase;

  void doEvent(SignInEvent event) {
    _signIn(event.email, event.password);
  }

  Future<void> _signIn(String email, String password) async {
    emit(
      state.copyWith(
        api1State: BaseState(isLoading: true, data: null, msg: null),
      ),
    );
    var response = await _signInUseCase(email, password);

    switch (response) {
      case Success<User>():
        emit(
          state.copyWith(
            api1State: BaseState(
              isLoading: false,
              data: response.data,
              msg: null,
            ),
          ),
        );
        break;
      case Failed<User>():
        emit(
          state.copyWith(
            api1State: BaseState(
              isLoading: false,
              data: null,
              msg: response.msg,
            ),
          ),
        );
        break;
    }
  }






}
