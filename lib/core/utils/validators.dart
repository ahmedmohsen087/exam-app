class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Email is not vaild';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Password';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain:\n'
          '• At least 8 characters\n'
          '• One uppercase letter\n'
          '• One number';
    }

    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Code cannot be empty";
    }
    if (value.length < 4) {
      return "Please enter the full 4-digit code";
    }
    // You can add a check if it's numeric only
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Invalid code format";
    }
    return null;
  }
}
