import 'dart:async';
import 'package:dio/dio.dart';

sealed class BaseResponse<T> {}

class Success<T> extends BaseResponse<T> {
  Success({required this.data});

  T? data;
}

class Failed<T> extends BaseResponse<T> {
  Failed({this.error, this.msg}) {
    msg = msg ?? extractErrorMessage(error);
  }

  final Object? error;
  String? msg;
}

String extractErrorMessage(Object? e) {
  print("extract error msg");
  print("error type is ${e.runtimeType}");
  if (e is DioException) {
    return e.response?.data["message"];
  } else if (e is TimeoutException) {
    return "Connection Time Out";
  } else {
    return "Some Thing Went Wrong";
  }
}
