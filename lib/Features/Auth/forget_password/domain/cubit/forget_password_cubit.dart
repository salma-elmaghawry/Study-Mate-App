import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_model.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_repo.dart';
import 'package:study_mate/Features/Auth/verity_otp/domain/cubit/verify_otp_cubit.dart';

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

  Future<void> verifyResetCode(int code) async {
    emit(VerifyResetCodeLoading());
    try {
      await repo.verifyPasswordResetOtp(code);
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
