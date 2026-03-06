class Validators {

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Email';
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

    final passwordRegex =
    RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain:\n'
          '• At least 8 characters\n'
          '• One uppercase letter\n'
          '• One number';
    }

    return null;
  }

}

