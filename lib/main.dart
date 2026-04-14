import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'features/Home/presentation/pages/home_screen.dart';
import 'features/auth/sign_in/presentation/pages/sign_in_screen.dart';
import 'features/auth/sign_up/presentation/pages/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
