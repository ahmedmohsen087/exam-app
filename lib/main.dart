import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/app_routes.dart';
import 'package:exam_app/features/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:exam_app/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'features/exam_questions/presentation/pages/exam_questions_page_screen.dart';

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
      initialRoute: HomeScreen.routeName,
      routes: AppRoutes.routes,
    );
  }
}
