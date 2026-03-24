import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:exam_app/features/sprint-two/exam_details/presentation/pages/exam_details_screen.dart';
import 'package:flutter/material.dart';

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
      print("hashToken is $hashCode");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ExamDetailsScreen.routeName);
          },
          child: Text('Go To Exam Details'),
        ),
        // child: hashToken == null
        //     ? CircularProgressIndicator(color: Colors.black)
        //     : Text(hashToken!, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
