import 'package:exam_app/features/auth/forget_password/presentation/pages/email_verification_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/forget_password_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/reset_password_view.dart';
import 'package:exam_app/features/exam_questions/presentation/pages/exam_score_page.dart';
import 'package:flutter/material.dart';
import '../../features/Home/presentation/pages/home_screen.dart';
import '../../features/auth/sign_in/presentation/pages/sign_in_screen.dart';
import '../../features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import '../../features/exam_details/presentation/pages/exam_details_screen.dart';
import '../../features/exam_details/presentation/pages/start_exam_screen.dart';
import '../../features/exam_questions/presentation/pages/exam_questions_page_screen.dart';
import '../../features/profile/presentation/pages/edit_profile_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignInScreen.routeName: (context) => SignInScreen(),
    ForgetPasswordView.routeName: (context) => ForgetPasswordView(),
    EmailVerificationView.routeName: (context) => EmailVerificationView(),
    ResetPasswordView.routeName: (context) => ResetPasswordView(),
    SignUpScreen.routeName: (_) => SignUpScreen(),
    HomeScreen.routeName: (_) => HomeScreen(),
    ExamDetailsScreen.routeName: (_) => ExamDetailsScreen(),
    ExamQuestionsPageScreen.routeName: (_) => ExamQuestionsPageScreen(),
    StartExamScreen.routeName: (_) => StartExamScreen(),
    ExamScorePage.routeName : (_)=> ExamScorePage(),
    EditProfileScreen.routeName: (_) => EditProfileScreen(),
  };
}
