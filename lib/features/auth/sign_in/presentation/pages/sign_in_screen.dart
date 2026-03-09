import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/dialog_util.dart';
import 'package:exam_app/features/Home/presentation/pages/home_screen.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/States/sign_in_state.dart';
import 'package:exam_app/features/auth/sign_in/presentation/view_model/cubit/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/validators.dart';

class SignInScreen extends StatelessWidget {
  SignInViewModel _signInViewModel = getIt<SignInViewModel>();
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
                      Checkbox(value: rememberMe, onChanged: (value) {}),
                      Text(
                        'Remember me',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
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
                      onPressed: ()  {
                        if (formKey.currentState!.validate()) {
                           _signInViewModel.signIn(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child: BlocConsumer<SignInViewModel, SignInState>(
                        builder: (context, state) {
                          print("listener: ${state.api1State.msg}");
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
                          print("listener: ${state.api1State.msg}");
                          if (state.api1State.isLoading == false &&
                              state.api1State.msg == null) {
                            Navigator.of(
                              context,
                            ).pushNamed(HomeScreen.routeName);
                          } else if (state.api1State.isLoading == false &&
                              state.api1State.msg != null) {
                            DialogUtils.showMessage(
                              context,
                              message: state.api1State.msg!,
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
