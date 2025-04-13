import 'package:dio/dio.dart' show DioException;
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_model.dart';

class ForgotPasswordRepo {
  final ApiService apiService;

  ForgotPasswordRepo(this.apiService);

  Future<void> sendResetCode(String email) async {
    try {
      await apiService.post(
        ApiConstants.forgotPassword,
        data: ForgotPasswordRequest(email: email).toJson(),
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to send reset code',
      );
    }
  }

  Future<void> verifyPasswordResetOtp(int code) async {
    try {
      await apiService.post(
        '${ApiConstants.verifyPasswordResetOtp}?code=$code',
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Verification failed');
    }
  }
   Future<void> resendOtp(String email) async {
    try {
      await apiService.post(
        ApiConstants.forgotPassword,
        data: {'email': email},
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to resend OTP');
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await apiService.post(ApiConstants.resetPassword, data: request.toJson());
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Password reset failed');
    }
  }
}
