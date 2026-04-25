import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/core/utils/validators.dart';
import 'package:exam_app/features/profile/presentation/view_model/cubit/reset_password_cubit.dart';
import 'package:exam_app/features/profile/presentation/view_model/states/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'reset-password';

  ResetPasswordScreen({super.key});

  final ResetPasswordCubit resetPasswordCubit = getIt.get<ResetPasswordCubit>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;

    resetPasswordCubit.resetPassword(
      currentPassword: currentPasswordController.text.trim(),
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => resetPasswordCubit..clearState(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          final message = state.resetPasswordState.msg;
          if (message == null || message.isEmpty) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );

          if (message == 'Password reset successfully') {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const Text('Reset Password'),
              centerTitle: false,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        controller: currentPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Current Password',
                          hintText: 'Current password',
                          floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                        ),
                        validator: Validators.passwordValidator,
                      ),
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                          hintText: 'New password',
                          floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                        ),
                        validator: Validators.passwordValidator,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm password',
                          floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                        ),
                        validator: Validators.passwordValidator,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.gray,
                          ),
                          onPressed: state.resetPasswordState.isLoading
                              ? null
                              : _submit,
                          child: state.resetPasswordState.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Reset Password',
                                  style:
                                      AppTheme.lightTheme.textTheme.bodyMedium,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
