import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/validators.dart';
import 'package:exam_app/features/auth/sign_in/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'sign-up';
  SignUp({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool rememberMe = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios_new_outlined),
            SizedBox(width: 10),
            Text('Login', style: AppTheme.lightTheme.textTheme.bodyLarge),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                /// USERNAME
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'User name',
                    hintText: "Enter your user name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: Validators.userNameValidator,
                ),

                SizedBox(height: 20),

                /// FIRST + LAST
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: firstNameController,
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
                        controller: lastNameController,
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

                /// EMAIL
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "Enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: Validators.emailValidator,
                ),

                SizedBox(height: 20),

                /// PASSWORD + CONFIRM
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: "Enter password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          hintText: "Confirm password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) =>
                            Validators.confirmPasswordValidator(
                              value,
                              passwordController.text,
                            ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                /// PHONE
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    hintText: "Enter phone number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(height: 30),

                /// SIGN UP BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // signup logic
                      }
                    },
                    child: Text(
                      'Signup',
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// LOGIN LINE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignIn.routeName);
                      },
                      child: Text(
                        'Login',
                        style: AppTheme.lightTheme.textTheme.bodyMedium
                            ?.copyWith(
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
