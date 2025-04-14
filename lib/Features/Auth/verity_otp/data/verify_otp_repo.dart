import 'package:dio/dio.dart' show DioException;
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/verity_otp/data/verify_otp_model.dart';

class VerifyEmailRepo {
  final ApiService apiService;

  VerifyEmailRepo(this.apiService);

  Future<void> verifyEmail(VerifyEmailRequestModel verify) async {
    try {
      final response = await apiService.post(
        ApiConstants.verifyEmail,
        data: verify.toJson(),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Verification failed');
    }
  }

  Future<void> resendOtp(String email) async {
    try {
      await apiService.post(
        "${ApiConstants.requestEmailVerification}?email=$email",
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Email verification failed',
      );
    }
  }
}
