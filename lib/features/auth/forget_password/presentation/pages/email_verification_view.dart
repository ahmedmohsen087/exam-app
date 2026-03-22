import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/events/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/states/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart'; // استدعاء الباكيج

class EmailVerificationView extends StatelessWidget {
  static const String routeName = 'email-verification';

  EmailVerificationView({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCubit cubit = getIt<ForgotPasswordCubit>();
    final email = ModalRoute.of(context)!.settings.arguments as String;

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
                "Email verification",
                style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Please enter the code sent to your\nemail address",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),

              // استخدام Pinput بدل الـ Row
              Pinput(
                length: 6,
                controller: otpController,
                defaultPinTheme: PinTheme(
                  width: 65,
                  height: 65,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 65,
                  height: 65,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.blue),
                  ),
                ),
                onCompleted: (pin) {
                  // ممكن تحط أي كود هنا لو حابب يتم الضغط تلقائي
                },
              ),

              const SizedBox(height: 40),

              BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (!state.verifyCodeState.isLoading) {
                    if (state.verifyCodeState.msg != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.verifyCodeState.msg!),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else if (state.verifyCodeState.data != null) {
                      Navigator.pushNamed(
                        context,
                        'reset-password',
                        arguments: email,
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state.verifyCodeState.isLoading
                          ? null
                          : () {
                              final code = otpController.text;

                              context.read<ForgotPasswordCubit>().onEvent(
                                VerifyResetCodeEvent(resetCode: code),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: state.verifyCodeState.isLoading
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
