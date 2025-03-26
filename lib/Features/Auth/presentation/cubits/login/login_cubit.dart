import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Features/Auth/data/auth_repo.dart';
import 'package:study_mate/Features/Auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.login(LoginRequest(email: email, password: password));
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
