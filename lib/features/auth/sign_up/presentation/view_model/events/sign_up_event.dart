class SignUpEvent {
  SignUpEvent({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.rePassword,
    required this.phone,
  });

  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
}
