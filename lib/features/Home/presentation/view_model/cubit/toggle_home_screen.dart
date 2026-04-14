

import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/toggle_home_screen_state.dart';

class ToggleHomeScreen extends Cubit<ToggleHomeScreenState> {
  ToggleHomeScreen() : super(ToggleHomeScreenState());

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}