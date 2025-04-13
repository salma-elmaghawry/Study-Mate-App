import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_model.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_repo.dart';

part 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo repo;

  ForgotPasswordCubit(this.repo) : super(ForgotPasswordInitial());

  Future<void> sendResetCode(String email) async {
    emit(ForgotPasswordLoading());
    try {
      await repo.sendResetCode(email);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordFailure(e.toString()));
    }
  }

  Future<void> verifyResetCode({
    required String email,
    required int code,
  }) async {
    emit(VerifyResetCodeLoading());
    try {
      await repo.verifyResetCode(email: email, code: code);
      emit(VerifyResetCodeSuccess(code.toString()));
    } catch (e) {
      emit(VerifyResetCodeFailure(e.toString()));
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoading());
    try {
      await repo.resetPassword(request);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
