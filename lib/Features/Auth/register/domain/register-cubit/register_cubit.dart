import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/register/data/models/register_model.dart';
import 'package:study_mate/Features/Auth/register/data/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterRepo registerRepo) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String confirmPassword,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      final registerRepo = RegisterRepo(getIt<ApiService>());
      final response = await registerRepo.register(
        RegisterRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          confirmPassword: confirmPassword,
        ),
      );
      emit(RegisterSuccess(response,email));
    } catch (error) {
      String errorMessage = error.toString();

      if (error is DioException) {
        if (error.response?.data != null &&
            error.response?.data["message"] != null) {
          errorMessage = error.response!.data["message"];
        }
      }
      emit(RegisterFailure(errorMessage));
    }
  }
}
