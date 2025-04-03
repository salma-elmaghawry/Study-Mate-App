import 'package:dio/dio.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/login/data/models/login_model.dart';

class loginRepository {
  final ApiService apiService;
  loginRepository(this.apiService);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await apiService.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
