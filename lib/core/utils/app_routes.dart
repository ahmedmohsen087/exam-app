import 'package:exam_app/features/Home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/pages/sign_in_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignInScreen.routeName: (_) => SignInScreen(),
    HomeScreen.routeName: (_) => HomeScreen(),
  };
}
