import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'reset-password';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Reset Password'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: AppColors.white,
          child: Column(

            spacing: 20,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  hintText: 'Current password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'New password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gray,
                  ),
                  onPressed: () {

                  },
                  child: Text('Reset Password',
                    style: AppTheme.lightTheme.textTheme.bodyMedium,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
