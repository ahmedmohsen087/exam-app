import 'package:exam_app/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignUpScreen.routeName: (_) => SignUpScreen(),
  };
}
