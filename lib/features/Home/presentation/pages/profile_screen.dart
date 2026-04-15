
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'User name',
                hintText: "Enter your user name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      hintText: "Enter first name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      hintText: "Enter last name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Enter password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone number',
                hintText: "Enter phone number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gray,
                ),
                onPressed: () {
                },
                child: Text(
                  'Update',
                  style: AppTheme.lightTheme.textTheme.bodyMedium,
                )
              ),
            ),



          ],
        ),
      ),
    ),
    );
  }
}
