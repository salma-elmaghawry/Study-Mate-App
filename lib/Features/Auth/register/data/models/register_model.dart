class RegisterRequest {
  final String email;
  final String password;
  final String? confirmPassword;
  final String firstName;
  final String? lastName;

  RegisterRequest({
    required this.email,
    required this.password,
    this.confirmPassword,
    required this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "firstName": firstName,
      "lastName": lastName,
    };
  }
}

class RegisterResponse {
  final String message;
  final bool isSuccess;

  RegisterResponse({required this.message, required this.isSuccess});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      isSuccess: json['isSuccess'],
    );
  }
}
