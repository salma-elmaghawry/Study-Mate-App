import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/login/data/login_repo.dart';
import 'package:study_mate/Features/Auth/login/data/models/login_model.dart';
import 'package:study_mate/config/cache/cache_const.dart';
import 'package:study_mate/config/cache/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final loginRepository authRepository;
  final ApiService apiService = ApiService(getIt<Dio>());

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.login(
        LoginRequest(email: email, password: password),
      );
      saveUserToken(response.token ?? " ");
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

  void saveUserToken(String token) async {
    await CacheHelper.setSecureData(
      key: CacheConstants.userToken,
      value: token,
    );
    ApiService(getIt<Dio>());

    apiService.setTokenAfterLogin(token);
  }

  
 

  
}
