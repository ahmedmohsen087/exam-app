class EditProfileModels {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final String password;
  final bool isVerified;
  final DateTime createdAt;

  const EditProfileModels({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.password,
    required this.isVerified,
    required this.createdAt,
  });
}