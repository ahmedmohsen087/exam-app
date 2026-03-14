import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/app_routes.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/forget_password_view.dart';
import 'package:exam_app/features/auth/sign_in/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: ForgetPasswordView.routeName,
      routes: AppRoutes.routes,
    );
  }
}
