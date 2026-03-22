sealed class ForgetPasswordEvents {}

class SendEmailEvent extends ForgetPasswordEvents {
  final String email;

  SendEmailEvent({required this.email});
}

class VerifyResetCodeEvent extends ForgetPasswordEvents {
  final String resetCode;

  VerifyResetCodeEvent({required this.resetCode});
}

class ResetPasswordEvent extends ForgetPasswordEvents {
  final String newPassword;
  final String confirmPassword;
  final String email;

  ResetPasswordEvent({
    required this.newPassword,
    required this.confirmPassword,
    required this.email,
  });
}
