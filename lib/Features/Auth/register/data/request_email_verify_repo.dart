import 'package:dio/dio.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';

class EmailVerificationRepo {
  final ApiService apiService;

  EmailVerificationRepo(this.apiService);

  Future<void> requestEmailVerification(String email) async {
    try {
      await apiService.post(
        "${ApiConstants.requestEmailVerification}?email=$email",
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Email verification failed');
    }
  }
}
