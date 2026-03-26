import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';

class SignUpState {
  SignUpState({BaseState<User>? api1State}) {
    this.api1State = api1State ?? this.api1State;
  }

  BaseState<User> api1State = BaseState(
    isLoading: false,
    msg: null,
    data: null,
  );

  SignUpState copyWith(BaseState<User>? api1State) {
    return SignUpState(api1State: api1State ?? this.api1State);
  }
}
