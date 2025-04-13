class ForgotPasswordRequest {
  final String email;

  ForgotPasswordRequest({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class VerifyPasswordResetRequest {
  final String email;
  final int code;

  VerifyPasswordResetRequest({required this.email, required this.code});

  Map<String, dynamic> toJson() => {'email': email, 'code': code};
}

class ResetPasswordRequest {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final int code;

  ResetPasswordRequest({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
        'code': code,
      };
}