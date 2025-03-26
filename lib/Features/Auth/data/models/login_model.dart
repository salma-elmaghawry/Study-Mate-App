class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
class LoginResponse {
  final bool isSuccess;
  final String token;
  final String? message;
  final String refreshToken;
  final String role;

  LoginResponse({
    required this.isSuccess,
    required this.token,
    this.message,
    required this.refreshToken,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      isSuccess: json['isSuccess'],
      token: json['token'],
      message: json['message'],
      refreshToken: json['refreshToken'],
      role: json['role'],
    );
  }
}
