import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/dialog_utils.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/states/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = 'reset-password';
  ResetPasswordView({super.key});

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCubit cubit = getIt.get<ForgotPasswordCubit>();

    return BlocProvider<ForgotPasswordCubit>(
      create: (_) => cubit,
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
                "Reset password",
                style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New password',
                  hintText: "Enter your password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                  hintText: "Confirm password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (!state.resetPasswordState.isLoading) {
                    if (state.resetPasswordState.msg != null) {
                      DialogUtils.showMessage(
                        context,
                        message: state.resetPasswordState.msg!,
                      );
                    } else if (state.resetPasswordState.data != null) {
                      DialogUtils.showMessage(
                        context,
                        message: "Password reset successful",
                      );
                      Navigator.pushNamed(context, 'sign-in');
                    }
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state.resetPasswordState.isLoading
                          ? null
                          : () {
                              final newPassword = newPasswordController.text
                                  .trim();
                              final confirmPassword = confirmPasswordController
                                  .text
                                  .trim();

                              if (newPassword != confirmPassword) {
                                DialogUtils.showMessage(
                                  context,
                                  message: "Passwords do not match",
                                );
                                return;
                              }

                              // Only pass newPassword now, no email
                              cubit.resetPassword(
                                newPassword: newPassword,
                                confirmPassword: confirmPassword,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: state.resetPasswordState.isLoading
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
