import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_param.dart';
import '../../../exam_details/presentation/pages/exam_details_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? hashToken;

  @override
  void initState() {
    SecureStorageService.token.then((value) {
      setState(() {
        hashToken = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              ExamDetailsScreen.routeName,
              arguments: {
               AppParam.subjectId: "670037f6728c92b7fdf434fc",
              },
            );
          },
          child: Text('Go To Exam Details'),
        ),
      ),
    );
  }
}
