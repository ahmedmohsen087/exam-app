class BaseState<T> {
  BaseState({required this.isLoading, this.data, this.msg});

  bool isLoading;
  T? data;
  String? msg;
}
