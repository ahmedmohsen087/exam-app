class ToggleHomeScreenState {
  final int currentIndex;

  ToggleHomeScreenState({this.currentIndex = 0});

  ToggleHomeScreenState copyWith({int? currentIndex}) {
    return ToggleHomeScreenState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}