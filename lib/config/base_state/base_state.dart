class BaseState<T> {
  BaseState({required this.isLoading, required this.data, this.msg});

  bool isLoading;
  T data;
  String? msg;
}
