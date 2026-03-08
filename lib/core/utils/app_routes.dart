import 'package:exam_app/features/auth/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/pages/sign_in.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignIn.routeName: (context) => SignIn(),
    SignUp.routeName: (context) => SignUp(),
  };
}
