class LoginEntity {
  final String token;
  final String refreshToken;
  final String role;

  LoginEntity({
    required this.token,
    required this.refreshToken,
    required this.role,
  });
}