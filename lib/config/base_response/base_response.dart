sealed class BaseResponse<T> {}

class Success<T> extends BaseResponse<T> {
  Success({required this.data});

  T data;
}

class Failed<T> extends BaseResponse<T> {
  Failed({this.msg});

  String? msg;
}
