
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/app_routes.dart';
import 'package:exam_app/feature/sign_in/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

void main (){

runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SignIn.routeName,
      routes: AppRoutes.routes
    );
  }
}
