import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/events/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/states/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routeName = 'forget-password';

  ForgetPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text('Password', style: AppTheme.lightTheme.textTheme.bodyLarge),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "Forget password",
                style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Please enter your email associated to\nyour account",
                textAlign: TextAlign.center,
                style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: "Enter your email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (!state.forgotPasswordState.isLoading) {
                    if (state.forgotPasswordState.msg != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.forgotPasswordState.msg ?? "No Content",
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (state.forgotPasswordState.data != null) {
                      Navigator.pushNamed(
                        context,
                        'email-verification',
                        arguments: emailController.text,
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state.forgotPasswordState.isLoading
                          ? null
                          : () {
                              context.read<ForgotPasswordCubit>().onEvent(
                                SendEmailEvent(
                                  email: emailController.text.trim(),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: state.forgotPasswordState.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
