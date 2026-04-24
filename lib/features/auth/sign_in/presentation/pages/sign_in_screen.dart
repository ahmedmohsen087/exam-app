import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/forget_password_view.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/States/sign_in_state.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/cubit/sign_in_view_model.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/events/sign_in_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/validators.dart';
import '../../../../Home/presentation/pages/home_screen.dart';

class SignInScreen extends StatelessWidget {
  final SignInViewModel _signInViewModel = getIt<SignInViewModel>();
  static const String routeName = 'sign-in';

  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      body: BlocProvider(
        create: (context) => _signInViewModel,
        child: Form(
          key: formKey,
          child: Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: "Enter your Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: Validators.emailValidator,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Enter you password ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: Validators.passwordValidator,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(value: rememberMe, onChanged: (value) {
                        rememberMe = value!;
                      }),
                      Text(
                        'Remember me',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ForgetPasswordView.routeName,
                          );
                        },
                        child: Text(
                          'Forget password ?',
                          style: AppTheme.lightTheme.textTheme.bodySmall
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {

                          if (rememberMe) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('email', emailController.text);
                            await prefs.setString('password', passwordController.text);
                          }

                          _signInViewModel.doEvent(
                            SignInEvent(
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                        }
                      },
                      child: BlocConsumer<SignInViewModel, SignInState>(
                        builder: (context, state) {
                          if (state.api1State.isLoading == true) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Text(
                              'Login',
                              style: AppTheme.lightTheme.textTheme.bodyMedium,
                            );
                          }
                        },
                        listener: (context, state) {
                          if (state.api1State.isLoading == false &&
                              state.api1State.msg == null) {
                            Navigator.of(
                              context,
                            ).pushNamed(HomeScreen.routeName);
                          } else if (state.api1State.isLoading == false &&
                              state.api1State.msg != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.api1State.msg!),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTheme.lightTheme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      Text(
                        'Sign up ',
                        style: AppTheme.lightTheme.textTheme.bodyMedium
                            ?.copyWith(
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
