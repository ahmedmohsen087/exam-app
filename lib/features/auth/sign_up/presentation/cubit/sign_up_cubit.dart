import 'package:bloc/bloc.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
