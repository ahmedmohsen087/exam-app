import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/sign_in/domain/entities/user.dart';

class SignInState {
  SignInState({BaseState<User>? api1State}){
    this.api1State = api1State ?? this.api1State;
  }

  BaseState<User>api1State = BaseState(isLoading: true);

  SignInState copyWith({BaseState<User>? api1State}) {
    return SignInState(api1State: api1State ?? this.api1State);
  }
}


