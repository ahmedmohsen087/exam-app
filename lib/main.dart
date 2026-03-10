import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/app_routes.dart';
import 'package:exam_app/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'config/di/di.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SignUpScreen.routeName,
      routes: AppRoutes.routes,
    );
  }
}
