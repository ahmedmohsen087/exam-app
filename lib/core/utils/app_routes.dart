import 'package:exam_app/features/auth/forget_password/presentation/pages/email_verification_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/forget_password_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/reset_password_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/pages/sign_in.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignIn.routeName: (context) => SignIn(),
    ForgetPasswordView.routeName: (context) => ForgetPasswordView(),
    EmailVerificationView.routeName: (context) => EmailVerificationView(),
    ResetPasswordView.routeName: (context) => ResetPasswordView(),
  };
}
