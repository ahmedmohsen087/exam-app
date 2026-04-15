class BaseState<T> {
  BaseState({required this.isLoading, this.data, this.msg});

  final bool isLoading;
  final T? data;
  final String? msg;
}
