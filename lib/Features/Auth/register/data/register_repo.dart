import 'package:dio/dio.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/register/data/models/register_model.dart';

class RegisterRepo {
  final ApiService apiService;
  RegisterRepo(this.apiService);

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await apiService.post(
        ApiConstants.register,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Registration failed');
    }
  }
}
