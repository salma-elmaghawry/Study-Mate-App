class VerifyEmailRequestModel {
  final String email;
  final int code;

  VerifyEmailRequestModel({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {'email': email, 'code': code};
  }

  factory VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailRequestModel(email: json['email'], code: json['code']);
  }
}
