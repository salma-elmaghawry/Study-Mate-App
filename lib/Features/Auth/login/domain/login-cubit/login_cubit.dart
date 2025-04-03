import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Features/Auth/login/data/login_repo.dart';
import 'package:study_mate/Features/Auth/login/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.login(
        LoginRequest(email: email, password: password),
      );
      emit(LoginSuccess(response));
    } catch (error) {
      String errorMessage = error.toString();

      if (error is DioException) {
        if (error.response?.data != null &&
            error.response?.data["message"] != null) {
          errorMessage = error.response!.data["message"];
        }
      }
      emit(LoginFailure(errorMessage));
    }
  }
}
