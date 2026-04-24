class ProfileModels {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final DateTime createdAt;
  final String passwordResetCode;
  final DateTime passwordResetExpires;
  final bool resetCodeVerified;


  ProfileModels({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
    required this.passwordResetCode,
    required this.passwordResetExpires,
    required this.resetCodeVerified,
  });
  }