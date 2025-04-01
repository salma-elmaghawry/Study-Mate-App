import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Features/Auth/data/auth_repo.dart';
import 'package:study_mate/Features/Auth/data/models/login_model.dart';
import 'package:study_mate/Features/Auth/data/models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register(String email, String password,String firstName ,String lastName ,String confirmPassword) async {
    emit(RegisterLoading());
    try {
      final response = await authRepository.register(
        RegisterRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          confirmPassword: confirmPassword,
        ),
      );
      emit(RegisterSuccess(response));
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
